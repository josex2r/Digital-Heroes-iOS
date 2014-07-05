//
//  X2RBlog.h
//  Digital Heroes
//
//  Created by Jose Luis on 05/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "X2RBlogFilter.h"

@interface X2RBlog : NSObject
//Singleton pattern
@property (strong, nonatomic) X2RBlog *instance;

//Posts collection of X2RSparseArray(map) of X2RSparseArray of list with X2RPost ------
@property (strong, nonatomic) NSMutableDictionary *posts;
//Current selected filter
@property (strong, nonatomic) X2RBlogFilter *activeFilter;
//Current selected page of the selected filter
@property (nonatomic) int currentPage;
//Check if loading
@property (nonatomic) BOOL isLoading;
//Filters
@property (strong, nonatomic) NSArray *filters;

//Get the instance method
+(instancetype) sharedBlog;

-(NSArray*) getFiltersByType:(int) type;

-(X2RBlogFilter*) getFiltersByName:(NSString*) name;

-(NSArray*)getPostsFromFilter:(X2RBlogFilter *)filter andPage:(int)page;

-(void)pushPosts:(NSArray*) posts
      intoFilter:(X2RBlogFilter*) filter
         andPage:(int) page;

@end
