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
                         [[X2RBlogFilter alloc] initWithId:0 andName:@"Todos" andFeedUrl:@"http://blog.gobalo.es/feed/" andType:[X2RBlogFilter typeSpecial] andColor:[X2RColors redColor] andIcon:[NSString fontAwesomeIconStringForEnum:FAList]],
                         
                         //CATEGORIES
                         [[X2RBlogFilter alloc] initWithId:1 andName:@"Advertising" andFeedUrl:@"http://blog.gobalo.es/feed/category/advertising-2/feed/" andType:[X2RBlogFilter typeCategory] andColor:[X2RColors lightBlueColor] andIcon:[NSString fontAwesomeIconStringForEnum:FAList]],
                         
                         [[X2RBlogFilter alloc] initWithId:2 andName:@"Creatividad" andFeedUrl:@"http://blog.gobalo.es/feed/category/creatividad/feed/" andType:[X2RBlogFilter typeCategory] andColor:[X2RColors purpleColor] andIcon:[NSString fontAwesomeIconStringForEnum:FAPencil]],
                         
                         [[X2RBlogFilter alloc] initWithId:3 andName:@"Inside Góbalo" andFeedUrl:@"http://blog.gobalo.es/feed/category/inside-gobalo/feed/" andType:[X2RBlogFilter typeCategory] andColor:[X2RColors greenColor] andIcon:[NSString fontAwesomeIconStringForEnum:FAEye]],
                         
                         [[X2RBlogFilter alloc] initWithId:4 andName:@"Marketing y Social Media" andFeedUrl:@"http://blog.gobalo.es/feed/category/marketing-digital-y-social-media/feed/" andType:[X2RBlogFilter typeCategory] andColor:[X2RColors yellowColor] andIcon:[NSString fontAwesomeIconStringForEnum:FAShoppingCart]],
                         
                         [[X2RBlogFilter alloc] initWithId:5 andName:@"Negocios" andFeedUrl:@"http://blog.gobalo.es/feed/category/negocios/feed/" andType:[X2RBlogFilter typeCategory] andColor:[X2RColors lightRedColor] andIcon:[NSString fontAwesomeIconStringForEnum:FAMoney]],
                         
                         [[X2RBlogFilter alloc] initWithId:6 andName:@"Seo y Sem" andFeedUrl:@"http://blog.gobalo.es/feed/category/seo-y-sem/feed/" andType:[X2RBlogFilter typeCategory] andColor:[X2RColors lightBlueColor] andIcon:[NSString fontAwesomeIconStringForEnum:FAThumbsOUp]],
                         
                         [[X2RBlogFilter alloc] initWithId:7 andName:@"Web y Programación" andFeedUrl:@"http://blog.gobalo.es/feed/category/web-y-programacion/feed/" andType:[X2RBlogFilter typeCategory] andColor:[X2RColors purpleColor] andIcon:[NSString fontAwesomeIconStringForEnum:FACode]],
                         
                         //AUTHORS
                         [[X2RBlogFilter alloc] initWithId:20 andName:@"Super 01101" andFeedUrl:@"http://blog.gobalo.es/feed/author/a-vara/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorBinaryColor] andIcon:@"ic_super_binary"],
                         [[X2RBlogFilter alloc] initWithId:21 andName:@"Super Code" andFeedUrl:@"http://blog.gobalo.es/feed/author/jl-represa/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorCodeColor] andIcon:@"ic_super_code"],
                         [[X2RBlogFilter alloc] initWithId:22 andName:@"Super Craft" andFeedUrl:@"http://blog.gobalo.es/feed/author/n-pastor/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorCraftColor] andIcon:@"ic_super_craft"],
                         [[X2RBlogFilter alloc] initWithId:23 andName:@"Super Crea" andFeedUrl:@"http://blog.gobalo.es/feed/author/g-gomez/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorCreaColor] andIcon:@"ic_super_crea"],
                         [[X2RBlogFilter alloc] initWithId:24 andName:@"Super Idea" andFeedUrl:@"http://blog.gobalo.es/feed/author/j-azpeitia/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorIdeaColor] andIcon:@"ic_super_idea"],
                         [[X2RBlogFilter alloc] initWithId:25 andName:@"Super Numbers" andFeedUrl:@"http://blog.gobalo.es/feed/author/m-becerra/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorNumbersColor] andIcon:@"ic_super_numbers"],
                         [[X2RBlogFilter alloc] initWithId:26 andName:@"Super Pencil" andFeedUrl:@"http://blog.gobalo.es/feed/author/a-fassi/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorPencilColor] andIcon:@"ic_super_pencil"],
                         [[X2RBlogFilter alloc] initWithId:27 andName:@"Super Pixel" andFeedUrl:@"http://blog.gobalo.es/feed/author/f-bril/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorPixelColor] andIcon:@"ic_super_pixel"],
                         [[X2RBlogFilter alloc] initWithId:28 andName:@"Super SEM" andFeedUrl:@"http://blog.gobalo.es/feed/author/l-casado/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorSemColor] andIcon:@"ic_super_sem"],
                         [[X2RBlogFilter alloc] initWithId:29 andName:@"Super Social" andFeedUrl:@"http://blog.gobalo.es/feed/author/bloggobalo-es/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorSocialColor] andIcon:@"ic_super_social"],
                         [[X2RBlogFilter alloc] initWithId:30 andName:@"Super Speed" andFeedUrl:@"http://blog.gobalo.es/feed/author/a-gonzalez/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorSpeedColor] andIcon:@"ic_super_speed"],
                         [[X2RBlogFilter alloc] initWithId:31 andName:@"Super Trix" andFeedUrl:@"http://blog.gobalo.es/feed/author/cristina/feed/" andType:[X2RBlogFilter typeAuthor] andColor:[X2RColors authorTrixColor] andIcon:@"ic_super_trix"],
                         
                         [[X2RBlogFilter alloc] initWithId:99 andName:@"Favoritos" andFeedUrl:nil andType:[X2RBlogFilter typeSpecial] andColor:nil andIcon:nil]
                         ];
        
        //Initialize with FILTER_ALL and page 0
        blog.activeFilter = [blog.filters objectAtIndex:0];
        blog.currentPage = 0;
                        
    });
    
    return blog;
}

-(NSArray *)getFiltersByType:(int)type{
    return [self.filters filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF.type == %i", type]];
}

@end
