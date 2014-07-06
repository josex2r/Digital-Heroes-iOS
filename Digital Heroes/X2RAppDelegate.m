//
//  X2RAppDelegate.m
//  Digital Heroes
//
//  Created by Jose-OSX on 22/04/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RAppDelegate.h"
#import "X2RXMLPullParser.h"

@implementation X2RAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    
    //Load first feed while splash image
    __block BOOL succesful;
    //Load feed from RSS
    NSString *finalFeedUrl = [NSString stringWithFormat:@"http://blog.gobalo.es/feed/"];
    NSURL *allPostFeedUrl = [NSURL URLWithString:finalFeedUrl];
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    X2RXMLPullParser *parser = [[X2RXMLPullParser alloc] initWithContentsOfURL:allPostFeedUrl andCompletionBlock:^(NSMutableArray *posts) {
        //Save posts array
        self.posts = posts;
        //Send semaphore signal to dismiss the spals screen
        succesful = succesful;
        dispatch_semaphore_signal(semaphore);
    }];
    
    [parser parse];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    //Wait aync var
    return succesful;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
