//
//  CollegeDetailViewController.m
//  College4U
//
//  Created by Varun Iyer on 2/25/13.
//  Copyright (c) 2013 Rohan Patel, Vishwa Iyer, Varun Iyer. All rights reserved.
//

#import "CollegeDetailViewController.h"


@interface CollegeDetailViewController ()

@end



@implementation CollegeDetailViewController

@synthesize scrollView = _scrollView;
@synthesize college;




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
    self.title = college.name;
    self.rankLabel.text = college.rank;
    self.collegeNameLabel.text = college.collegeName;
    self.collegePhoto.image = [UIImage imageNamed:college.imageFile];
    self.sizeofCollegeCampusLabel.text = college.sizeofCollegeCampus;
    self.tuitionLabel.text = college.tuition;
    self.numberofStudentsLabel.text = college.numberofStudents;
    self.addressLabel.text = college.address;
    self.acceptanceRateLabel.text = college.acceptanceRate;
    self.phoneNumberLabel.text = college.phoneNumber;
    self.majorProgramsLabel.text = college.majorPrograms;
    self.websiteLabel.text = college.website;
    self.isitIvyLeagueLabel.text = college.isitIvyLeague;
    self.mascotLabel.text = college.mascot;
    self.colorLabel.text = college.color;
    self.satScoreLabel.text = college.satScore;
    self.actScoreLabel.text = college.actScore;
    
    
    
}

- (void)viewDidUnload
{
    [self setCollegePhoto:nil];
    [self setCollegeNameLabel:nil];
    [self setSizeofCollegeCampusLabel:nil];
    [self setTuitionLabel:nil];
    [self setNumberofStudentsLabel:nil];
    [self setAddressLabel:nil];
    [self setAcceptanceRateLabel:nil];
    [self setPhoneNumberLabel:nil];
    [self setMajorProgramsLabel:nil];
    [self setWebsiteLabel:nil];
    [self setMascotLabel:nil];
    [self setColorLabel:nil];
    [self setSatScoreLabel:nil];
    [self setActScoreLabel:nil];
    [self setCollegeNameLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [_scrollView setScrollEnabled:YES];
    [_scrollView setContentSize:CGSizeMake(320,700)];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end

