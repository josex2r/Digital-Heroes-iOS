//
//  X2RSQLiteHelper.h
//  Digital Heroes
//
//  Created by Jose Luis on 05/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "X2RPost.h"

@interface X2RSQLiteHelper : NSObject

@property (nonatomic, strong) NSString *databasePath;

- (void) initDatabase;
- (BOOL) addFavourite:(X2RPost*) post;
- (BOOL) removeFavourite:(X2RPost*) post;
- (NSMutableArray*) getFavourites;

@end
