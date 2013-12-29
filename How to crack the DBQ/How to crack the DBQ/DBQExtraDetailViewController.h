//
//  DBQExtraDetailViewController.h
//  how to crack the dbq
//
//  Created by Varun Iyer on 12/29/13.
//  Copyright (c) 2013 MoAppsCo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBQ2.h"

@interface DBQExtraDetailViewController : UIViewController
{
    IBOutlet UIWebView *myWebView2;
}
@property (nonatomic, retain) IBOutlet UIWebView *myWebView2;

@property (nonatomic, strong) DBQ2 *extra;



@end
