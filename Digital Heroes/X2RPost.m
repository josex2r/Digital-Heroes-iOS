//
//  X2RPost.m
//  Digital Heroes
//
//  Created by Jose Luis on 05/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RPost.h"

@implementation X2RPost

-(id) init{
    if( [super init]!=nil ){
        _categories = [[NSMutableArray alloc] init];
    }
    return self;
}

-(id) initWithTitle:(NSString *)title{
    if( [super init]!=nil ){
        _title = title;
        _categories = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
