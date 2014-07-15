//
//  X2RFiltersTableViewController.m
//  Digital Heroes
//
//  Created by Jose-OSX on 15/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RFiltersTableViewController.h"
#import "X2RPageViewController.h"
#import "X2RBlog.h"
#import "X2RBlogFilter.h"
#import "NSString+FontAwesome.h"
#import "FlatButton.h"

@interface X2RFiltersTableViewController ()

@end

@implementation X2RFiltersTableViewController
{
    int currentPage;
    X2RPageViewController *pageController;
    X2RBlog *blog;
    NSArray *filters;
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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //currentPage = ((X2RPageViewController*)self.parentViewController.parentViewController).currentIndex;
    
    blog = [X2RBlog sharedBlog];
    
    pageController = ((X2RPageViewController*)[self.tabBarController.viewControllers objectAtIndex:0]);
    currentPage = [pageController.pages indexOfObject:self.navigationController];
    
    if( currentPage==0 ){
        //Categories
        filters = [blog getFiltersByType:[X2RBlogFilter typeCategory]];
    }else{
        //Authors
        filters = [blog getFiltersByType:[X2RBlogFilter typeAuthor]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [filters count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"FilterCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if( cell==nil ){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        // Configure the cell...
        
    }else{
        [[cell.contentView viewWithTag:123456789] removeFromSuperview];
    }
    
    
    X2RBlogFilter *filter = [filters objectAtIndex:indexPath.row];
    
    UIButton *flatCategoryBtn = [[FlatButton alloc] initWithFrame:CGRectMake(10, 10, 300, 50) withBackgroundColor:[UIColor greenColor]];
    flatCategoryBtn.layer.cornerRadius = 10;
    flatCategoryBtn.tag = 123456789;
    [flatCategoryBtn addTarget:self action:@selector(flatBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.contentView addSubview:flatCategoryBtn];
    
    cell.textLabel.text = filter.name;
    
    return cell;
}

-(void)flatBtnPressed:(id)button{
    NSLog(@"Flat btn pressed");
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end