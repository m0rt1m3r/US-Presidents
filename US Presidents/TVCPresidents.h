//
//  TVCPresidents.h
//  US Presidents
//
//  Created by damian on 09/12/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+ParsingExtensions.h"

@interface TVCPresidents : UITableViewController

@property (nonatomic, retain) NSArray *importedRows;

- (void)handleOpenURL:(NSURL *)url;

@end
