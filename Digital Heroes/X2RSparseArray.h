//
//  X2RSparseArray.h
//  Digital Heroes
//
//  Created by Jose Luis on 05/07/14.
//  Copyright (c) 2014 josex2r. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface X2RSparseArray : NSMutableDictionary

-(void) addItem: (int) key
          value: (id) object;

-(id) getItem: (int) key;

@end
