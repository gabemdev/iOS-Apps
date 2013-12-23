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
    self.dbqimage.image = [UIImage imageNamed:dbq.DBQImage];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [self setDbqimage:nil];
    // Dispose of any resources that can be recreated.
}

@end
