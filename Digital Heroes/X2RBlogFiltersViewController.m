//
//  X2RCategoriesViewController.m
//  Digital Heroes
//
//  Created by Jose-OSX on 08/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RBlogFiltersViewController.h"
#import "X2RBlog.h"
#import "X2RBlogFilter.h"
#import "NSString+FontAwesome.h"
#import "FlatButton.h"

@interface X2RBlogFiltersViewController ()

@end

@implementation X2RBlogFiltersViewController

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
    /*
    //Enable scroll
    //self.scrollView.delegate = self;
    self.scrollView.scrollEnabled = YES;
    
	//Get blog categories
    X2RBlog *blog = [X2RBlog sharedBlog];
    NSArray *categories = [blog getFiltersByType:[X2RBlogFilter typeCategory]];
    
    int totalHeight = 0;
    
    for(int i=0; i<[categories count]; i++){
        UIButton *flatCategoryBtn = [[FlatButton alloc] initWithFrame:CGRectMake(20, 100*i, 280, 40) withBackgroundColor:[UIColor greenColor]];
        flatCategoryBtn.layer.cornerRadius = 10;
        [flatCategoryBtn setTitle:((X2RBlogFilter*)[categories objectAtIndex:i]).name forState:UIControlStateNormal];
        [flatCategoryBtn addTarget:self action:@selector(flatBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:flatCategoryBtn];
        
        totalHeight += 280;
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.contentSize.width, totalHeight+1000);
    
    /*NSString *iconGithub = [NSString fontAwesomeIconStringForEnum:FAGithub];
    UIFont *fontAwesome = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    
    self.btnTest.titleLabel.font = fontAwesome;
    [self.btnTest setTitle:[NSString stringWithFormat:@"%@", iconGithub] forState:UIControlStateNormal];
    
    
    UILabel *test = [[UILabel alloc] initWithFrame:CGRectMake(0,5,100,20)];
    test.font = fontAwesome;
    test.text = [NSString stringWithFormat:@"%@", iconGithub];
    [self.view addSubview:test];
    
    
    UIButton *flatBtn = [[FlatButton alloc] initWithFrame:CGRectMake(20, 350, 280, 40) withBackgroundColor:[UIColor greenColor]];
    flatBtn.layer.cornerRadius = 10;
    [flatBtn setTitle:iconGithub forState:UIControlStateNormal];
    flatBtn.titleLabel.font = fontAwesome;
    [flatBtn addTarget:self action:@selector(flatBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:flatBtn];*/
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)flatBtnPressed:(id)button{
    NSLog(@"Flat btn pressed");
}

@end
