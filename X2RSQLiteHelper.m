//
//  X2RSQLiteHelper.m
//  Digital Heroes
//
//  Created by Jose Luis on 05/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RSQLiteHelper.h"
#import <sqlite3.h>

@implementation X2RSQLiteHelper
{
    sqlite3 *mySqliteDB;
}

- (void) initDatabase {
    
    // Get the documents directory
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    
    // Build the path to the database file
    self.databasePath = [[NSString alloc] initWithString:
                    [docsDir stringByAppendingPathComponent:@"favourites.db"]];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    //the file will not be there when we load the application for the first time
    //so this will create the database table
    if ([filemgr fileExistsAtPath: self.databasePath ] == NO)
    {
        if (sqlite3_open([self.databasePath UTF8String], &mySqliteDB) == SQLITE_OK)
        {
            char *errMsg;
            NSString *sql_stmt = @"CREATE TABLE IF NOT EXISTS favourites (";
            sql_stmt = [sql_stmt stringByAppendingString:@"title TEXT, "];
            sql_stmt = [sql_stmt stringByAppendingString:@"link TEXT, "];
            sql_stmt = [sql_stmt stringByAppendingString:@"date TEXT, "];
            sql_stmt = [sql_stmt stringByAppendingString:@"creator TEXT, "];
            sql_stmt = [sql_stmt stringByAppendingString:@"guid TEXT, "];
            sql_stmt = [sql_stmt stringByAppendingString:@"description TEXT, "];
            sql_stmt = [sql_stmt stringByAppendingString:@"imageLink TEXT)"];
            
            if (sqlite3_exec(mySqliteDB, [sql_stmt UTF8String], NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog(@"Failed to create table");
            }
            else
            {
                NSLog(@"Favourites table created successfully");
            }
            
            sqlite3_close(mySqliteDB);
            
        } else {
            NSLog(@"Failed to open/create database");
        }
    }else {
        NSLog(@"Database exists");
    }
    
}

//save our data
- (BOOL) addFavourite:(X2RPost*)post
{
    
    NSLog(@"Trying to add favourite: %@", post.title);
    
    BOOL success = false;
    sqlite3_stmt *statement = NULL;
    
    if (sqlite3_open([self.databasePath UTF8String], &mySqliteDB) == SQLITE_OK)
    {
        /*NSString *insertSQL = [NSString stringWithFormat:@"INSERT INTO favourites (title, link, comments, date, creator, guid, description, imageLink) VALUES (\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")", post.title, post.link, post.comments, post.date, post.creator, post.guid, post.description, post.imageLink];
         
        const char *insert_stmt = [insertSQL UTF8String];
        NSLog(@"%s", insert_stmt);*/
        
        const char *insert_stmt = "INSERT INTO favourites (title, link, date, creator, guid, description, imageLink) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        int test = sqlite3_prepare_v2(mySqliteDB, insert_stmt, -1, &statement, NULL);
        //NSLog(@"%@", mySqliteDB);
        NSLog(@"%d",test);
        sqlite3_bind_text(statement, 1, [post.title UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(statement, 2, [post.link UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(statement, 3, [post.date UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(statement, 4, [post.creator UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(statement, 5, [post.guid UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(statement, 6, [post.description UTF8String], -1, SQLITE_TRANSIENT);
        sqlite3_bind_text(statement, 7, [post.imageLink UTF8String], -1, SQLITE_TRANSIENT);
        NSLog(@"%d",sqlite3_step(statement) );
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            success = true;
        }
        
        NSLog(@"%s", sqlite3_errmsg(mySqliteDB));
        
        sqlite3_finalize(statement);
        sqlite3_close(mySqliteDB);
        
        
        NSLog(@"Resultado %hhd", success);
    
    }
    
    return success;
}

-(BOOL)removeFavourite:(X2RPost *)post{
    
    NSLog(@"Trying to remove favourite: %@", post.title);
    
    BOOL success = false;
    sqlite3_stmt *statement = NULL;
    
    if (sqlite3_open([self.databasePath UTF8String], &mySqliteDB) == SQLITE_OK)
    {
        
        NSString *deleteSQL = [NSString stringWithFormat:@"DELETE from favourites WHERE title = %@", post.title];
            
        const char *delete_stmt = [deleteSQL UTF8String];
        sqlite3_prepare_v2(mySqliteDB, delete_stmt, -1, &statement, NULL );
        
        if( sqlite3_step(statement) == SQLITE_DONE ){
            success = true;
        }
        
        sqlite3_finalize(statement);
        sqlite3_close(mySqliteDB);
        
        NSLog(@"Resultado %hhd", success);
        
    }
    
    return success;
}


//get a list of all our employees
- (NSMutableArray *) getFavourites
{
    
    NSLog(@"getFavourites");
    
    NSMutableArray *favourites = [[NSMutableArray alloc] init];
    sqlite3_stmt *statement;
    
    if (sqlite3_open([self.databasePath UTF8String], &mySqliteDB) == SQLITE_OK)
    {
        NSString *querySQL = @"SELECT * FROM favourites";
        const char *query_stmt = [querySQL UTF8String];
        
        if (sqlite3_prepare_v2(mySqliteDB, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                
                NSLog(@"%s", (char *)sqlite3_column_text(statement, 0));
                NSLog(@"%s", (char *)sqlite3_column_text(statement, 1));
                NSLog(@"%s", (char *)sqlite3_column_text(statement, 2));
                NSLog(@"%s", (char *)sqlite3_column_text(statement, 3));
                NSLog(@"%s", (char *)sqlite3_column_text(statement, 4));
                NSLog(@"%s", (char *)sqlite3_column_text(statement, 5));
                NSLog(@"%s", (char *)sqlite3_column_text(statement, 6));
                
                X2RPost *post = [[X2RPost alloc] init];
                
                post.title = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 0)];
                post.link = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
                post.date = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 2)];
                post.creator = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 3)];
                post.guid = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 4)];
                post.description = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 5)];
                post.imageLink = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 6)];
                
                [favourites addObject:post];
            }
            sqlite3_finalize(statement);
        }
        sqlite3_close(mySqliteDB);
    }
    
    return favourites;
}



@end
