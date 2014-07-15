//
//  X2RBlogFilter.h
//  Digital Heroes
//
//  Created by Jose-OSX on 15/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface X2RBlogFilter : NSObject

+(int) typeSpecial;
+(int) typeCategory;
+(int) typeAuthor;

@property (nonatomic) int identifier;
@property (nonatomic) int type;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *feedUrl;
@property (strong, nonatomic) UIColor *color;
@property (copy, nonatomic) NSString *icon;

-(id) initWithId:(int) identifier
         andName:(NSString*) name
      andFeedUrl:(NSString*) feedUrl
         andType:(int) type
        andColor:(UIColor*) color
         andIcon:(NSString*) icon;

@end
