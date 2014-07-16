//
//  X2RPostTableViewController.h
//  Digital Heroes
//
//  Created by Jose-OSX on 15/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "X2RBlogFilter.h"

@interface X2RPostTableController : UITableViewController <UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *postList;

-(void) loadFeedWithFilter:(X2RBlogFilter*)filter andClean:(BOOL)cleanTable;

@end
