//
//  SHDetailsViewController.h
//  Numbers
//
//  Created by Oscar Rundh on 2012-09-10.
//  Copyright (c) 2012 Oscar Rundh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *detailTable;
@property (nonatomic) NSUInteger number;

-(id)initWithNumber:(NSUInteger)number;


@end
