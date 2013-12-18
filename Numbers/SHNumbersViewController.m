//
//  SHNumbersViewController.m
//  Numbers
//
//  Created by Oscar Rundh on 2012-09-10.
//  Copyright (c) 2012 Oscar Rundh. All rights reserved.
//

#import "SHNumbersViewController.h"
#import "SHDetailTableViewController.h"


@interface SHNumbersViewController ()

@end

@implementation SHNumbersViewController

@synthesize numberInput = _numberInput;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"Numbers";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)hideTextfield:(UITextField *)textField
{
    [textField resignFirstResponder];
}

-(void)hideKeyboard:(id)sender
{
    [self hideTextfield:self.numberInput];
}

- (IBAction)calculateResult:(id)sender
{
    if (![[self.numberInput text]length]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Enter a number!"
                                                        message:@"You need to enter a number between 0 and 9999999 or use the Random number button."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
        
    } else {
        NSUInteger number = [[self.numberInput text]integerValue];
        [self hideTextfield:self.numberInput];
        if (number == 0) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Number to smal!"
                                                            message:@"You can only enter a number between 1 and 9999999."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [alert show];
        } else if (number < 1000000000) {
            SHDetailTableViewController *detailView = [[SHDetailTableViewController alloc]initWithNumber:number];
            [[self navigationController] pushViewController:detailView animated:YES];
            
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Number to large!"
                                                            message:@"You can only enter a number between 1 and 9999999."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [alert show];
        }
    }

}

- (IBAction)calculateRandomResult:(id)sender
{
    [self hideTextfield:self.numberInput];
    
    SHDetailTableViewController *detailView = [[SHDetailTableViewController alloc]initWithNumber:1 + arc4random_uniform(1500)];
    
    [[self navigationController] pushViewController:detailView animated:YES];
}


@end
