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

@property (strong, nonatomic) X2RBlog *instance;

@property (strong, nonatomic) X2RSparseArray *posts;
@property int activeFilter;
@property int currentPage;

+(instancetype) sharedBlog;

@end
