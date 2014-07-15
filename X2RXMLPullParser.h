//
//  X2RXMLPullParser.h
//  Digital Heroes
//
//  Created by Jose-OSX on 15/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface X2RXMLPullParser : NSXMLParser <NSXMLParserDelegate>

@property (nonatomic, copy) void (^completionBlock)(NSMutableArray *posts);

-(id)initWithContentsOfURL:(NSURL *)url andCompletionBlock:(void (^)(NSMutableArray *))completionBlock;

@end
