//
//  FNDMainViewController.h
//  tableViewExpandTry
//
//  Created by dev 1 on 12-10-17.
//  Copyright (c) 2012年 dev 1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FNDMainViewController : UITableViewController{
    NSMutableArray *_nameArray;
    NSIndexPath *_selsectedIndexPath;
    
    NSMutableArray *boolArray;
}

@property (nonatomic, copy) NSMutableArray *nameArray;

@end
