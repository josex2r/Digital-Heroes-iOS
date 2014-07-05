//
//  X2RPageViewController.h
//  Digital Heroes
//
//  Created by Jose-OSX on 25/06/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface X2RPageViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (strong, nonatomic) NSArray *pages;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) UIPageViewController *pageController;

@property (nonatomic) int currentIndex;
@property (nonatomic) BOOL isTransitioning;

@end
