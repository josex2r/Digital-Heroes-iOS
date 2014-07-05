//
//  X2RBlog.m
//  Digital Heroes
//
//  Created by Jose Luis on 05/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RBlog.h"
#import "NSString+FontAwesome.h"
#import "X2RColors.h"

@implementation X2RBlog

+(instancetype) sharedBlog{
    static X2RBlog *blog;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        blog = [[X2RBlog alloc] init];
        
        blog.filters = @[
                         //ALL
                         [[X2RBlogFilter alloc] initWithId:0 andName:@"Digital Heroes" andFeedUrl:@"http://blog.gobalo.es/feed/" andType:[X2RBlogFilter typeCategory] andColor:[X2RColors redColor] andIcon:@"ic_gobalo_invertido" isFontAwesome:NO],
                         
                         //CATEGORIES
                         [[X2RBlogFilter alloc] initWithId:1 andName:@"Advertising" andFeedUrl:@"http://blog.gobalo.es/category/advertising-2/feed/" andType:[X2RBlogFilter typeCategory] andColor:[X2RColors lightBlueColor] andIcon:[NSString fontAwesomeIconStringForEnum:FAList] isFontAwesome:YES],
                         
                         [[X2RBlogFilter alloc] initWithId:2 andName:@"Creatividad" andFeedUrl:@"http://blog.gobalo.es/category/creatividad/feed/" andType:[X2RBlogFilter typeCategory] andColor:[X2RColors purpleColor] andIcon:[NSString fontAwesomeIconStringForEnum:FAPencil] isFontAwesome:YES],
                         
                         [[X2RBlogFilter alloc] initWithId:3 andName:@"Inside Góbalo" andFeedUrl:@"http://blog.gobalo.es/category/inside-gobalo/feed/" andType:[X2RBlogFilter typeCategory] andColor:[X2RColors greenColor] andIcon:[NSString fontAwesomeIconStringForEnum:FAEye] isFontAwesome:YES],
                         
                         [[X2RBlogFilter alloc] initWithId:4 andName:@"Marketing y Social Media" andFeedUrl:@"http://blog.gobalo.es/category/marketing-digital-y-social-media/feed/" andType:[X2RBlogFilter typeCategory] andColor:[X2RColors yellowColor] andIcon:[NSString fontAwesomeIconStringForEnum:FAShoppingCart] isFontAwesome:YES],
                         
                         [[X2RBlogFilter alloc] initWithId:5 andName:@"Negocios" andFeedUrl:@"http://blog.gobalo.es/category/negocios/feed/" andType:[X2RBlogFilter typeCategory] andColor:[X2RColors lightRedColor] andIcon:[NSString fontAwesomeIconStringForEnum:FAMoney] isFontAwesome:YES],
                         
                         [[X2RBlogFilter alloc] initWithId:6 andName:@"Seo y Sem" andFeedUrl:@"http://blog.gobalo.es/category/seo-y-sem/feed/" andType:[X2RBlogFilter typeCategory] andColor:[X2RColors lightBlueColor] andIcon:[NSString fontAwesomeIconStringForEnum:FAThumbsOUp] isFontAwesome:YES],
                         
                         [[X2RBlogFilter alloc] initWithId:7 andName:@"Web y Programación" andFeedUrl:@"http://blog.gobalo.es/category/web-y-programacion/feed/" andType:[X2RBlogFilter typeCategory] andColor:[X2RColors purpleColor] andIcon:[NSString fontAwesomeIconStringForEnum:FACode] isFontAwesome:YES],
                         
                         //AUTHORS
                         [[X2RBlogFilter alloc] initWithId:20 andName:@"Super 01101" andFeedUrl:@"http://blog.gobalo.es/author/a-vara/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorBinaryColor] andIcon:@"ic_super_01101" isFontAwesome:NO],
                         [[X2RBlogFilter alloc] initWithId:21 andName:@"Super Code" andFeedUrl:@"http://blog.gobalo.es/author/jl-represa/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorCodeColor] andIcon:@"ic_super_code" isFontAwesome:NO],
                         [[X2RBlogFilter alloc] initWithId:22 andName:@"Super Craft" andFeedUrl:@"http://blog.gobalo.es/author/n-pastor/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorCraftColor] andIcon:@"ic_super_craft" isFontAwesome:NO],
                         [[X2RBlogFilter alloc] initWithId:23 andName:@"Super Crea" andFeedUrl:@"http://blog.gobalo.es/author/g-gomez/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorCreaColor] andIcon:@"ic_super_crea" isFontAwesome:NO],
                         [[X2RBlogFilter alloc] initWithId:24 andName:@"Super Idea" andFeedUrl:@"http://blog.gobalo.es/author/j-azpeitia/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorIdeaColor] andIcon:@"ic_super_idea" isFontAwesome:NO],
                         [[X2RBlogFilter alloc] initWithId:25 andName:@"Super Numbers" andFeedUrl:@"http://blog.gobalo.es/author/m-becerra/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorNumbersColor] andIcon:@"ic_super_numbers" isFontAwesome:NO],
                         [[X2RBlogFilter alloc] initWithId:26 andName:@"Super Pencil" andFeedUrl:@"http://blog.gobalo.es/author/a-fassi/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorPencilColor] andIcon:@"ic_super_pencil" isFontAwesome:NO],
                         [[X2RBlogFilter alloc] initWithId:27 andName:@"Super Pixel" andFeedUrl:@"http://blog.gobalo.es/author/f-bril/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorPixelColor] andIcon:@"ic_super_pixel" isFontAwesome:NO],
                         [[X2RBlogFilter alloc] initWithId:28 andName:@"Super SEM" andFeedUrl:@"http://blog.gobalo.es/author/l-casado/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorSemColor] andIcon:@"ic_super_sem" isFontAwesome:NO],
                         [[X2RBlogFilter alloc] initWithId:29 andName:@"Super Social" andFeedUrl:@"http://blog.gobalo.es/author/bloggobalo-es/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorSocialColor] andIcon:@"ic_super_social" isFontAwesome:NO],
                         [[X2RBlogFilter alloc] initWithId:30 andName:@"Super Speed" andFeedUrl:@"http://blog.gobalo.es/author/a-gonzalez/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorSpeedColor] andIcon:@"ic_super_speed" isFontAwesome:NO],
                         [[X2RBlogFilter alloc] initWithId:31 andName:@"Super Trix" andFeedUrl:@"http://blog.gobalo.es/author/cristina/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorTrixColor] andIcon:@"ic_super_trix" isFontAwesome:NO],
                         
                         [[X2RBlogFilter alloc] initWithId:99 andName:@"Favoritos" andFeedUrl:nil andType:[X2RBlogFilter typeSpecial] andColor:nil andIcon:nil isFontAwesome:NO]
                         ];
        
        //Initialize with FILTER_ALL and page 0
        blog.activeFilter = [blog.filters objectAtIndex:0];
        blog.currentPage = 1;
        blog.isLoading = NO;
        blog.posts = [[NSMutableDictionary alloc] init];
    });
    
    return blog;
}

-(NSArray *)getFiltersByType:(int)type{
    return [self.filters filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.type == %i", type]];
}

-(X2RBlogFilter *)getFiltersByName:(NSString*)name{
    return [self.filters filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.name == %@", name]][0];
}

-(void)pushPosts:(NSArray *)posts intoFilter:(X2RBlogFilter *)filter andPage:(int)page{
    NSString *filterKey = [NSString stringWithFormat:@"%d", filter.identifier];
    NSMutableDictionary *filteredPosts = (NSMutableDictionary*)[self.posts objectForKey:filterKey];
    if( filteredPosts==nil ){
        filteredPosts = [[NSMutableDictionary alloc] init];
        [self.posts setObject:filteredPosts forKey:filterKey];
    }
    NSString *pageKey = [NSString stringWithFormat:@"%d", page];
    NSArray *filteredPagedPosts = (NSArray*)[filteredPosts objectForKey:pageKey];
    if( filteredPagedPosts==nil ){
        [filteredPosts setObject:posts forKey:pageKey];
    }
}

-(NSArray*)getPostsFromFilter:(X2RBlogFilter *)filter andPage:(int)page{
    NSString *filterKey = [NSString stringWithFormat:@"%d", filter.identifier];
    NSMutableDictionary *filteredPosts = (NSMutableDictionary*)[self.posts objectForKey:filterKey];
    if( filteredPosts!=nil ){
        NSString *pageKey = [NSString stringWithFormat:@"%d", page];
        NSArray *posts = [filteredPosts objectForKey:pageKey];
        if( posts!=nil ){
            return posts;
        }
    }
    return  nil;
}

@end
