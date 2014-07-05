//
//  X2RBlog.m
//  Digital Heroes
//
//  Created by Jose Luis on 05/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RBlog.h"

@implementation X2RBlog

+(instancetype) sharedBlog{
    static X2RBlog *blog;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        blog = [[X2RBlog alloc] init];
    });
    
    return blog;
}

@end
