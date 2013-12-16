//
//  WebViewController.h
//  How to crack the DBQ
//
//  Created by Varun Iyer on 9/26/13.
//  Copyright (c) 2013 MoAppsCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewController : UIViewController

{
    IBOutlet UIWebView *myWebView;
    
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;


@end
