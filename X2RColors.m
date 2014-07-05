//
//  X2RColors.m
//  Digital Heroes
//
//  Created by Jose-OSX on 08/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RColors.h"

static UIColor *colorRed;
static UIColor *lightBlueColor;
static UIColor *purpleColor;
static UIColor *greenColor;
static UIColor *yellowColor;
static UIColor *lightRedColor;

//Authors
static UIColor *authorBinaryColor;
static UIColor *authorCodeColor;
static UIColor *authorCraftColor;
static UIColor *authorCreaColor;
static UIColor *authorIdeaColor;
static UIColor *authorNumbersColor;
static UIColor *authorPencilColor;
static UIColor *authorPixelColor;
static UIColor *authorSemColor;
static UIColor *authorSocialColor;
static UIColor *authorSpeedColor;
static UIColor *authorTrixColor;

@implementation X2RColors

+(UIColor *)redColor{
    if( colorRed==nil ) colorRed = [UIColor colorWithRed:0.792 green:0.188 blue:0.235 alpha:1];
    return colorRed;
}

+(UIColor *)lightBlueColor{
    if( lightBlueColor==nil ) lightBlueColor = [UIColor colorWithRed:0.2 green:0.71 blue:0.898 alpha:1];
    return lightBlueColor;
}

+(UIColor *)purpleColor{
    if( purpleColor==nil ) purpleColor = [UIColor colorWithRed:0.667 green:0.4 blue:0.8 alpha:1];
    return purpleColor;
}

+(UIColor *)greenColor{
    if( greenColor==nil ) greenColor = [UIColor colorWithRed:0.6 green:0.8 blue:0.1 alpha:1];
    return greenColor;
}

+(UIColor *)yellowColor{
    if( yellowColor==nil ) yellowColor = [UIColor colorWithRed:1 green:0.733 blue:0.2 alpha:1];
    return yellowColor;
}

+(UIColor *)lightRedColor{
    if( lightRedColor==nil ) lightRedColor = [UIColor colorWithRed:1 green:0.267 blue:0.267 alpha:1];
    return lightRedColor;
}

//Authors
+(UIColor *)authorBinaryColor{
    if( authorBinaryColor==nil ) authorBinaryColor = [UIColor colorWithRed:0.086 green:0.62 blue:0.016 alpha:1];
    return authorBinaryColor;
}

+(UIColor *)authorCodeColor{
   if( authorCodeColor==nil ) authorCodeColor = [UIColor colorWithRed:0.91 green:0.173 blue:0.173 alpha:1];
    return authorCodeColor;
}

+(UIColor *)authorCraftColor{
    if( authorCraftColor==nil ) authorCraftColor = [UIColor colorWithRed:0.471 green:0 blue:0 alpha:1];
    return authorCraftColor;
}

+(UIColor *)authorCreaColor{
    if( authorCreaColor==nil ) authorCreaColor = [UIColor colorWithRed:0.412 green:0.059 blue:0.937 alpha:1];
    return authorCreaColor;
}

+(UIColor *)authorIdeaColor{
    if( authorIdeaColor==nil ) authorIdeaColor = [UIColor colorWithRed:1 green:0.447 blue:0 alpha:1];
    return authorIdeaColor;
}

+(UIColor *)authorNumbersColor{
    if( authorNumbersColor==nil ) authorNumbersColor = [UIColor colorWithRed:0.067 green:0.753 blue:0.647 alpha:1];
    return authorNumbersColor;
}

+(UIColor *)authorPencilColor{
    if( authorPencilColor==nil ) authorPencilColor = [UIColor colorWithRed:1 green:0.337 blue:0.247 alpha:1];
    return authorPencilColor;
}

+(UIColor *)authorPixelColor{
    if( authorPixelColor==nil ) authorPixelColor = [UIColor colorWithRed:0.706 green:0 blue:1 alpha:1];
    return authorPixelColor;
}

+(UIColor *)authorSemColor{
    if( authorSemColor==nil ) authorSemColor = [UIColor colorWithRed:1 green:0.659 blue:0 alpha:1];
    return authorSemColor;
}

+(UIColor *)authorSocialColor{
    if( authorSocialColor==nil ) authorSocialColor = [UIColor colorWithRed:0 green:0.353 blue:1 alpha:1];
    return authorSocialColor;
}

+(UIColor *)authorSpeedColor{
    if( authorSpeedColor==nil ) authorSpeedColor = [UIColor colorWithRed:0 green:0.659 blue:1 alpha:1];
    return authorSpeedColor;
}

+(UIColor *)authorTrixColor{
    if( authorTrixColor==nil ) authorTrixColor = [UIColor colorWithRed:0.588 green:0.757 blue:0.122 alpha:1];
    return authorTrixColor;
}

@end
