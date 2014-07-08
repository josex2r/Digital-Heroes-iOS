//
//  X2RCategoriesViewController.m
//  Digital Heroes
//
//  Created by Jose-OSX on 08/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RCategoriesViewController.h"
#import "NSString+FontAwesome.h"

@interface X2RCategoriesViewController ()

@end

@implementation X2RCategoriesViewController

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
    NSString *iconGithub = [NSString fontAwesomeIconStringForEnum:FAGithub];
    
    self.btnTest.titleLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    
    [self.btnTest setTitle:[NSString stringWithFormat:@"%@", iconGithub] forState:UIControlStateNormal];
    
    UILabel *test = [[UILabel alloc] initWithFrame:CGRectMake(0,5,100,20)];
    test.font = [UIFont fontWithName:kFontAwesomeFamilyName size:20];
    test.text = [NSString stringWithFormat:@"%@", iconGithub];
    [self.view addSubview:test];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
