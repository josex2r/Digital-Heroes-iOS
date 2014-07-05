//
//  X2RSparseArray.m
//  Digital Heroes
//
//  Created by Jose Luis on 05/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import "X2RSparseArray.h"

@implementation X2RSparseArray

-(void) addItem: (int) key
          value: (id) object{
    [self setObject:object forKey:[NSNumber numberWithInt:key]];
}

-(id) getItem: (int) key{
    return [self objectForKey:[NSNumber numberWithInt:key]];
}

@end
