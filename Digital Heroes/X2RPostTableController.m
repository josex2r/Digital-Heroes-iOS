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

@interface X2RPostTableController ()

@end

@implementation X2RPostTableController
{
    X2RBlog *blog;
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
    blog = [X2RBlog sharedBlog];
    //Load posts
    [self loadFeed:YES];
    
    pageController = ((X2RPageViewController*)[self.tabBarController.viewControllers objectAtIndex:0]);
    currentPage = [pageController.pages indexOfObject:self.navigationController];
    
    //Add left arrow
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_left_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(navItemPressed:)];
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
    //Add right arrow
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_right_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(navItemPressed:)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
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
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        post.image = [UIImage imageWithData:imageData];
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
        [self performSelectorInBackground:@selector(loadFeed:) withObject:NO];
    }
    
    return cell;
}

-(void) loadFeed:(BOOL)cleanTable{
    if( cleanTable ){
        self.navigationItem.title = blog.activeFilter.name;
        [self.postList removeAllObjects];
        [self.tableView reloadData];
    }
    
    blog.isLoading = YES;
    
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(concurrentQueue, ^{
        NSString *finalFeedUrl = [NSString stringWithFormat:@"%@?paged=%d", blog.activeFilter.feedUrl, blog.currentPage];
        NSURL *allPostFeedUrl = [NSURL URLWithString:finalFeedUrl];
        
        X2RXMLPullParser *parser = [[X2RXMLPullParser alloc] initWithContentsOfURL:allPostFeedUrl andCompletionBlock:^(NSMutableArray *posts) {
            //Load post into data source
            [self.postList addObjectsFromArray:posts];
            //Reload table
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
            
            blog.isLoading = NO;
        }];
        
        [parser parse];
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

@end
