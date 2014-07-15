//
//  X2RWebViewController.m
//  Digital Heroes
//
//  Created by Jose Luis on 05/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RWebViewController.h"

@interface X2RWebViewController ()

@end

@implementation X2RWebViewController

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
    self.webView.delegate = self;
    self.navigationItem.title = self.post.title;
    
    NSString *deviceLink = [NSString stringWithFormat:@"%@&android=true", self.post.link];
    
    NSURL *url = [NSURL URLWithString:deviceLink];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:req];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [self.loaderView startAnimating];
    [self.loaderView setHidden:NO];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.loaderView stopAnimating];
    [self.loaderView setHidden:YES];
}

@end
