//
//  X2RFiltersTableViewController.m
//  Digital Heroes
//
//  Created by Jose-OSX on 15/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RFiltersTableController.h"
#import "X2RPageViewController.h"
#import "X2RBlog.h"
#import "X2RBlogFilter.h"
#import "NSString+FontAwesome.h"
#import "FAImageView.h"
#import "X2RPostTableController.h"

@interface X2RFiltersTableController ()

@end

@implementation X2RFiltersTableController
{
    int currentPage;
    X2RPageViewController *pageController;
    X2RBlog *blog;
    NSArray *filters;
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //currentPage = ((X2RPageViewController*)self.parentViewController.parentViewController).currentIndex;
    
    blog = [X2RBlog sharedBlog];
    
    pageController = ((X2RPageViewController*)[self.tabBarController.viewControllers objectAtIndex:0]);
    currentPage = [pageController.pages indexOfObject:self.navigationController];
    
    if( currentPage==0 ){
        //Categories
        filters = [blog getFiltersByType:[X2RBlogFilter typeCategory]];
        self.navigationItem.title = @"Categorías";
        
        //Add right arrow
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_right_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(navItemPressed:)];
        [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
    }else{
        //Authors
        filters = [blog getFiltersByType:[X2RBlogFilter typeAuthor]];
        self.navigationItem.title = @"Super Héroes";
        
        //Add left arrow
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ic_left_arrow"] style:UIBarButtonItemStylePlain target:self action:@selector(navItemPressed:)];
        [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [filters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FilterCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if( cell==nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //Get current filter
    X2RBlogFilter *filter = [filters objectAtIndex:indexPath.row];
   
    UIButton *iconFilter = (UIButton*)[cell.contentView viewWithTag:987654321];
    //FlatButton *iconFilter = (FlatButton*)[cell.contentView viewWithTag:987654321];
    UIButton *btnFilter = (UIButton*)[cell.contentView viewWithTag:123456789];
    //FlatButton *btnFilter = (FlatButton*)[cell.contentView viewWithTag:123456789];
    
    if( iconFilter==nil ){
        //Icon button
        //iconFilter = [[FlatButton alloc] initWithFrame:CGRectMake(10, 10, 65, 60) withBackgroundColor:filter.color];
        iconFilter = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 65, 60)];
        iconFilter.backgroundColor = filter.color;
        iconFilter.layer.cornerRadius = 2;
        iconFilter.tag = 987654321;
        [iconFilter addTarget:self action:@selector(flatBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:iconFilter];
    }
    
    if( btnFilter==nil ){
        //Text button
        //btnFilter = [[FlatButton alloc] initWithFrame:CGRectMake(70, 10, 240, 60) withBackgroundColor:filter.color];
        btnFilter = [[UIButton alloc] initWithFrame:CGRectMake(70, 10, 240, 60)];
        btnFilter.backgroundColor = filter.color;
        btnFilter.layer.cornerRadius = 2;
        btnFilter.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        btnFilter.tag = 123456789;
        [btnFilter addTarget:self action:@selector(flatBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:btnFilter];
    }
    
    //Set icon
    if( filter.fontAwesome ){
        //Font icon
        [iconFilter setTitle:filter.icon forState:UIControlStateNormal];
        iconFilter.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:25];
    }else{
        //Image icon
        [iconFilter setImage:[UIImage imageNamed:filter.icon] forState:UIControlStateNormal];
        iconFilter.imageEdgeInsets = UIEdgeInsetsMake(15, 15, 15, 20);
    }
    [iconFilter setBackgroundColor:filter.color];
    
    //Set text
    [btnFilter setTitle:filter.name forState:UIControlStateNormal];
    [btnFilter setBackgroundColor:filter.color];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    //Flat button height + margins
    return 70;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void)flatBtnPressed:(id)button{
    
    //Cancel pageController touch, it will break the APP when holding down the button
    /*self.tableView.scrollEnabled = NO;
    for(UIGestureRecognizer *recognizer in pageController.pageController.gestureRecognizers){
        recognizer.enabled = NO;
    }
    for(UIScrollView *view in pageController.pageController.view.subviews){
        if([view isKindOfClass:[UIScrollView class]]){
            BOOL enabled = view.panGestureRecognizer.enabled;
            view.panGestureRecognizer.enabled = !enabled;
            view.panGestureRecognizer.enabled = enabled;
        }
    }*/
    //[button sendActionsForControlEvents:UIControlEventTouchCancel];
    //int index = [filters indexOfObject:button];
    
    
    
    UITableViewCell *cell = (UITableViewCell*)[[[button superview] superview] superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    X2RBlogFilter *selectedFilter = [filters objectAtIndex:indexPath.row];
    
    //Swap to central view
    int viewToSwapIndex = 1;
    UINavigationController *viewToSwapNavController = [pageController.pages objectAtIndex:viewToSwapIndex];
    
    X2RPostTableController *postTableController = viewToSwapNavController.viewControllers[0];
    
    //Perform slide
    UIPageControl *control = pageController.pageControl;
    [pageController.pageController setViewControllers:@[viewToSwapNavController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL completed){
        //Change circle color
        [control setCurrentPage:viewToSwapIndex];
        //Reload table if needed
        [postTableController loadFeedWithFilter:selectedFilter andClean:YES];
    }];
}

-(void)navItemPressed:(id)button{
    //Swap to central view
    int viewToSwapIndex = 1;
    UINavigationController *viewToSwapNavController = [pageController.pages objectAtIndex:viewToSwapIndex];
    if( currentPage==0 ){
        //Categories
        [pageController.pageController setViewControllers:@[viewToSwapNavController] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }else{
        //Authors
        [pageController.pageController setViewControllers:@[viewToSwapNavController] direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    }
    //Change circle color
    UIPageControl *control = pageController.pageControl;
    [control setCurrentPage:viewToSwapIndex];
}

@end
