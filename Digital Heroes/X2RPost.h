//
//  X2RPost.h
//  Digital Heroes
//
//  Created by Jose Luis on 05/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface X2RPost : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *link;
@property (copy, nonatomic) NSString *comments;
@property (copy, nonatomic) NSString *date;
@property (copy, nonatomic) NSString *creator;
@property (copy, nonatomic) NSString *guid;
@property (copy, nonatomic) NSString *description;
@property (copy, nonatomic) NSString *imageLink;
@property (strong, nonatomic) NSMutableArray *categories;

-(id) initWithTitle: (NSString*) title;

@end
