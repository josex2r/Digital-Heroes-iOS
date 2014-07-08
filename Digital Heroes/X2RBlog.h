//
//  X2RBlog.h
//  Digital Heroes
//
//  Created by Jose Luis on 05/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "X2RSparseArray.h"

@interface X2RBlog : NSObject
//Singleton pattern
@property (strong, nonatomic) X2RBlog *instance;
//osts collection of X2RSparseArray(map) of X2RSparseArray of list with X2RPost ------
@property (strong, nonatomic) X2RSparseArray *posts;
//Current selected filter
@property int activeFilter;
//Current selected page of the selected filter
@property int currentPage;
//Current feed url
@property (copy, nonatomic) NSString *feedUrl;

//Get the instance method
+(instancetype) sharedBlog;

@end
