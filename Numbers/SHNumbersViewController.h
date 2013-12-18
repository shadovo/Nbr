//
//  SHNumbersViewController.h
//  Numbers
//
//  Created by Oscar Rundh on 2012-09-10.
//  Copyright (c) 2012 Oscar Rundh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHNumbersViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *numberInput;

- (IBAction)calculateResult:(id)sender;
- (IBAction)calculateRandomResult:(id)sender;
- (IBAction)hideKeyboard:(id)sender;
-(void)hideTextfield:(UITextField *)textField;


@end
