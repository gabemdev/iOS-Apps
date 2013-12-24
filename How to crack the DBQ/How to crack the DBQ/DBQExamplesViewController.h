//
//  DBQExamplesViewController.h
//  How to crack the DBQ
//
//  Created by Varun Iyer on 12/5/13.
//  Copyright (c) 2013 MoAppsCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBQExamplesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@property (nonatomic, strong) IBOutlet UITableView *tableView;


@end
