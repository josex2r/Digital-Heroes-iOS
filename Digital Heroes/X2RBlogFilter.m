//
//  X2RBlogFilter.m
//  Digital Heroes
//
//  Created by Jose-OSX on 15/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RBlogFilter.h"

@implementation X2RBlogFilter

+(int)typeSpecial{ return 0; }
+(int)typeCategory{ return 1; }
+(int)typeAuthor{ return 2; }

-(id)initWithId:(int)identifier andName:(NSString *)name andFeedUrl:(NSString *)feedUrl andType:(int)type andColor:(UIColor *)color andIcon:(NSString *)icon isFontAwesome:(BOOL)isFA{
    if( [super init]!=nil ){
        _identifier = identifier;
        _name = name;
        _feedUrl = feedUrl;
        _type = type;
        _color = color;
        _icon = icon;
        _fontAwesome = isFA;
    }
    return self;
}

-(BOOL)isEqual:(id)object{
    return [object isMemberOfClass:self.class] && self.identifier==((X2RBlogFilter*)object).identifier;
}

@end
