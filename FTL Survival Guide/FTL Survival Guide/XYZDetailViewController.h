//
//  XYZDetailViewController.h
//  FTL Survival Guide
//
//  Created by Rohan on 1/9/14.
//  Copyright (c) 2014 Rohan Patel, Nishanth Shanmugham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYZDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
