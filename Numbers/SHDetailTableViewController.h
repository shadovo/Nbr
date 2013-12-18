//
//  SHDetailTableViewController.h
//  Numbers
//
//  Created by Oscar Rundh on 2012-09-14.
//  Copyright (c) 2012 Oscar Rundh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHDetailTableViewController : UITableViewController

@property (nonatomic) NSUInteger number;

-(id)initWithNumber:(NSUInteger)number;

@end
