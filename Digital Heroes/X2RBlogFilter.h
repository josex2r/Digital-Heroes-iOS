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

@property (nonatomic) int id;
@property (nonatomic) int type;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *feedUrl;

-(id) initWithId:(int) identifier
         andName:(NSString*) name
      andFeedUrl:(NSString*) feedUrl
         andType:(int) type;

@end
