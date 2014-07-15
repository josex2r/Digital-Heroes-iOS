//
//  X2RPageViewController.m
//  Digital Heroes
//
//  Created by Jose-OSX on 25/06/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RPageViewController.h"
#import "X2RFiltersTableController.h"

@interface X2RPageViewController ()

@end

@implementation X2RPageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //Set view pages
    self.pages = @[
               [self.storyboard instantiateViewControllerWithIdentifier:@"BlogFilters"],
               [self.storyboard instantiateViewControllerWithIdentifier:@"BlogPosts"],
               [self.storyboard instantiateViewControllerWithIdentifier:@"BlogFilters"]
               ];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    //Initialize datasource and delegate
    self.pageController.dataSource = self;
    self.pageController.delegate = self;
    
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    self.currentIndex = 1;
    NSArray *viewControllers = [NSArray arrayWithObjects:[self.pages objectAtIndex:1], nil];
    
    [self.pageControl setNumberOfPages:[self.pages count]];
    [self.pageControl setCurrentPage:1];
    [self.pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    
    [self.view addSubview:[self.pageController view]];
    [self.view addSubview:self.pageControl];
    [self.pageController didMoveToParentViewController:self];
    
    [self.view sendSubviewToBack:[self.pageController view]];
    
    //[self.view bringSubviewToFront:self.pageControl];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    NSUInteger index = [self.pages indexOfObject:viewController];
    [self.pageControl setCurrentPage:index];
    
    if( index>0 ){
        return [self.pages objectAtIndex:index-1];
    }
    return nil;
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index = [self.pages indexOfObject:viewController];
    [self.pageControl setCurrentPage:index];
    
    if( index<[self.pages count]-1 ){
        return [self.pages objectAtIndex:index+1];
    }
    return nil;
}

-(void)changePage:(id)sender{
    UIViewController *visibleViewController = self.pageController.viewControllers[0];
    NSUInteger index = [self.pages indexOfObject:visibleViewController];
    
    NSArray *viewControllers = @[[self.pages objectAtIndex:self.pageControl.currentPage]];
    
    if( self.pageControl.currentPage>index ){
        [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    }else{
        [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:YES completion:nil];
    }
}

-(void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed{
    if( completed ){
        UIViewController *visibleViewController = self.pageController.viewControllers[0];
        self.currentIndex = [self.pages indexOfObject:visibleViewController];
        
        self.isTransitioning = NO;
    }
}

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers{
    self.isTransitioning = YES;
}

@end
