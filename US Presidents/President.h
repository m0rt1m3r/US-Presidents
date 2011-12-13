//
//  President.h
//  US Presidents
//
//  Created by damian on 09/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface President : NSObject

@property (nonatomic, retain) NSNumber *no;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *wikiurl;
@property (nonatomic, retain) NSDate *tookOffice;
@property (nonatomic, retain) NSDate *leftOffice;
@property (nonatomic, retain) NSString *party;
@property (nonatomic, retain) NSString *homeState;

@end
