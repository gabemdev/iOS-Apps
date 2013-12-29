//
//  DBQExtraDetailViewController.m
//  how to crack the dbq
//
//  Created by Varun Iyer on 12/29/13.
//  Copyright (c) 2013 MoAppsCo. All rights reserved.
//

#import "DBQExtraDetailViewController.h"

@interface DBQExtraDetailViewController ()

@end

@implementation DBQExtraDetailViewController

@synthesize myWebView2;
@synthesize extra;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:extra.DBQPdf2 ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [myWebView2 loadRequest:request];
    self.title = extra.DBQNameCell2;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
