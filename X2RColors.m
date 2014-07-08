//
//  X2RColors.m
//  Digital Heroes
//
//  Created by Jose-OSX on 08/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RColors.h"

static UIColor *colorRed;

@implementation X2RColors

+(UIColor *)redColor{
    if( colorRed==nil ){
        colorRed = [UIColor colorWithRed:0.792 green:0.188 blue:0.235 alpha:1];
    }
    return colorRed;
}

@end
