//
//  DBQDetailViewController.m
//  how to crack the dbq
//
//  Created by Varun Iyer on 12/20/13.
//  Copyright (c) 2013 MoAppsCo. All rights reserved.
//

#import "DBQDetailViewController.h"

@interface DBQDetailViewController ()

@end

@implementation DBQDetailViewController

@synthesize myWebView;
@synthesize dbq;

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
    NSString *path = [[NSBundle mainBundle] pathForResource:dbq.DBQPdf ofType:@"pdf"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:request];
    self.title = dbq.DBQNameCell;
    
    
    
	// Do any additional setup after loading the view.
}


- (void)viewDidUnload
{
    [super viewDidUnload];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end
