//
//  SHDetailTableViewController.m
//  Numbers
//
//  Created by Oscar Rundh on 2012-09-14.
//  Copyright (c) 2012 Oscar Rundh. All rights reserved.
//

#import "SHDetailTableViewController.h"
#import "SHCalculations.h"
#import "SHNumberStore.h"
#import "SHDetailViewController.h"

@interface SHDetailTableViewController ()

@end

@implementation SHDetailTableViewController

@synthesize number = _number;

-(id)initWithNumber:(NSUInteger)number
{
    if (self = [super initWithStyle:UITableViewStyleGrouped]) {
        self.number = number;
    }
    return self;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    if (self = [self init]) {
    }
    return self;
}

-(id)init{
    return [self initWithNumber:73];
}

- (void)viewDidLoad
{
    [super viewDidLoad];    
    self.navigationItem.title = [NSString stringWithFormat:@"%u", self.number];
    [SHCalculations calculateForNumber:self.number];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.textLabel.text = [NSString stringWithFormat:@"%@:", [[[SHNumberStore sharedStore] allDescriptionTexts] objectAtIndex:[indexPath row]]];
    
    cell.detailTextLabel.text = [[[SHNumberStore sharedStore] allResults] objectAtIndex:[indexPath row]];
    
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     SHDetailViewController *detailViewController = [[SHDetailViewController alloc] init];
    detailViewController.calculation = [[[SHNumberStore sharedStore] allDescriptionTexts]objectAtIndex:[indexPath row]];
    detailViewController.result = [[[SHNumberStore sharedStore] allResults]objectAtIndex:[indexPath row]];
    detailViewController.extendedDescription = [[SHNumberStore sharedStore]extendedDescriptionForIndex:[indexPath row]];
                                                                           
     [self.navigationController pushViewController:detailViewController animated:YES];
    
}

@end
