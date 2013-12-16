//
//  CollegeViewController.h
//  College4U
//
//  Created by Varun Iyer on 2/25/13.
//  Copyright (c) 2013 Rohan Patel, Vishwa Iyer, Varun Iyer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface CollegeViewController : UIViewController  <UITableViewDataSource, UITableViewDelegate,ADBannerViewDelegate>
{
}
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;
@end




