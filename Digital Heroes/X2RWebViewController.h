//
//  X2RWebViewController.h
//  Digital Heroes
//
//  Created by Jose Luis on 05/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "X2RPost.h"

@interface X2RWebViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loaderView;

@property (strong, nonatomic) X2RPost *post;

@end
