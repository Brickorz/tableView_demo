//
//  FNDMainViewController.m
//  tableViewExpandTry
//
//  Created by dev 1 on 12-10-17.
//  Copyright (c) 2012年 dev 1. All rights reserved.
//

#import "FNDMainViewController.h"

@interface FNDMainViewController ()

@end

@implementation FNDMainViewController
@synthesize nameArray = _nameArray;

#pragma mark - lifeCycle methods
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        _nameArray = [[NSMutableArray alloc] init];
        NSArray *array1 = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
        NSArray *array2 = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g", nil];
        NSArray *array3 = [NSArray arrayWithObjects:@"liu",@"ping",@"wei",@"ni",@"hao",@"haha",@"your", nil];
        NSArray *array4 = [NSArray arrayWithObjects:@"apple",@"banana",@"orange",@"give",@"me",@"off",@"up", nil];
        NSArray *array5 = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
        NSArray *array6 = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g", nil];
        NSArray *array7 = [NSArray arrayWithObjects:@"liu",@"ping",@"wei",@"ni",@"hao",@"haha",@"your", nil];
        NSArray *array8 = [NSArray arrayWithObjects:@"apple",@"banana",@"orange",@"give",@"me",@"off",@"up", nil];
        NSArray *array9 = [NSArray arrayWithObjects:@"you",@"me", nil];
        [_nameArray addObject:array1];
        [_nameArray addObject:array2];
        [_nameArray addObject:array3];
        [_nameArray addObject:array4];
        [_nameArray addObject:array5];
        [_nameArray addObject:array6];
        [_nameArray addObject:array7];
        [_nameArray addObject:array8];
        [_nameArray addObject:array9];

    }
    return self;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    boolArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.nameArray.count; i++) {
        [boolArray addObject:@"no"];
    }

}

#pragma mark - manage memory metohds

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)dealloc{
    boolArray = nil;
    [boolArray release];
    _nameArray = nil;
    [_nameArray release];
    _selsectedIndexPath = nil;
    [_selsectedIndexPath release];
    [super dealloc];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return [_nameArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([boolArray[section] isEqual: @"yes"]) {
        return [[_nameArray objectAtIndex:section] count];
    }else{
        return 2;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    if ([[_nameArray objectAtIndex:indexPath.section] count] > indexPath.row) {
        cell.textLabel.text = [[_nameArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    }
    
    if ([boolArray[indexPath.section] isEqual: @"no"] &&
        indexPath.row == 1 &&
        [[self.nameArray objectAtIndex:indexPath.section] count] != 2) {
        cell.textLabel.text = nil;
        cell.textLabel.text = @"更多";
    }
    
    return cell;

}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:indexPath.section]];

    if ([boolArray[indexPath.section] isEqual: @"no"]) {
    boolArray[indexPath.section] = @"yes";
        cell.textLabel.text = [[self.nameArray objectAtIndex:indexPath.section]objectAtIndex:1];
        
    for (NSInteger i = 2; i < [[_nameArray objectAtIndex:indexPath.section] count]; i++) {
        NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:indexPath.section];
        [array addObject:index];
    }
    [self.tableView insertRowsAtIndexPaths:array
                          withRowAnimation:UITableViewRowAnimationFade];
        
    }else{
        boolArray[indexPath.section] = @"no";
        cell.textLabel.text = @"更多";
        for (NSInteger i = 2; i < [[_nameArray objectAtIndex:indexPath.section] count]; i++) {
            NSIndexPath *index = [NSIndexPath indexPathForRow:i inSection:indexPath.section];
            [array addObject:index];
        }
        [self.tableView deleteRowsAtIndexPaths:array
                              withRowAnimation:UITableViewRowAnimationFade];
    
    }
    [array release];
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([[self.nameArray objectAtIndex:indexPath.section] count] == 2) {
        return nil;
    }
    if ([boolArray[indexPath.section] isEqual: @"yes"]) {
            return indexPath;
    }else{
        if (indexPath.row == 1) {
            return indexPath;
        }else{
            return nil;
        }
    }
    
}

@end
