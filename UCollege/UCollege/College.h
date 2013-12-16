//
//  College.h
//  College4U
//
//  Created by Varun Iyer on 2/25/13.
//  Copyright (c) 2013 Rohan Patel, Vishwa Iyer, Varun Iyer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface College : NSObject

@property (nonatomic, strong) NSString *name; // name of college
@property (nonatomic, strong) NSString *collegeName; //name of college
@property (nonatomic, strong) NSString *rank; // college rank
@property (nonatomic, strong) NSString *imageFile; // image filename of recipe
@property (nonatomic, strong) NSString *sizeofCollegeCampus; // size of the College Campus
@property (nonatomic, strong) NSString *tuition; // tuition for College
@property (nonatomic, strong) NSString *numberofStudents; // # of students in the college
@property (nonatomic, strong) NSString *address; // address of college
@property (nonatomic, strong) NSString *phoneNumber; // phone number of the college
@property (nonatomic, strong) NSString *acceptanceRate; // acceptance rate for the college
@property (nonatomic, strong) NSString *majorPrograms; // major programs college excels in
@property (nonatomic, strong) NSString *website; // website of the college
@property (nonatomic, strong) NSString *isitIvyLeague; // is the college Ivy League?
@property (nonatomic, strong) NSString *mascot; // mascot of the college
@property (nonatomic, strong) NSString *color; // color of the college
@property (nonatomic, strong) NSString *satScore; // Sat score range for the college
@property (nonatomic, strong) NSString *actScore; // Act score range for the college
@property (nonatomic, strong) NSString *collegeNameCell;
@property (nonatomic, strong) NSString *collegeRankCell;
@property (nonatomic, strong) NSString *collegePhotoCell;
@property (nonatomic, strong) NSString *AboutUsCell;


@end
