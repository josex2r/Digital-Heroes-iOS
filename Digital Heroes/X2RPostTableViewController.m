//
//  X2RPostTableViewController.m
//  Digital Heroes
//
//  Created by Jose-OSX on 15/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RPostTableViewController.h"
#import "X2RBlog.h"
#import "X2RBlogFilter.h"
#import "X2RPost.h"
#import "X2RXMLPullParser.h"

@interface X2RPostTableViewController ()

@end

@implementation X2RPostTableViewController
{
    X2RBlog *blog;
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.postList = [[NSMutableArray alloc] init];
    
    blog = [X2RBlog sharedBlog];
    
    NSString *allPostsFeedUrlString = ((X2RBlogFilter*)[blog.filters objectAtIndex:0]).feedUrl;
    NSURL *allPostFeedUrl = [NSURL URLWithString:allPostsFeedUrlString];
    
    X2RXMLPullParser *parser = [[X2RXMLPullParser alloc] initWithContentsOfURL:allPostFeedUrl andCompletionBlock:^(NSMutableArray *posts) {
        [self.postList addObjectsFromArray:posts];
        
        [self test];
        //[self.tableView reloadData];
    }];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [parser parse];
    });
    
    
}

-(void)test{
    NSLog(@"Number of RSS posts: %d", [self.postList count]);
    for(X2RPost *post in self.postList){
        NSLog(@"%@", post.title);
    }
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.postList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"PostCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if( cell==nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    X2RPost *post = [self.postList objectAtIndex:indexPath.row];
    
    UIImageView *postImage = (UIImageView*)[cell.contentView viewWithTag:987456321];
    
    if( post!=nil ){
        //Text
        UILabel *titleLabel = (UILabel*)[cell.contentView viewWithTag:123654789];
        titleLabel.text = post.title;
        //Image
        postImage.image = post.image;
    }
    
    return cell;
}

@end
