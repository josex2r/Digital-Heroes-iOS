//
//  X2RGenericTabBarController.m
//  Digital Heroes
//
//  Created by Jose-OSX on 15/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RGenericTabBarController.h"
#import "X2RGenericNavigationController.h"
#import "X2RPostTableController.h"
#import "X2RPageViewController.h"
#import "X2RColors.h"
#import "X2RBlogFilter.h"
#import "X2RBlog.h"

@interface X2RGenericTabBarController ()

@end

@implementation X2RGenericTabBarController
{
    X2RBlogFilter *prevFilter;
    X2RBlog *blog;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    blog = [X2RBlog sharedBlog];
    
    [self.tabBar setBarTintColor:[UIColor whiteColor]];
    [self.tabBar setTintColor:[X2RColors redColor]];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[X2RColors redColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    int index = [self.tabBar.items indexOfObject:item];
    /*if( index==1 ){
        prevFilter = blog.activeFilter;
        blog.activeFilter = [blog getFiltersByName:@"Favoritos"];
    }else{
        blog.activeFilter = prevFilter;
    }*/
    
    X2RPostTableController *tableViewController;
    
    NSLog(@"Switching to tab %d", index);
    if( index==1 ){
        //Get the table view controller
        tableViewController = [((X2RGenericNavigationController*)[self.childViewControllers objectAtIndex:1]).childViewControllers firstObject];
        //Save current filter
        prevFilter = blog.activeFilter;
        //Last object is Favourites
        blog.activeFilter = [blog.filters lastObject];
        //Reload table
        [tableViewController loadFeedWithFilter:blog.activeFilter andClean:YES];
    }else{
        //Get the table view controller
        tableViewController = [((X2RGenericNavigationController*)[((X2RPageViewController*)[self.childViewControllers objectAtIndex:0]).pages objectAtIndex:1]).childViewControllers firstObject];
        //Save current filter
        blog.activeFilter = prevFilter;
        //Reload table
        blog.currentPage = 1;
        [tableViewController loadFeedWithFilter:blog.activeFilter andClean:YES];
    }
    
}


@end
