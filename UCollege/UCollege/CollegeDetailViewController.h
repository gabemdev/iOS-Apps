//
//  CollegeDetailViewController.h
//  College4U
//
//  Created by Varun Iyer on 2/25/13.
//  Copyright (c) 2013 Rohan Patel, Vishwa Iyer, Varun Iyer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "College.h"

@interface CollegeDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *collegeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *rankLabel;
@property (weak, nonatomic) IBOutlet UILabel *tuitionLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberofStudentsLabel;
@property (weak, nonatomic) IBOutlet UILabel *acceptanceRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *majorProgramsLabel;
@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;
@property (weak, nonatomic) IBOutlet UILabel *isitIvyLeagueLabel;
@property (weak, nonatomic) IBOutlet UILabel *mascotLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *satScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *actScoreLabel;
@property (weak, nonatomic) IBOutlet UIImageView *collegePhoto;
@property (nonatomic, strong) College *college;
@property (weak, nonatomic) IBOutlet UILabel *sizeofCollegeCampusLabel;

@end
