//
//  SHDetailViewController.m
//  Numbers
//
//  Created by Oscar Rundh on 2012-09-15.
//  Copyright (c) 2012 Oscar Rundh. All rights reserved.
//

#import "SHDetailViewController.h"
#import "SHNumberStore.h"

@interface SHDetailViewController ()

@end

@implementation SHDetailViewController
@synthesize textBody = _textBody;
@synthesize calculationTitle = _calculationTitle;
@synthesize extendedDescription = _extendedDescription;
@synthesize result = _result;
@synthesize calculation = _calculation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = self.calculation;
    self.calculationTitle.text = self.result;
    self.textBody.text = self.extendedDescription;
    [self.textBody sizeToFit];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
