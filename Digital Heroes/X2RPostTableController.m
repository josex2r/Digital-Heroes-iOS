//
//  X2RPostTableViewController.m
//  Digital Heroes
//
//  Created by Jose-OSX on 15/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RPostTableController.h"
#import "X2RBlog.h"
#import "X2RBlogFilter.h"
#import "X2RPost.h"
#import "X2RXMLPullParser.h"
#import "X2RPageViewController.h"
#import "X2RWebViewController.h"
#import "UIFont+FontAwesome.h"
#import "X2RColors.h"
#import "X2RGenericNavigationController.h"

@interface X2RPostTableController ()

@end

static X2RBlog *blog;

@implementation X2RPostTableController
{
    int currentPage;
    X2RPageViewController *pageController;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.postList = [[NSMutableArray alloc] init];
    
    //Get blog
    if( blog==nil ){
        blog = [X2RBlog sharedBlog];
        
        //Load posts
        [self loadFeedWithFilter:blog.activeFilter andClean:YES];
        
        //Get controllers
        pageController = ((X2RPageViewController*)[self.tabBarController.viewControllers objectAtIndex:0]);
        currentPage = [pageController.pages indexOfObject:self.navigationController];
        
        //Add left arrow
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_left_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(navItemPressed:)];
        [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
        //Add right arrow
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_right_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(navItemPressed:)];
        [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
    }else{
        //Initializing favourites tab
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.postList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PostCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if( cell==nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    X2RPost *post = [self.postList objectAtIndex:indexPath.row];
    
    //Get elements
    UILabel *titleLabel = (UILabel*)[cell.contentView viewWithTag:123654789];
    UIImageView *postImage = (UIImageView*)[cell.contentView viewWithTag:987456321];
    UIActivityIndicatorView *postLoading = (UIActivityIndicatorView*)[cell.contentView viewWithTag:963852741];
    
    //Add favoutie button
    UIButton *iconFavourite = [[UIButton alloc] initWithFrame:CGRectMake(cell.frame.size.width-35, 5, 26, 26)];
    iconFavourite.backgroundColor = [X2RColors redColor];
    iconFavourite.layer.cornerRadius = 5;
    iconFavourite.tag = indexPath.row;
    [iconFavourite addTarget:self action:@selector(favouriteBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:iconFavourite];
    if( [blog isFavourite:post] ){
        [iconFavourite setTitle:[NSString fontAwesomeIconStringForEnum:FAStar] forState:UIControlStateNormal];
    }else{
        [iconFavourite setTitle:[NSString fontAwesomeIconStringForEnum:FAStarO] forState:UIControlStateNormal];
    }
    iconFavourite.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:15];
    
    
    //Draw the post
    if( post!=nil ){
        titleLabel.text = post.title;
        //Image
        if( post.image==nil ){
            postImage.image = [UIImage imageNamed:@"no_image.jpg"];
            if( [post.imageLink isEqualToString:@""] ){
                //Store no_image into post
                post.image =postImage.image;
                [postLoading setHidden:YES];
            }else{
                //Load image
                [postLoading startAnimating];
                [postLoading setHidden:NO];
                
                __block NSData *imageData;
                dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
                dispatch_async(concurrentQueue, ^{
                    imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:post.imageLink]];
                    UIImage *image = [UIImage imageWithData:imageData];
                    //Resize the image
                    //post.image = [self scaleImage:image toSize:CGSizeMake(800.0, 400.0)];
                    post.image = image;
                    
                    //Put image into the view
                    dispatch_async(dispatch_get_main_queue(), ^{
                        postImage.image = post.image;
                        [postLoading stopAnimating];
                        [postLoading setHidden:YES];
                    });
                });
            }
        }else{
            postImage.image = post.image;
            [postLoading setHidden:YES];
        }
    }
    
    //Load more posts if scroll reached -3 index row
    if( indexPath.row>=[self.postList count]-3 && !blog.isLoading ){
        blog.currentPage++;
        //Load more without clean the list
        [self performSelectorInBackground:@selector(loadNextPage) withObject:nil];
    }
    
    //Responsive view
    iconFavourite.autoresizingMask = (UIViewAutoresizingFlexibleLeftMargin);
    iconFavourite.autoresizesSubviews = YES;
    
    return cell;
}

-(void) loadNextPage{
    [self loadFeedWithFilter:blog.activeFilter andClean:NO];
}

