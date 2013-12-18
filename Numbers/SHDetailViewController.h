//
//  SHDetailViewController.h
//  Numbers
//
//  Created by Oscar Rundh on 2012-09-15.
//  Copyright (c) 2012 Oscar Rundh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *calculationTitle;
@property (weak, nonatomic) IBOutlet UILabel *textBody;

@property (nonatomic, copy) NSString *extendedDescription;
@property (nonatomic, copy) NSString *result;
@property (nonatomic, copy) NSString *calculation;


@end
