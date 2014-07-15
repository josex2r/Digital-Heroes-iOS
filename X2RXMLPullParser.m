//
//  X2RXMLPullParser.m
//  Digital Heroes
//
//  Created by Jose-OSX on 15/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RXMLPullParser.h"
#import "X2RPost.h"

@implementation X2RXMLPullParser
{
    NSMutableArray *postList;
    X2RPost *lastPost;
    NSString *currElement;
    
    NSMutableString *currTitle;
    NSMutableString *currDescription;
    NSMutableString *currLink;
    NSMutableString *currDate;
    NSMutableString *currGuid;
    NSMutableString *currCreator;
    NSMutableString *currCategory;
    NSMutableString *currImage;
    
}

-(id)initWithContentsOfURL:(NSURL *)url andCompletionBlock:(void (^)(NSMutableArray *))completionBlock{
    self = [super initWithContentsOfURL:url];
    _completionBlock = completionBlock;
    [self setDelegate:self];
    return self;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    currElement = elementName;
    
    if( [elementName isEqualToString:@"item"] ){
        currTitle = [[NSMutableString alloc] init];
        currDescription = [[NSMutableString alloc] init];
        currLink = [[NSMutableString alloc] init];
        currDate = [[NSMutableString alloc] init];
        currGuid = [[NSMutableString alloc] init];
        currCreator = [[NSMutableString alloc] init];
        currCategory = [[NSMutableString alloc] init];
        currImage = [[NSMutableString alloc] init];
        
        lastPost = [[X2RPost alloc] init];
    }
    
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if( lastPost!=nil ){
        if( [currElement isEqualToString:@"link"] ){
            [currLink appendString:string];
        }else if( [currElement isEqualToString:@"description"] ){
            [currDescription appendString:string];
        }else if( [currElement isEqualToString:@"pubDate"] ){
            [currDate appendString:string];
        }else if( [currElement isEqualToString:@"title"] ){
            [currTitle appendString:string];
        }else if( [currElement isEqualToString:@"guid"] ){
            [currGuid appendString:string];
        }else if( [currElement isEqualToString:@"creator"] ){
            [currCreator appendString:string];
        }else if( [currElement isEqualToString:@"category"] ){
            [currCategory appendString:string];
        }else if( [currElement isEqualToString:@"image"] ){
            [currImage appendString:string];
        }
    }
    
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    if( [elementName isEqualToString:@"item"] ){
        if( postList==nil ){
            postList = [[NSMutableArray alloc] init];
        }
        
        NSString *parsedLink = [[currLink stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        lastPost.link = parsedLink;
        lastPost.description = currDescription;
        lastPost.date = currDate;
        lastPost.title = currTitle;
        lastPost.guid = currGuid;
        lastPost.creator = currCreator;
        lastPost.categories = [NSMutableArray arrayWithObject:currCategory];
        lastPost.imageLink = [currImage stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        [postList addObject:lastPost];
    }
    
}

-(void)parserDidEndDocument:(NSXMLParser *)parser{
    if( self.completionBlock!=nil ){
        self.completionBlock(postList);
    }
}

@end
