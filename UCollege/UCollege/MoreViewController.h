//
//  MoreViewController.h
//  College4U
//
//  Created by Varun Iyer on 3/7/13.
//  Copyright (c) 2013 Rohan Patel, Vishwa Iyer, Varun Iyer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <iAd/iAd.h>


@interface MoreViewController : UIViewController <ADBannerViewDelegate, MFMailComposeViewControllerDelegate>
- (IBAction)showEmail:(id)sender;
- (IBAction)FacebookPage;
- (IBAction)AboutUsPage;
- (IBAction)GoogleCommunityPage;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end
