//
//  SHDetailsViewController.m
//  Numbers
//
//  Created by Oscar Rundh on 2012-09-10.
//  Copyright (c) 2012 Oscar Rundh. All rights reserved.
//

#import "SHDetailsViewController.h"
//#import "SHMath.h"
#import "SHCalculations.h"

@interface SHDetailsViewController ()

@end

@implementation SHDetailsViewController

@synthesize number = _number;

-(id)initWithNumber:(NSUInteger)number
{
    
    if (self = [super init]) {
        _number = number;
       
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   self.navigationItem.title = [NSString stringWithFormat:@"%u", self.number];
    //SHMath *matte = [SHMath mathWithNumber:self.number];
    SHCalculations *calculation = [SHCalculations calculateForNumber:self.number];
    NSLog(@"%@", calculation);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