-(void) loadFeedWithFilter:(X2RBlogFilter *)filter andClean:(BOOL)cleanTable{
    
    //Check if the web view is opened
    if( [self.navigationController.childViewControllers count]>1 ){
        //Close web view
        [self.navigationController popToRootViewControllerAnimated:NO];
    }
    
    //Reset to page 1 if switching filter
    if( ![blog.activeFilter isEqual:filter] ){
        blog.currentPage = 1;
    }
    
    //Update blog filter
    blog.activeFilter = filter;
    
    //Clean the table if requested
    if( cleanTable ){
        self.navigationItem.title = filter.name;
        [self.postList removeAllObjects];
        [self.tableView reloadData];
    }
    
    blog.isLoading = YES;
    
    //Dump post into table
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(concurrentQueue, ^{
        
        NSArray *cachedPosts = [blog getPostsFromFilter:blog.activeFilter andPage:blog.currentPage];
    
        if( cachedPosts!=nil ){
        
            [self.postList addObjectsFromArray:cachedPosts];
            [self.tableView reloadData];
            blog.isLoading = NO;
        
        }else{
            
            //Load feed from RSS
            NSString *finalFeedUrl = [NSString stringWithFormat:@"%@?paged=%d", filter.feedUrl, blog.currentPage];
            NSURL *allPostFeedUrl = [NSURL URLWithString:finalFeedUrl];
        
            X2RXMLPullParser *parser = [[X2RXMLPullParser alloc] initWithContentsOfURL:allPostFeedUrl andCompletionBlock:^(NSMutableArray *posts) {
                [blog pushPosts:posts intoFilter:filter andPage:blog.currentPage];
                //Load post into data source
                [self.postList addObjectsFromArray:posts];
                //Reload table
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.tableView reloadData];
                });
            
                blog.isLoading = NO;
            }];
            
            [parser parse];
        
        }
        
    });
}

-(void)navItemPressed:(id)button{
    //Swap to central view
    int viewToSwapIndex;
    UINavigationController *viewToSwapNavController;
    
    if( button==self.navigationItem.leftBarButtonItem ){
        //Categories
        viewToSwapIndex = 0;
        viewToSwapNavController = [pageController.pages objectAtIndex:viewToSwapIndex];
        [pageController.pageController setViewControllers:@[viewToSwapNavController] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    }else{
        //Authors
        viewToSwapIndex = 2;
        viewToSwapNavController = [pageController.pages objectAtIndex:viewToSwapIndex];
        [pageController.pageController setViewControllers:@[viewToSwapNavController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }
    //Change circle color
    UIPageControl *control = pageController.pageControl;
    [control setCurrentPage:viewToSwapIndex];
}

-(void)favouriteBtnPressed:(UIButton*)button{
    //Favourite button tag is equal to the indexPath
    X2RPost *post = [self.postList objectAtIndex:button.tag];
    
    if( [blog isFavourite:post] ){
        //RRemove post
        [blog removeFavourite:post];
        //Change icon
        [button setTitle:[NSString fontAwesomeIconStringForEnum:FAStarO] forState:UIControlStateNormal];
    }else{
        //Add post
        [blog addFavourite:post];
        //Change icon
        [button setTitle:[NSString fontAwesomeIconStringForEnum:FAStar] forState:UIControlStateNormal];
    }
    
}

-(UIImage*) scaleImage:(UIImage*)image toSize:(CGSize)newSize{
    float w = newSize.width;
    float h = newSize.height;
    
    UIGraphicsBeginImageContext(newSize);
    CGRect rect = CGRectMake(0, 0, w, h);
    
    double ratioX = image.size.width / w;
    double ratioY = image.size.height / h;
    double ratio = MAX(ratioX, ratioY);
    
    w = image.size.width / ratio;
    h = image.size.height / ratio;
    
    rect.size.width = w;
    rect.size.height = h;
    /*
    float offset  = (w-h) / 2;
    if( offset>0 ){
        rect.origin.y = offset;
    }else{
        rect.origin.x = -offset;
    }
    */
    [image drawInRect:rect];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();

    return newImage;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //[self performSegueWithIdentifier:@"ShowPost" sender:indexPath];
    X2RWebViewController *webView = [self.storyboard instantiateViewControllerWithIdentifier:@"ShowPost"];
    
    webView.post = [self.postList objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:webView animated:YES];
}

@end
