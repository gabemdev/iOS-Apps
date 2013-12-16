//
//  BlogViewController.h
//  College4U
//
//  Created by Varun Iyer on 4/6/13.
//  Copyright (c) 2013 Rohan Patel, Vishwa Iyer, Varun Iyer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlogViewController : UIViewController

{
    IBOutlet UIWebView *myWebView;
    
}
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end
