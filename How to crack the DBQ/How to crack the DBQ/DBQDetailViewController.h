//
//  DBQDetailViewController.h
//  how to crack the dbq
//
//  Created by Varun Iyer on 12/20/13.
//  Copyright (c) 2013 MoAppsCo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBQ.h"


@interface DBQDetailViewController : UIViewController
{
    IBOutlet UIWebView *myWebView;
}
@property (nonatomic, retain) IBOutlet UIWebView *myWebView;
@property (nonatomic, strong) DBQ *dbq;
@end
