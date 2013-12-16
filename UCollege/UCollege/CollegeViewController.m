//
//  CollegeViewController.m
//  College4U
//
//  Created by Varun Iyer on 2/25/13.
//  Copyright (c) 2013 Rohan Patel, Vishwa Iyer, Varun Iyer. All rights reserved.
//
#import "CollegeViewController.h"
#import "CollegeDetailViewController.h"
#import "College.h"
#import "SWRevealViewController.h"

@interface CollegeViewController ()

@end

@implementation CollegeViewController {
    NSArray *colleges;
    NSArray *searchResults;


}

static NSString *simpleTableIdentifier = @"Cell";

- (void)viewDidLoad
{
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.parentViewController.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"common_bg.png"]];
    self.tableView.backgroundColor = [UIColor clearColor];
    UIEdgeInsets inset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.tableView.contentInset = inset;
    [super viewDidLoad];
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.96f alpha:0.2f];
    
    // Add pan gesture to hide the sidebar
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    self.navigationItem.title = @"List of Colleges";
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    [[self navigationItem] setBackBarButtonItem:backButton];
    
    // Do any additional setup after loading the view.
    College *college1 = [College new];
    college1.name = @"Harvard University";
    college1.collegeName = @"Harvard University";
    college1.rank = @"#1";
    college1.imageFile = @"01.jpg";
    college1.sizeofCollegeCampus = @"210 acres";
    college1.tuition = @"$38,480";
    college1.numberofStudents = @"27,392";
    college1.address = @"Massachusetts Hall, Cambridge, MA 02138";
    college1.acceptanceRate = @"5.9%";
    college1.phoneNumber = @"(617) 495-1000";
    college1.majorPrograms = @"Economics, Political Science and Government, Psychology, English Language and Literature/Letters, and Social Sciences";
    college1.website = @"www.harvard.edu/";
    college1.isitIvyLeague = @"Yes";
    college1.mascot = @"John Harvard";
    college1.color = @"crimson";
    college1.satScore = @"";
    college1.actScore = @"";
    college1.collegeNameCell = @"Harvard University";
    college1.collegeRankCell = @"#1";
    college1.collegePhotoCell = @"Harvard_Wreath_Logo_1.svg.png";
    
    College *college2 = [College new];
    college2.name = @"Princeton University";
    college2.collegeName = @"Princeton University";
    college2.rank = @"#2";
    college2.imageFile = @"college-photo_6976..png";
    college2.sizeofCollegeCampus = @"500 acres";
    college2.tuition = @"$38,650";
    college2.numberofStudents = @"7,813";
    college2.address = @"Princeton University, Princeton, NJ 08540";
    college2.acceptanceRate = @"8.5%";
    college2.phoneNumber = @"(609) 258-3000";
    college2.majorPrograms = @"Economics, Political Science and Government, History, Public Policy Analysis, and Operations Research";
    college2.website = @"www.princeton.edu/";
    college2.isitIvyLeague = @"Yes";
    college2.mascot = @"Tiger";
    college2.color = @"Black, Princeton Orange, Orange";
    college2.satScore = @"";
    college2.actScore = @"";
    college2.collegeNameCell = @"Princeton University";
    college2.collegeRankCell = @"#2";
    college2.collegePhotoCell = @"157px-Princeton_shield.png";
    
    College *college3 = [College new];
    college3.name = @"Yale University";
    college3.collegeName = @"Yale University";
    college3.rank = @"#3";
    college3.imageFile = @"college-photo_8737.png";
    college3.sizeofCollegeCampus = @"315 acres";
    college3.tuition = @"$34,400";
    college3.numberofStudents = @"11,875";
    college3.address = @"Yale University, New Haven, CT";
    college3.acceptanceRate = @"6.80%";
    college3.phoneNumber = @"(203) 432-4771";
    college3.majorPrograms = @"Political Science and Government, Economics, History, Psychology, and Biology/Biological Sciences";
    college3.website = @"www.yale.edu/";
    college3.isitIvyLeague = @"Yes";
    college3.mascot = @"Handsome Dan";
    college3.color = @"Yale Blue";
    college3.satScore = @"";
    college3.actScore = @"";
    college3.collegeNameCell = @"Yale University";
    college3.collegeRankCell = @"#3";
    college3.collegePhotoCell = @"Yale_University_Shield_1.png";
    
    College *college4 = [College new];
    college4.name = @"Columbia University";
    college4.collegeName = @"Columbia University";
    college4.rank = @"#4";
    college4.imageFile = @"columbia_u.png";
    college4.sizeofCollegeCampus = @"299 acres";
    college4.tuition = @"$32,000";
    college4.numberofStudents = @"6,027";
    college4.address = @"Broadway, New York, NY 10027";
    college4.acceptanceRate = @"7.40%";
    college4.phoneNumber = @"(212) 854-1754";
    college4.majorPrograms = @"Social Sciences, History, English, Foreign Languages and Literature, and Visual and Performing Arts";
    college4.website = @"www.columbia.edu/";
    college4.isitIvyLeague = @"Yes";
    college4.mascot = @"Lion";
    college4.color = @"White, Columbia Blue";
    college4.satScore = @"";
    college4.actScore = @"";
    college4.collegeNameCell = @"Columbia University";
    college4.collegeRankCell = @"#4";
    college4.collegePhotoCell = @"200px-ColumbiaNYUCoat.png";
    
    College *college5 = [College new];
    college5.name = @"University of Chicago";
    college5.collegeName = @"University of Chicago";
    college5.rank = @"#5";
    college5.imageFile = @"chicago_u.png";
    college5.sizeofCollegeCampus = @"215 acres";
    college5.tuition = @"$39,201";
    college5.numberofStudents = @"5,388";
    college5.address = @"5801 S Ellis Ave, Chicago, IL 60637";
    college5.acceptanceRate = @"13.0%";
    college5.phoneNumber = @"(773) 702-1234";
    college5.majorPrograms = @"Social Sciences, Biological and Biomedical Sciences, Mathematics and Statistics, Physical Sciences, Foreign Languages, Literatures, and Linguistics";
    college5.website = @"www.uchicago.edu/";
    college5.isitIvyLeague = @"No";
    college5.mascot = @"Pheonix";
    college5.color = @"White, Maroon";
    college5.satScore = @"";
    college5.actScore = @"";
    college5.collegeNameCell = @"University of Chicago";
    college5.collegeRankCell = @"#5";
    college5.collegePhotoCell = @"University_of_Chicago_Modern_Etched_Seal_1.png";
    
    College *college6 = [College new];
    college6.name = @"Massachusetts Institute of Technology";
    college6.collegeName = @"Massachusetts Institute of Technology";
    college6.rank = @"#6";
    college6.imageFile = @"mit_u.png";
    college6.sizeofCollegeCampus = @"168 acres";
    college6.tuition = @"$42,050";
    college6.numberofStudents = @"10,894";
    college6.address = @"77 Massachusetts Ave, Cambridge, MA 02139";
    college6.acceptanceRate = @"9.7%";
    college6.phoneNumber = @"(617) 253-1000";
    college6.majorPrograms = @"Engineering, Computer Science, Physical Sciences, Biological and Biomedical Sciences, and Mathematics, General";
    college6.website = @"www.mit.edu";
    college6.isitIvyLeague = @"No";
    college6.mascot = @"Tim the Beaver";
    college6.color = @"Grey, Cardinal";
    college6.satScore = @"";
    college6.actScore = @"";
    college6.collegeNameCell = @"Massachusetts Institute of Technology";
    college6.collegeRankCell = @"#6";
    college6.collegePhotoCell = @"MIT_Seal.png";
    
    College *college7 = [College new];
    college7.name = @"Stanford University";
    college7.collegeName = @"Stanford University";
    college7.rank = @"#7";
    college7.imageFile = @"stan_u.png";
    college7.sizeofCollegeCampus = @"8,180 acres";
    college7.tuition = @"$40,050";
    college7.numberofStudents = @"15,870";
    college7.address = @"450 Serra Mall, Stanford, CA 94305";
    college7.acceptanceRate = @"6.6%";
    college7.phoneNumber = @"(650) 723-2300";
    college7.majorPrograms = @"Library Science, Multi/Interdisciplinary Studies, Engineering, Biological and Biomedical Sciences, and Physical Sciences";
    college7.website = @"www.stanford.edu";
    college7.isitIvyLeague = @"No";
    college7.mascot = @"Stanford Tree";
    college7.color = @"Cardinal, White";
    college7.satScore = @"";
    college7.actScore = @"";
    college7.collegeNameCell = @"Stanford University";
    college7.collegeRankCell = @"#7";
    college7.collegePhotoCell = @"Stan-Shield.gif";
    
    College *college8 = [College new];
    college8.name = @"Duke University";
    college8.collegeName = @"Duke University";
    college8.rank = @"#8";
    college8.imageFile = @"college-photo_8736.png";
    college8.sizeofCollegeCampus = @"8,709 acres";
    college8.tuition = @"$43,623";
    college8.numberofStudents = @"14,591";
    college8.address = @"2138 Campus Dr, Durham, NC 27705";
    college8.acceptanceRate = @"11%";
    college8.phoneNumber = @"(919) 684-8111";
    college8.majorPrograms = @"Biology, Psychology, Economics, Political Science and Government, and Public Policy Analysis";
    college8.website = @"www.duke.edu";
    college8.isitIvyLeague = @"No";
    college8.mascot = @"Blue Devil";
    college8.color = @"White, Duke Blue";
    college8.satScore = @"";
    college8.actScore = @"";
    college8.collegeNameCell = @"Duke University";
    college8.collegeRankCell = @"#8";
    college8.collegePhotoCell = @"Duke_University_Crest.png";
    
    College *college9 = [College new];
    college9.name = @"University of Pennsylvania";
    college9.collegeName = @"University of Pennsylvania";
    college9.rank = @"#9";
    college9.imageFile = @"college-photo_8376..png";
    college9.sizeofCollegeCampus = @"279 acres";
    college9.tuition = @"$43,623";
    college9.numberofStudents = @"21,329";
    college9.address = @"423 Guardian Dr #175, Philadelphia, PA 19104";
    college9.acceptanceRate = @"12.3%";
    college9.phoneNumber = @"(215) 662-4000";
    college9.majorPrograms = @"Finance, Economics, Registered Nursing/Registered Nurse, Political Science and Government, and History";
    college9.website = @"www.upenn.edu";
    college9.isitIvyLeague = @"Yes";
    college9.mascot = @"The Quaker";
    college9.color = @"Red, Blue";
    college9.satScore = @"";
    college9.actScore = @"";
    college9.collegeNameCell = @"University of Pennsylvania";
    college9.collegeRankCell = @"#9";
    college9.collegePhotoCell = @"images.png";
    
    College *college10 = [College new];
    college10.name = @"California Institute of Technology";
    college10.collegeName = @"California Institute of Technology";
    college10.rank = @"#10";
    college10.imageFile = @"college-photo_91.png";
    college10.sizeofCollegeCampus = @"124 acres";
    college10.tuition = @"$39,588";
    college10.numberofStudents = @"2,231";
    college10.address = @"263 S Chester Ave, Pasadena, CA 91106";
    college10.acceptanceRate = @"13%";
    college10.phoneNumber = @"(626) 395-6811";
    college10.majorPrograms = @"Engineering, Physical Sciences, Computer and Information Sciences and Support Services, Mathematics and Statistics, Biological and Biomedical Sciences";
    college10.website = @"www.caltech.edu";
    college10.isitIvyLeague = @"No";
    college10.mascot = @"California Institute of Technology Beaver";
    college10.color = @"Orange, White";
    college10.satScore = @"";
    college10.actScore = @"";
    college10.collegeNameCell = @"California Institute of Technology";
    college10.collegeRankCell = @"#10";
    college10.collegePhotoCell = @"seal.png";
    
    College *college11 = [College new];
    college11.name = @"Dartmouth College";
    college11.collegeName = @"Dartmouth College";
    college11.rank = @"#11";
    college11.imageFile = @"dart-campus.jpeg";
    college11.sizeofCollegeCampus = @"200 acres";
    college11.tuition = @"$45,042";
    college11.numberofStudents = @"4,194";
    college11.address = @"6016 McNutt Hall Hanover, NH 03755";
    college11.acceptanceRate = @"10.1%";
    college11.phoneNumber = @"(603) 646-1110";
    college11.majorPrograms = @"Economics, Political Science and Government, Psychology, Engineering, and History";
    college11.website = @"www.dartmouth.edu";
    college11.isitIvyLeague = @"Yes";
    college11.mascot = @"Dartmouth Moose, Keggy the Keg";
    college11.color = @"Dartmouth green";
    college11.satScore = @"";
    college11.actScore = @"";
    college11.collegeNameCell = @"Dartmouth College";
    college11.collegeRankCell = @"#11";
    college11.collegePhotoCell = @"dart-seal.png";
    
    College *college12 = [College new];
    college12.name = @"Northwestern University";
    college12.collegeName = @"Northwestern University";
    college12.rank = @"#12";
    college12.imageFile = @"college-photo_3270..jpg";
    college12.sizeofCollegeCampus = @"231 acres";
    college12.tuition = @"$43,779";
    college12.numberofStudents = @"8,475";
    college12.address = @"633 Clark Street Evanston, IL 60208";
    college12.acceptanceRate = @"18%";
    college12.phoneNumber = @"(847) 491-3741";
    college12.majorPrograms = @"Biology, Communications Studies, Economics, History, Journalism, Political Science, Psychology, and Theatre";
    college12.website = @"www.northwestern.edu";
    college12.isitIvyLeague = @"No";
    college12.mascot = @"Northwestern Eagle";
    college12.color = @"Purple, Gold";
    college12.satScore = @"";
    college12.actScore = @"";
    college12.collegeNameCell = @"Northwestern University";
    college12.collegeRankCell = @"#12";
    college12.collegePhotoCell = @"viewer2.png";
    
    College *college13 = [College new];
    college13.name = @"Johns Hopkins University";
    college13.collegeName = @"Johns Hopkins University";
    college13.rank = @"#13";
    college13.imageFile = @"photos.jpeg";
    college13.sizeofCollegeCampus = @"140 acres";
    college13.tuition = @"$43,930";
    college13.numberofStudents = @"5,980";
    college13.address = @"3400 N. Charles Street Baltimore, MD 21218";
    college13.acceptanceRate = @"18%";
    college13.phoneNumber = @" (410) 516-8000";
    college13.majorPrograms = @"Public Health, International Relations and Affairs, Bioengineering and Biomedical Engineering, Economics, and Psychology";
    college13.website = @"www.jhu.edu";
    college13.isitIvyLeague = @"No";
    college13.mascot = @"Blue Jay";
    college13.color = @"Old Gold, Sable, Columbia blue, Black";
    college13.satScore = @"";
    college13.actScore = @"";
    college13.collegeNameCell = @"Johns Hopkins University";
    college13.collegeRankCell = @"#13";
    college13.collegePhotoCell = @"JHU_University_Seal.png";
    
    
    College *college14 = [College new];
    college14.name = @"Washington University";
    college14.collegeName =college14.name;
    college14.rank = @"#14";
    college14.imageFile = @"WashUCampus.jpeg";
    college14.sizeofCollegeCampus = @"215 acres";
    college14.tuition = @"$43,705";
    college14.numberofStudents = @"7,239";
    college14.address = @"1 Brookings Drive St. Louis, MO 63130-4899";
    college14.acceptanceRate = @"16.5%";
    college14.phoneNumber = @"(314) 935-5000";
    college14.majorPrograms = @"Social Sciences, Engineering, Pre-Medicine/Pre-Medical Studies, Business, Management, Marketing, and Related Support Services, Biological and Biomedical Sciences";
    college14.website = @"www.wustl.edu";
    college14.isitIvyLeague = @"No";
    college14.mascot = @"Washington University Bear";
    college14.color = @"Red, Green";
    college14.satScore = @"";
    college14.actScore = @"";
    college14.collegeNameCell = college14.name;
    college14.collegeRankCell = @"#14";
    college14.collegePhotoCell = @"WashUShield.png";
    
    
    College *college15 = [College new];
    college15.name = @"Brown University";
    college15.collegeName =college15.name;
    college15.rank = @"#15";
    college15.imageFile = @"browncampus.jpeg";
    college15.sizeofCollegeCampus = @"140 acres";
    college15.tuition = @"$43,758";
    college15.numberofStudents = @"6,380";
    college15.address = @"1920 Providence, RI 02912";
    college15.acceptanceRate = @"8.9%";
    college15.phoneNumber = @"(401) 863-1000";
    college15.majorPrograms = @"Economics, Biology/Biological Sciences, International Relations and Affairs, History, and Political Science and Government";
    college15.website = @"www.brown.edu";
    college15.isitIvyLeague = @"Yes";
    college15.mascot = @"Brown Bear";
    college15.color = @"Cardinal, White, Seal brown";
    college15.satScore = @"";
    college15.actScore = @"";
    college15.collegeNameCell = college15.name;
    college15.collegeRankCell = @"#15";
    college15.collegePhotoCell = @"url2.jpeg";
    
    College *college16 = [College new];
    college16.name = @"Cornell University";
    college16.collegeName =college16.name;
    college16.rank = @"#16";
    college16.imageFile = @"CornellCampus.jpeg";
    college16.sizeofCollegeCampus = @"745 acres";
    college16.tuition = @"$43,413";
    college16.numberofStudents = @"22,400";
    college16.address = @"Ithaca, NY 14853";
    college16.acceptanceRate = @"16.2%";
    college16.phoneNumber = @"(607) 254-4636";
    college16.majorPrograms = @"Engineering, Business, Management, Marketing, and Related Support Services, Agriculture, Agriculture Operations, and Related Sciences, Biological and Biomedical Sciences, and Social Sciences";
    college16.website = @"www.cornell.edu/";
    college16.isitIvyLeague = @"Yes";
    college16.mascot = @"Big Red Bear";
    college16.color = @"White, Carnelian";
    college16.satScore = @"";
    college16.actScore = @"";
    college16.collegeNameCell = college16.name;
    college16.collegeRankCell = @"#16";
    college16.collegePhotoCell = @"CornellSeal.jpeg";
    
    College *college17 = [College new];
    college17.name = @"Rice University";
    college17.collegeName =college17.name;
    college17.rank = @"#17";
    college17.imageFile = @"RiceCampus.jpeg";
    college17.sizeofCollegeCampus = @"285 acres";
    college17.tuition = @"$37,292";
    college17.numberofStudents = @"3,755";
    college17.address = @"6100 Main St, Houston, TX 77005";
    college17.acceptanceRate = @"19%";
    college17.phoneNumber = @"(713) 348-0000";
    college17.majorPrograms = @"Economics, Biochemistry, Mechanical Engineering, Psychology, and Kinesiology and Exercise Science";
    college17.website = @"www.rice.edu/";
    college17.isitIvyLeague = @"No";
    college17.mascot = @"Sammy the Owl";
    college17.color = @"Blue, Grey";
    college17.satScore = @"";
    college17.actScore = @"";
    college17.collegeNameCell = college17.name;
    college17.collegeRankCell = @"#17";
    college17.collegePhotoCell = @"RiceSeal.png";
    
    College *college18 = [College new];
    college18.name = @"University of Notre Dame";
    college18.collegeName =college18.name;
    college18.rank = @"#18";
    college18.imageFile = @"NDCampus.jpeg";
    college18.sizeofCollegeCampus = @"1,250 acres";
    college18.tuition = @"$42,971";
    college18.numberofStudents = @"8,452";
    college18.address = @"112 N Notre Dame Ave, South Bend, IN 46556";
    college18.acceptanceRate = @"24%";
    college18.phoneNumber = @"(574) 631-5000";
    college18.majorPrograms = @"Finance, Accounting, Political Science and Government, Biology/Biological Sciences, and Psychology";
    college18.website = @"www.nd.edu/";
    college18.isitIvyLeague = @"No";
    college18.mascot = @"The Notre Dame Leprechaun";
    college18.color = @"Blue, Gold";
    college18.satScore = @"";
    college18.actScore = @"";
    college18.collegeNameCell = college18.name;
    college18.collegeRankCell = @"#18";
    college18.collegePhotoCell = @"NDSeal.png";
    
    College *college19 = [College new];
    college19.name = @"Vanderbilt University";
    college19.collegeName =college19.name;
    college19.rank = @"#19";
    college19.imageFile = @"VanderbiltCampus.jpeg";
    college19.sizeofCollegeCampus = @"333 acres";
    college19.tuition = @"$42,118";
    college19.numberofStudents = @"6,817";
    college19.address = @"2201 West End Ave, Nashville, TN 37235";
    college19.acceptanceRate = @"14.2%";
    college19.phoneNumber = @"(615) 322-7311";
    college19.majorPrograms = @"human and organizational development, economics, history, mathematics, political science, English, Spanish, and biomedical engineering.";
    college19.website = @"www.vanderbilt.edu/";
    college19.isitIvyLeague = @"No";
    college19.mascot = @"Mr. Commodore";
    college19.color = @"Black, Old Gold";
    college19.satScore = @"";
    college19.actScore = @"";
    college19.collegeNameCell = college19.name;
    college19.collegeRankCell = @"#19";
    college19.collegePhotoCell = @"VanderbiltSeal.jpeg";
    
    College *college20 = [College new];
    college20.name = @"Emory University";
    college20.collegeName =college20.name;
    college20.rank = @"#20";
    college20.imageFile = @"EmoryCampus.jpeg";
    college20.sizeofCollegeCampus = @"630 acres";
    college20.tuition = @"$42,980";
    college20.numberofStudents = @"7,441";
    college20.address = @"1615 Pierce D NE, Atlanta, GA 30322";
    college20.acceptanceRate = @"26.7%";
    college20.phoneNumber = @"(404) 727-6123";
    college20.majorPrograms = @"Business Administration and Management, Economics, Biology/Biological Sciences, Psychology, and Registered Nursing/Registered Nurse";
    college20.website = @"www.emory.edu/";
    college20.isitIvyLeague = @"No";
    college20.mascot = @"Swoop the Eagle";
    college20.color = @"Gold, Blue";
    college20.satScore = @"";
    college20.actScore = @"";
    college20.collegeNameCell = college20.name;
    college20.collegeRankCell = @"#20";
    college20.collegePhotoCell = @"EmorySeal.jpeg";
    
    College *college21 = [College new];
    college21.name = @"Georgetown University";
    college21.collegeName = @"Georgetown University";
    college21.rank = @"#21";
    college21.imageFile = @"college-photo_7438..jpg";
    college21.sizeofCollegeCampus = @"104 acres";
    college21.tuition = @"$42,870";
    college21.numberofStudents = @"7,590";
    college21.address = @"3700 O St NW, Washington, DC 20057";
    college21.acceptanceRate = @"20%";
    college21.phoneNumber = @"(202) 687-0100";
    college21.majorPrograms = @"Social Sciences, Business/Marketing, English, Health Professions, and Foreign Languages and Literature";
    college21.website = @"www.georgetown.edu/";
    college21.isitIvyLeague = @"No";
    college21.mascot = @"Jack the Bulldog";
    college21.color = @"Grey, Blue";
    college21.satScore = @"";
    college21.actScore = @"";
    college21.collegeNameCell = college21.name;
    college21.collegeRankCell = @"#21";
    college21.collegePhotoCell = @"george_seal.png";
    
    College *college22 = [College new];
    college22.name = @"University of California (Berkley)";
    college22.collegeName = @"University of California (Berkley)";
    college22.rank = @"#22";
    college22.imageFile = @"California_Berkley_Seal.jpeg";
    college22.sizeofCollegeCampus = @"1,232 acres";
    college22.tuition = @"$34,645";
    college22.numberofStudents = @"25,885";
    college22.address = @"110 Sproul Hall Berkeley, CA 94720-5800";
    college22.acceptanceRate = @"21.60%";
    college22.phoneNumber = @"(510) 642-6000";
    college22.majorPrograms = @"Social Sciences, Biological and Biomedical Sciences, Engineering, English Language and Literature/Letters, and Natural Resources and Conservation";
    college22.website = @"www.berkeley.edu/";
    college22.isitIvyLeague = @"No";
    college22.mascot = @"Oski";
    college22.color = @"Yale Blue, California Gold";
    college22.satScore = @"";
    college22.actScore = @"";
    college22.collegeNameCell = college22.name;
    college22.collegeRankCell = @"#22";
    college22.collegePhotoCell = @"University_of_California_Seal.svg.png";
    
    College *college23 = [College new];
    college23.name = @"Carnegie Mellon University";
    college23.collegeName = college23.name;
    college23.rank = @"#23";
    college23.imageFile = @"college-photo_7656..jpg";
    college23.sizeofCollegeCampus = @"145 acres";
    college23.tuition = @"$45,124";
    college23.numberofStudents = @"6,281";
    college23.address = @"5000 Forbes Ave, Pittsburgh, PA 15213";
    college23.acceptanceRate = @"30%";
    college23.phoneNumber = @"(412) 268-2000";
    college23.majorPrograms = @"Computer Science, Electrical and Electronics Engineering, Systems Science and Theory, Mechanical Engineering, and Business Administration and Management";
    college23.website = @"www.cmu.edu/";
    college23.isitIvyLeague = @"No";
    college23.mascot = @"Scotty the Scottie Dog";
    college23.color = @"Cardinal, Grey, Tartan plaid";
    college23.satScore = @"";
    college23.actScore = @"";
    college23.collegeNameCell = college23.name;
    college23.collegeRankCell = @"#23";
    college23.collegePhotoCell = @"carnegie_mellon_U_seal.png";
    
    College *college24 = [College new];
    college24.name = @"University of California (Los Angeles)";
    college24.collegeName = college24.name;
    college24.rank = @"#24";
    college24.imageFile = @"ucla_campus.jpeg";
    college24.sizeofCollegeCampus = @"419 acres";
    college24.tuition = @"$35,570";
    college24.numberofStudents = @"27,199";
    college24.address = @"405 Hilgard Avenue Los Angeles, CA 90095";
    college24.acceptanceRate = @"25.5%";
    college24.phoneNumber = @"(310) 825-4321";
    college24.majorPrograms = @"Political Science and Government, Psychology, History, Economics, and Sociology";
    college24.website = @"www.ucla.edu";
    college24.isitIvyLeague = @"No";
    college24.mascot = @"Joe and Josephine Bruin";
    college24.color = @"UCLA Blue, Gold";
    college24.satScore = @"";
    college24.actScore = @"";
    college24.collegeNameCell = college24.name;
    college24.collegeRankCell = @"#24";
    college24.collegePhotoCell = @"File:Ucla_logo.png";
    
    College *college25 = [College new];
    college25.name = @"University of Southern California";
    college25.collegeName = college25.name;
    college25.rank = @"#25";
    college25.imageFile = @"college-photo_11609..jpg";
    college25.sizeofCollegeCampus = @"226 acres";
    college25.tuition = @"$44,463";
    college25.numberofStudents = @"17,414";
    college25.address = @"The University of Southern California, Los Angeles, CA 90089";
    college25.acceptanceRate = @"18%";
    college25.phoneNumber = @"(213) 740-2311";
    college25.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Visual and Performing Arts, Communication, Journalism, and Related Programs, and Engineering";
    college25.website = @"www.usc.edu";
    college25.isitIvyLeague = @"No";
    college25.mascot = @"USC Traveler";
    college25.color = @"Gold, Cardinal";
    college25.satScore = @"";
    college25.actScore = @"";
    college25.collegeNameCell = college25.name;
    college25.collegeRankCell = @"#25";
    college25.collegePhotoCell = @"USC_Shield.svg.png";
    
    College *college26 = [College new];
    college26.name = @"University of Virginia";
    college26.collegeName = college26.name;
    college26.rank = @"#26";
    college26.imageFile = @"photos.jpeg";
    college26.sizeofCollegeCampus = @"1,682 acres";
    college26.tuition = @"$38,418";
    college26.numberofStudents = @"15,762";
    college26.address = @"Charlottesville, VA 22904";
    college26.acceptanceRate = @"45%";
    college26.phoneNumber = @"(434) 924-0311";
    college26.majorPrograms = @"Economics, Business/Commerce, Psychology, History, and International Relations and Affairs";
    college26.website = @"www.virginia.edu";
    college26.isitIvyLeague = @"No";
    college26.mascot = @"Virginia Cavalier";
    college26.color = @"Orange, Navy Blue";
    college26.satScore = @"";
    college26.actScore = @"";
    college26.collegeNameCell = college26.name;
    college26.collegeRankCell = @"#26";
    college26.collegePhotoCell = @"UVA_Rotunda_Logo.svg.png";
    
    College *college27 = [College new];
    college27.name = @"Wake Forest University";
    college27.collegeName = college27.name;
    college27.rank = @"#27";
    college27.imageFile = @"wake_campus.jpeg";
    college27.sizeofCollegeCampus = @"340 acres";
    college27.tuition = @"$43,200";
    college27.numberofStudents = @"4,775";
    college27.address = @"1834 Wake Forest Rd, Winston-Salem, NC 27109";
    college27.acceptanceRate = @"40%";
    college27.phoneNumber = @"(336) 758-5430";
    college27.majorPrograms = @"Business/Commerce, Speech Communication and Rhetoric, Biology/Biological Sciences, Political Science and Government, and Psychology";
    college27.website = @"www.wfu.edu/";
    college27.isitIvyLeague = @"No";
    college27.mascot = @"Demon Deacon";
    college27.color = @"Old Gold, Black";
    college27.satScore = @"";
    college27.actScore = @"";
    college27.collegeNameCell = college27.name;
    college27.collegeRankCell = @"#27";
    college27.collegePhotoCell = @"wake_seal.png";
    
    
    College *college28 = [College new];
    college28.name = @"Tufts University";
    college28.collegeName = college28.name;
    college28.rank = @"#28";
    college28.imageFile = @"tuft_campus.jpeg";
    college28.sizeofCollegeCampus = @"150 acres";
    college28.tuition = @"$44,666";
    college28.numberofStudents = @"5,194";
    college28.address = @"419 Boston Ave, Medford, MA 02155";
    college28.acceptanceRate = @"21.9%";
    college28.phoneNumber = @"(617) 628-5000";
    college28.majorPrograms = @"International Relations and Affairs, Economics, Political Science and Government, English Language and Literature, and Psychology";
    college28.website = @"www.tufts.edu/";
    college28.isitIvyLeague = @"No";
    college28.mascot = @"Jumbo the Elephant";
    college28.color = @"Blue, Brown";
    college28.satScore = @"";
    college28.actScore = @"";
    college28.collegeNameCell = college28.name;
    college28.collegeRankCell = @"#28";
    college28.collegePhotoCell = @"tuft_seal.png";
    
    College *college29 = [College new];
    college29.name = @"University of Michigan-Ann Arbor";
    college29.collegeName = college29.name;
    college29.rank = @"#29";
    college29.imageFile = @"michigan_campus.jpeg";
    college29.sizeofCollegeCampus = @"3,701 acres";
    college29.tuition = @"$39,109";
    college29.numberofStudents = @"27,407";
    college29.address = @"503 S State St Ann Arbor, MI 48109";
    college29.acceptanceRate = @"51%";
    college29.phoneNumber = @"(734) 764-1817";
    college29.majorPrograms = @"Economics, Psychology, Political Science and Government, English Language and Literature, and Business Administration and Management";
    college29.website = @"www.umich.edu/";
    college29.isitIvyLeague = @"No";
    college29.mascot = @"Wolverine";
    college29.color = @"Maize, Blue";
    college29.satScore = @"";
    college29.actScore = @"";
    college29.collegeNameCell = college29.name;
    college29.collegeRankCell = @"#29";
    college29.collegePhotoCell = @"File:Umichigan_color_seal.png";
    
    College *college30 = [College new];
    college30.name = @"University of North Carolina--Chapel Hill";
    college30.collegeName = college30.name;
    college30.rank = @"#30";
    college30.imageFile = @"north_carolina_campus.jpeg";
    college30.sizeofCollegeCampus = @"729 acres";
    college30.tuition = @"$28,446";
    college30.numberofStudents = @"18,430";
    college30.address = @"South Building, CB #9100, Chapel Hill, NC 27599";
    college30.acceptanceRate = @"31.4%";
    college30.phoneNumber = @"(919) 962-2211";
    college30.majorPrograms = @"Communication and Media Studies, Biology, Psychology, Business Administration, Management and Operations, and Political Science and Government";
    college30.website = @"www.unc.edu/";
    college30.isitIvyLeague = @"No";
    college30.mascot = @"Rameses";
    college30.color = @"Carolina Blue, White";
    college30.satScore = @"";
    college30.actScore = @"";
    college30.collegeNameCell = college30.name;
    college30.collegeRankCell = @"#30";
    college30.collegePhotoCell = @"File:UNC_Chapel_Hill_seal.png";
    
    College *college31 = [College new];
    college31.name = @"Boston College";
    college31.collegeName = college31.name;
    college31.rank = @"#31";
    college31.imageFile = @"boston_campus.jpeg";
    college31.sizeofCollegeCampus = @"338 acres";
    college31.tuition = @"$43,878";
    college31.numberofStudents = @"9,088";
    college31.address = @"140 Commonwealth Ave, Chestnut Hill, MA 02467";
    college31.acceptanceRate = @"28%";
    college31.phoneNumber = @"(617) 552-8000";
    college31.majorPrograms = @"Finance, Economics, Speech Communication and Rhetoric, Biology/Biological Sciences, and English Language and Literature";
    college31.website = @"www.bc.edu/";
    college31.isitIvyLeague = @"No";
    college31.mascot = @"Baldwin the Eagle";
    college31.color = @"Maroon, Gold";
    college31.satScore = @"";
    college31.actScore = @"";
    college31.collegeNameCell = college31.name;
    college31.collegeRankCell = @"#31";
    college31.collegePhotoCell = @"boston_seal.png";
    
    College *college32 = [College new];
    college32.name = @"New York University";
    college32.collegeName = college32.name;
    college32.rank = @"#32";
    college32.imageFile = @"new_york_campus.jpeg";
    college32.sizeofCollegeCampus = @"N/A";
    college32.tuition = @"$41,606";
    college32.numberofStudents = @"22,280";
    college32.address = @"70 Washington Square S, New York, NY 10012";
    college32.acceptanceRate = @"32.7%";
    college32.phoneNumber = @"(212) 998-1212";
    college32.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Visual and Performing Arts, Social Sciences, Communication, Journalism, and Related Programs, Liberal Arts and Sciences, and Studies and Humanities";
    college32.website = @"www.nyu.edu/";
    college32.isitIvyLeague = @"No";
    college32.mascot = @"Bobcat";
    college32.color = @"White, Violet";
    college32.satScore = @"";
    college32.actScore = @"";
    college32.collegeNameCell = college32.name;
    college32.collegeRankCell = @"#32";
    college32.collegePhotoCell = @"new_york_seal.png";
    
    College *college33 = [College new];
    college33.name = @"Brandeis University";
    college33.collegeName = college33.name;
    college33.rank = @"#33";
    college33.imageFile = @"college-photo_2914..jpg";
    college33.sizeofCollegeCampus = @"235 acres";
    college33.tuition = @"$43,708";
    college33.numberofStudents = @"3,504";
    college33.address = @"415 South St, Waltham, MA 02453";
    college33.acceptanceRate = @"40%";
    college33.phoneNumber = @"(781) 736-2000";
    college33.majorPrograms = @"Economics, Biology/Biological Sciences, International/Global Studies, Political Science and Government, and Psychology";
    college33.website = @"www.brandeis.edu/";
    college33.isitIvyLeague = @"No";
    college33.mascot = @"Ollie the Owl";
    college33.color = @"White, Brandeis Blue";
    college33.satScore = @"";
    college33.actScore = @"";
    college33.collegeNameCell = college33.name;
    college33.collegeRankCell = @"#33";
    college33.collegePhotoCell = @"File:BrandeisUnivSeal.png";
    
    College *college34 = [College new];
    college34.name = @"College of William and Mary";
    college34.collegeName = college34.name;
    college34.rank = @"#34";
    college34.imageFile = @"william_mary_campus.jpeg";
    college34.sizeofCollegeCampus = @"1,200 acres";
    college34.tuition = @"$36,753";
    college34.numberofStudents = @"6,071";
    college34.address = @"327 Richmond Rd, Williamsburg, VA 23185";
    college34.acceptanceRate = @"34.6%";
    college34.phoneNumber = @"(757) 221-4000";
    college34.majorPrograms = @"Social Sciences, Business Administration and Management, Multi/Interdisciplinary Studies, English Language and Literature, and Psychology";
    college34.website = @"www.wm.edu/";
    college34.isitIvyLeague = @"No";
    college34.mascot = @"Griffin";
    college34.color = @"Gold, Green, Silver";
    college34.satScore = @"";
    college34.actScore = @"";
    college34.collegeNameCell = college34.name;
    college34.collegeRankCell = @"#34";
    college34.collegePhotoCell = @"File:College_of_William_%26_Mary_Seal.png";
    
    
    College *college35 = [College new];
    college35.name = @"University of Rochester";
    college35.collegeName = college35.name;
    college35.rank = @"#35";
    college35.imageFile = @"college-photo_2965._445x280-zmm.jpg";
    college35.sizeofCollegeCampus = @"707 acres";
    college35.tuition = @"$43,666";
    college35.numberofStudents = @"5,643";
    college35.address = @"Rochester, NY 14627";
    college35.acceptanceRate = @"36%";
    college35.phoneNumber = @"(585) 275-2121";
    college35.majorPrograms = @"Social Sciences, Biological and Biomedical Sciences, Health Professions and Related Programs, Visual and Performing Arts, and Psychology";
    college35.website = @"www.rochester.edu/";
    college35.isitIvyLeague = @"No";
    college35.mascot = @"Rocky the Yellowjacket";
    college35.color = @"Yellow, Blue";
    college35.satScore = @"";
    college35.actScore = @"";
    college35.collegeNameCell = college35.name;
    college35.collegeRankCell = @"#35";
    college35.collegePhotoCell = @"University_of_Rochester_logo.svg.png";
    
    
    College *college36 = [College new];
    college36.name = @"Georgia Institute of Technology";
    college36.collegeName = college36.name;
    college36.rank = @"#36";
    college36.imageFile = @"georgia_campus.jpeg";
    college36.sizeofCollegeCampus = @"400 acres";
    college36.tuition = @"$29,402";
    college36.numberofStudents = @"13,948";
    college36.address = @"225 North Ave NW, Atlanta, GA 30332";
    college36.acceptanceRate = @"51.2%";
    college36.phoneNumber = @"(404) 894-2000";
    college36.majorPrograms = @"Engineering , Business, Management, Marketing, and Related Support Services, Computer and Information Sciences and Support Services, Biological and Biomedical Sciences, and Architecture and Related Services";
    college36.website = @"www.gatech.edu/";
    college36.isitIvyLeague = @"No";
    college36.mascot = @"Buzz";
    college36.color = @"Gold, White, Old Gold";
    college36.satScore = @"";
    college36.actScore = @"";
    college36.collegeNameCell = college36.name;
    college36.collegeRankCell = @"#36";
    college36.collegePhotoCell = @"georgia_logo.png";
    
    
    College *college37 = [College new];
    college37.name = @"Case Western Reserve University";
    college37.collegeName = college37.name;
    college37.rank = @"#37";
    college37.imageFile = @"college-photo_206.JPG";
    college37.sizeofCollegeCampus = @"155 acres";
    college37.tuition = @"$40,490";
    college37.numberofStudents = @"4,016";
    college37.address = @"10900 Euclid Ave, Cleveland, OH 44106";
    college37.acceptanceRate = @"51%";
    college37.phoneNumber = @"(216) 368-2000";
    college37.majorPrograms = @"Bioengineering and Biomedical Engineering, Biology/Biological Sciences, Registered Nursing/Registered Nurse, Mechanical Engineering, and Psychology";
    college37.website = @"www.case.edu/";
    college37.isitIvyLeague = @"No";
    college37.mascot = @"Spartan";
    college37.color = @"Grey, White, Blue";
    college37.satScore = @"";
    college37.actScore = @"";
    college37.collegeNameCell = college37.name;
    college37.collegeRankCell = @"#37";
    college37.collegePhotoCell = @"case_western_reserve_logo.png";
    
    College *college38 = [College new];
    college38.name = @"Lehigh University";
    college38.collegeName = college38.name;
    college38.rank = @"#38";
    college38.imageFile = @"lehigh_campus.jpeg";
    college38.sizeofCollegeCampus = @"1,600 acres";
    college38.tuition = @"$42,220";
    college38.numberofStudents = @"4,869";
    college38.address = @"27 Memorial Dr W, Bethlehem, PA 18015";
    college38.acceptanceRate = @"33%";
    college38.phoneNumber = @"(610) 758-3000";
    college38.majorPrograms = @"Finance, Accounting,  Marketing/Marketing Management,  Mechanical Engineering, and Psychology";
    college38.website = @"www.lehigh.edu/";
    college38.isitIvyLeague = @"No";
    college38.mascot = @"Mountain Hawk";
    college38.color = @"Brown, White";
    college38.satScore = @"";
    college38.actScore = @"";
    college38.collegeNameCell = college38.name;
    college38.collegeRankCell = @"#38";
    college38.collegePhotoCell = @"lehigh_logo.png";
    
    College *college39 = [College new];
    college39.name = @"University of California--Davis";
    college39.collegeName = college39.name;
    college39.rank = @"#39";
    college39.imageFile = @"davis_campus.jpeg";
    college39.sizeofCollegeCampus = @"5,300 acres";
    college39.tuition = @"$36,755";
    college39.numberofStudents = @"25,096";
    college39.address = @"1 Shields Ave, Davis, CA 95616";
    college39.acceptanceRate = @"46%";
    college39.phoneNumber = @"(530) 752-1011";
    college39.majorPrograms = @"Biology, Philosophy and Religious Studies, Psychology, Economics, Agriculture, and Engineering";
    college39.website = @"www.ucdavis.edu/";
    college39.isitIvyLeague = @"No";
    college39.mascot = @"Gunrock";
    college39.color = @"Gold, Blue";
    college39.satScore = @"";
    college39.actScore = @"";
    college39.collegeNameCell = college39.name;
    college39.collegeRankCell = @"#39";
    college39.collegePhotoCell = @"davis_logo.png";
    
    College *college40 = [College new];
    college40.name = @"University of California--Davis";
    college40.collegeName = college40.name;
    college40.rank = @"#40";
    college40.imageFile = @"san_diego_campus.jpeg";
    college40.sizeofCollegeCampus = @"1,976 acres";
    college40.tuition = @"$35,006";
    college40.numberofStudents = @"23,046";
    college40.address = @"9500 Gilman Dr, San Diego, CA 92093";
    college40.acceptanceRate = @"35.5%";
    college40.phoneNumber = @"(858) 534-2230";
    college40.majorPrograms = @"Biology, Economics, Political Science and Government, Psychology, and Communication and Media Studies";
    college40.website = @"www.ucsd.edu/";
    college40.isitIvyLeague = @"No";
    college40.mascot = @"Tritons";
    college40.color = @"Navy Blue, Gold";
    college40.satScore = @"";
    college40.actScore = @"";
    college40.collegeNameCell = college40.name;
    college40.collegeRankCell = college40.rank;
    college40.collegePhotoCell = @"san_diego_logo.png";
    
    College *college41 = [College new];
    college41.name = @"Rensselaer Polytechnic Institute";
    college41.collegeName = college41.name;
    college41.rank = @"#41";
    college41.imageFile = @"rensselaer_campus.jpeg";
    college41.sizeofCollegeCampus = @"284 acres";
    college41.tuition = @"$44,475";
    college41.numberofStudents = @"5,322";
    college41.address = @"110 8th St, Troy, NY 12180";
    college41.acceptanceRate = @"40%";
    college41.phoneNumber = @"(518) 276-6000";
    college41.majorPrograms = @"Engineering, Computer and Information Sciences and Support Services, Business, Management, Marketing, and Related Support Services, Architecture and Related Services, and Biological and Biomedical Sciences";
    college41.website = @"www.rpi.edu/";
    college41.isitIvyLeague = @"No";
    college41.mascot = @"The Red Hawk and Puckman";
    college41.color = @"White, Cherry Red";
    college41.satScore = @"";
    college41.actScore = @"";
    college41.collegeNameCell = college41.name;
    college41.collegeRankCell = college41.rank;
    college41.collegePhotoCell = @"rensselaer_logo.png";
    
    College *college42 = [College new];
    college42.name = @"University of California- Santa Barbara";
    college42.collegeName = college42.name;
    college42.rank = @"#42";
    college42.imageFile = @"rensselaer_campus.jpeg";
    college42.sizeofCollegeCampus = @"989 acres";
    college42.tuition = @"$36,549";
    college42.numberofStudents = @"18,620";
    college42.address = @"552 University Rd, Santa Barbara, CA 93106";
    college42.acceptanceRate = @"45%";
    college42.phoneNumber = @"(805) 893-8000";
    college42.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Psychology, Biology/Biological Sciences, Sociology, and Communication and Media Studies";
    college42.website = @"www.ucsb.edu/";
    college42.isitIvyLeague = @"No";
    college42.mascot = @"The Gaucho";
    college42.color = @"Azure";
    college42.satScore = @"";
    college42.actScore = @"";
    college42.collegeNameCell = college42.name;
    college42.collegeRankCell = college42.rank;
    college42.collegePhotoCell = @"Ucsb_seal.svg.png";
    
    College *college43 = [College new];
    college43.name = @"University of Wisconsin--Madison";
    college43.collegeName = college43.name;
    college43.rank = @"#43";
    college43.imageFile = @"rensselaer_campus.jpeg";
    college43.sizeofCollegeCampus = @"936 acres";
    college43.tuition = @"$26,634";
    college43.numberofStudents = @"30,367";
    college43.address = @"500 Lincoln Dr, Madison, WI 53706";
    college43.acceptanceRate = @"50.5%";
    college43.phoneNumber = @"(608) 262-1234";
    college43.majorPrograms = @"Biology/Biological Sciences, Economics, Political Science and Government, History, and Psychology";
    college43.website = @"www.wisc.edu/";
    college43.isitIvyLeague = @"No";
    college43.mascot = @"Bucky Badger";
    college43.color = @"Cardinal, White";
    college43.satScore = @"";
    college43.actScore = @"";
    college43.collegeNameCell = college43.name;
    college43.collegeRankCell = college43.rank;
    college43.collegePhotoCell = @"madison_logo.png";
    
    College *college44 = [College new];
    college44.name = @"University of California- Irvine";
    college44.collegeName = college44.name;
    college44.rank = @"#44";
    college44.imageFile = @"rensselaer_campus.jpeg";
    college44.sizeofCollegeCampus = @"1,474 acres";
    college44.tuition = @"$36,968";
    college44.numberofStudents = @"22,004";
    college44.address = @"510 Aldrich hall #5, Irvine, CA 92617";
    college44.acceptanceRate = @"45%";
    college44.phoneNumber = @"(949) 824-5011";
    college44.majorPrograms = @"Biology/Biological Sciences, Business/Managerial Economics, Political Science and Government, Social Psychology, and  Economics";
    college44.website = @"www.uci.edu/";
    college44.isitIvyLeague = @"No";
    college44.mascot = @"Peter the Anteater";
    college44.color = @"Blue, Gold";
    college44.satScore = @"";
    college44.actScore = @"";
    college44.collegeNameCell = college44.name;
    college44.collegeRankCell = college44.rank;
    college44.collegePhotoCell = @"File:UC_Irvine_Seal.png";
    
    College *college45 = [College new];
    college45.name = @"University of Miami";
    college45.collegeName = college45.name;
    college45.rank = @"#45";
    college45.imageFile = @"rensselaer_campus.jpeg";
    college45.sizeofCollegeCampus = @"239 acres";
    college45.tuition = @"$39,654";
    college45.numberofStudents = @"10509";
    college45.address = @"1320 S Dixie Hwy, Coral Gables, FL 33124";
    college45.acceptanceRate = @"38.3%";
    college45.phoneNumber = @"(305) 284-2211";
    college45.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Biological and Biomedical Sciences, Communication, Journalism, and Related Programs, Social Sciences, and Visual and Performing Arts";
    college45.website = @"www.miami.edu/";
    college45.isitIvyLeague = @"No";
    college45.mascot = @"Sebastian the Ibis";
    college45.color = @"White, Green, Orange";
    college45.satScore = @"";
    college45.actScore = @"";
    college45.collegeNameCell = college45.name;
    college45.collegeRankCell = college45.rank;
    college45.collegePhotoCell = @"miami_logo.png";
    
    College *college46 = [College new];
    college46.name = @"Pennsylvania State University";
    college46.collegeName = college46.name;
    college46.rank = @"#46";
    college46.imageFile = @"rensselaer_campus.jpeg";
    college46.sizeofCollegeCampus = @"8,556 acres";
    college46.tuition = @"$28,746";
    college46.numberofStudents = @"38,954";
    college46.address = @"301 Outreach Bldg, University Park, PA 16802";
    college46.acceptanceRate = @"54.8%";
    college46.phoneNumber = @"(814) 865-4700";
    college46.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Engineering, and Communication, Journalism, and Related Programs";
    college46.website = @"www.psu.edu/";
    college46.isitIvyLeague = @"No";
    college46.mascot = @"Nittany Lion";
    college46.color = @"White, Dark Blue";
    college46.satScore = @"";
    college46.actScore = @"";
    college46.collegeNameCell = college46.name;
    college46.collegeRankCell = college46.rank;
    college46.collegePhotoCell = @"Pennsylvania_State_University_seal.svg.png";
    
    College *college47 = [College new];
    college47.name = @"University of Illinois--Urbana-Champaign";
    college47.collegeName = college47.name;
    college47.rank = @"#47";
    college47.imageFile = @"rensselaer_campus.jpeg";
    college47.sizeofCollegeCampus = @"1,783 acres";
    college47.tuition = @"$28,570";
    college47.numberofStudents = @"32,256";
    college47.address = @"901 West Illinois Street, Urbana, IL 61801";
    college47.acceptanceRate = @"68%";
    college47.phoneNumber = @"(217) 333-0302";
    college47.majorPrograms = @"Engineering, Business, Management, Marketing, and Related Support Services, Social Sciences, Communication, Journalism, and Related Programs, and Psychology";
    college47.website = @"www.illinois.edu/";
    college47.isitIvyLeague = @"No";
    college47.mascot = @"Chief Illiniwek";
    college47.color = @"Blue, Orange, Navy Blue";
    college47.satScore = @"";
    college47.actScore = @"";
    college47.collegeNameCell = college47.name;
    college47.collegeRankCell = college47.rank;
    college47.collegePhotoCell = @"urbana_logo.png";
    
    College *college48 = [College new];
    college48.name = @"University of Texas (Austin)";
    college48.collegeName = college48.name;
    college48.rank = @"#48";
    college48.imageFile = @"rensselaer_campus.jpeg";
    college48.sizeofCollegeCampus = @"431 acres";
    college48.tuition = @"$33,060";
    college48.numberofStudents = @"38437";
    college48.address = @"1 University Station, Austin, TX 78712";
    college48.acceptanceRate = @"46.6%";
    college48.phoneNumber = @"(512) 475-7348";
    college48.majorPrograms = @"Communication, Journalism, and Related Programs, Social Sciences, Business, Management, Marketing, and Related Support Services, Engineering, and Biological and Biomedical Sciences";
    college48.website = @"www.utexas.edu/";
    college48.isitIvyLeague = @"No";
    college48.mascot = @"Hook 'em, Bevo";
    college48.color = @"White, Burnt Orange";
    college48.satScore = @"";
    college48.actScore = @"";
    college48.collegeNameCell = college48.name;
    college48.collegeRankCell = college48.rank;
    college48.collegePhotoCell = @"File:Large_university-of-texas_seal_rgb(199-91-18).png";
    
    College *college49 = [College new];
    college49.name = @"University of Washington";
    college49.collegeName = college49.name;
    college49.rank = @"#49";
    college49.imageFile = @"rensselaer_campus.jpeg";
    college49.sizeofCollegeCampus = @"703 acres";
    college49.tuition = @"$28,058";
    college49.numberofStudents = @"29,017";
    college49.address = @"4311 11th Ave NE, Seattle, WA 98105";
    college49.acceptanceRate = @"58%";
    college49.phoneNumber = @"(206) 897-8939";
    college49.majorPrograms = @"Social Sciences, Business, Management, Marketing, and Related Support Services, Biological and Biomedical Sciences, Visual and Performing Arts, and Engineering";
    college49.website = @"www.washington.edu/";
    college49.isitIvyLeague = @"No";
    college49.mascot = @"Harry the Husky";
    college49.color = @"Gold, Purple";
    college49.satScore = @"";
    college49.actScore = @"";
    college49.collegeNameCell = college49.name;
    college49.collegeRankCell = college49.rank;
    college49.collegePhotoCell = @"File:University_of_Washington_Seal.png";
    
    
    College *college50 = [College new];
    college50.name = @"Yeshiva University";
    college50.collegeName = college50.name;
    college50.rank = @"#50";
    college50.imageFile = @"rensselaer_campus.jpeg";
    college50.sizeofCollegeCampus = @"12 acres";
    college50.tuition = @"$36,500";
    college50.numberofStudents = @"2,786";
    college50.address = @"500 W 185th St, New York, NY 10033";
    college50.acceptanceRate = @"69%";
    college50.phoneNumber = @"(212) 960-5400";
    college50.majorPrograms = @"Psychology, Biology/Biological Sciences, Accounting, Finance, Hebrew Language and Literature";
    college50.website = @"www.yu.edu/";
    college50.isitIvyLeague = @"No";
    college50.mascot = @"the Maccabee";
    college50.color = @"Black, Blue, Grey";
    college50.satScore = @"";
    college50.actScore = @"";
    college50.collegeNameCell = college50.name;
    college50.collegeRankCell = college50.rank;
    college50.collegePhotoCell = @"yeshiva_logo.jpeg";
    
    College *college51 = [College new];
    college51.name = @"Boston University";
    college51.collegeName = college51.name;
    college51.rank = @"#51";
    college51.imageFile = @"boston_campus.jpeg";
    college51.sizeofCollegeCampus = @"133 acres";
    college51.tuition = @"$42,994";
    college51.numberofStudents = @"18,140";
    college51.address = @"1 Silber Way, Boston, MA 02215";
    college51.acceptanceRate = @"45.5%";
    college51.phoneNumber = @"(617) 353-2000";
    college51.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Communication, Journalism, and Related Programs, Engineering, and Health Professions and Related Programs";
    college51.website = @"www.bu.edu/";
    college51.isitIvyLeague = @"No";
    college51.mascot = @"Rhett the Boston Terrier";
    college51.color = @"White, Scarlet";
    college51.satScore = @"";
    college51.actScore = @"";
    college51.collegeNameCell = college51.name;
    college51.collegeRankCell = college51.rank;
    college51.collegePhotoCell = @"Boston_University_seal.svg.png";
    
    College *college52 = [College new];
    college52.name = @"Tulane University";
    college52.collegeName = college52.name;
    college52.rank = @"#52";
    college52.imageFile = @"tulane_campus.jpeg";
    college52.sizeofCollegeCampus = @"110 acres";
    college52.tuition = @"$45,240";
    college52.numberofStudents = @"8,330";
    college52.address = @"6823 St Charles Ave, New Orleans, LA 70118";
    college52.acceptanceRate = @"24.9%";
    college52.phoneNumber = @"(504) 865-5000";
    college52.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Biological and Biomedical Sciences, Psychology, and English Language and Literature/Letters";
    college52.website = @"www.tulane.edu";
    college52.isitIvyLeague = @"No";
    college52.mascot = @"Riptide the Pelican";
    college52.color = @"Sky Blue, Olive";
    college52.satScore = @"";
    college52.actScore = @"";
    college52.collegeNameCell = college52.name;
    college52.collegeRankCell = college52.rank;
    college52.collegePhotoCell = @"TulaneSealColor.png";
    
    College *college53 = [College new];
    college53.name = @"Pepperdine University";
    college53.collegeName = college53.name;
    college53.rank = @"#53";
    college53.imageFile = @"pepperdine.jpeg";
    college53.sizeofCollegeCampus = @"830 acres";
    college53.tuition = @"$42,772";
    college53.numberofStudents = @"3,474";
    college53.address = @"24255 Pacific Coast Highway, Malibu, California, 90263";
    college53.acceptanceRate = @"32%";
    college53.phoneNumber = @"(310) 506-4000";
    college53.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Communication, Journalism, and Related Programs, Social Sciences, Multi/Interdisciplinary Studies, and Psychology";
    college53.website = @"www.pepperdine.edu";
    college53.isitIvyLeague = @"No";
    college53.mascot = @"Willie the Wave";
    college53.color = @"Blue, Orange";
    college53.satScore = @"";
    college53.actScore = @"";
    college53.collegeNameCell = college53.name;
    college53.collegeRankCell = college53.rank;
    college53.collegePhotoCell = @"File:Pepperdine_Official_Seal.jpg";
    
    College *college54 = [College new];
    college54.name = @"University of Florida";
    college54.collegeName = college54.name;
    college54.rank = @"#54";
    college54.imageFile = @"florida_campus.jpeg";
    college54.sizeofCollegeCampus = @"2,000 acres";
    college54.tuition = @"$34,548";
    college54.numberofStudents = @"49,589";
    college54.address = @"925 NW 56th Terrace, Gainesville, FL 32605";
    college54.acceptanceRate = @"39%";
    college54.phoneNumber = @"(352) 392-3261";
    college54.majorPrograms = @"Social Sciences, Business, Management, Marketing, and Related Support Services, Engineering, Health Professions and Related Programs, and Biological and Biomedical Sciences";
    college54.website = @"www.ufl.edu";
    college54.isitIvyLeague = @"No";
    college54.mascot = @"Albert and Alberta";
    college54.color = @"Blue, Orange";
    college54.satScore = @"";
    college54.actScore = @"";
    college54.collegeNameCell = college54.name;
    college54.collegeRankCell = college54.rank;
    college54.collegePhotoCell = @"File:University_of_Florida_seal.png";
    
    College *college55 = [College new];
    college55.name = @"Northeastern University";
    college55.collegeName = college55.name;
    college55.rank = @"#55";
    college55.imageFile = @"northeastern_campus.jpeg";
    college55.sizeofCollegeCampus = @"2,000 acres";
    college55.tuition = @"$34,548";
    college55.numberofStudents = @"49,589";
    college55.address = @"925 NW 56th Terrace, Gainesville, FL 32605";
    college55.acceptanceRate = @"35%";
    college55.phoneNumber = @"(617) 373-2000";
    college55.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Engineering, Health Professions and Related Programs, Social Sciences, and Communication, Journalism, and Related Programs";
    college55.website = @"www.northeastern.edu";
    college55.isitIvyLeague = @"No";
    college55.mascot = @"Paws";
    college55.color = @"Black, Red, Grey";
    college55.satScore = @"";
    college55.actScore = @"";
    college55.collegeNameCell = college55.name;
    college55.collegeRankCell = college55.rank;
    college55.collegePhotoCell = @"Northeastern-seal.svg.png";
    
    College *college56 = [College new];
    college56.name = @"Ohio State University--Columbus";
    college56.collegeName = college56.name;
    college56.rank = @"#56";
    college56.imageFile = @"ohioucolumbuscampus.jpeg";
    college56.sizeofCollegeCampus = @"3,469 acres";
    college56.tuition = @"$25,445";
    college56.numberofStudents = @"56,867";
    college56.address = @"1739 N High St, Columbus, OH 43210";
    college56.acceptanceRate = @"63.4%";
    college56.phoneNumber = @"(614) 292-6446";
    college56.majorPrograms = @"Psychology, Speech Communication and Rhetoric, Biology/Biological Sciences, English Language and Literature, and Finance";
    college56.website = @"www.osu.edu";
    college56.isitIvyLeague = @"No";
    college56.mascot = @"Brutus Buckeye";
    college56.color = @"Grey, Scarlet";
    college56.satScore = @"";
    college56.actScore = @"";
    college56.collegeNameCell = college56.name;
    college56.collegeRankCell = college56.rank;
    college56.collegePhotoCell = @"ohioucolumbusseal.png";
    
    College *college57 = [College new];
    college57.name = @"Fordham University";
    college57.collegeName = college57.name;
    college57.rank = @"#57";
    college57.imageFile = @"fordhamcampus.jpeg";
    college57.sizeofCollegeCampus = @"93 acres";
    college57.tuition = @"$41,732";
    college57.numberofStudents = @"15,189";
    college57.address = @"155 W 60th St, New York, NY 10023";
    college57.acceptanceRate = @"42.2%";
    college57.phoneNumber = @"(718) 817-1000";
    college57.majorPrograms = @"Business Administration and Management, Speech Communication and Rhetoric, Psychology, English Language and Literature, and Political Science and Government";
    college57.website = @"www.fordham.edu";
    college57.isitIvyLeague = @"No";
    college57.mascot = @"Ram";
    college57.color = @"Maroon, White, Blue";
    college57.satScore = @"";
    college57.actScore = @"";
    college57.collegeNameCell = college57.name;
    college57.collegeRankCell = college57.rank;
    college57.collegePhotoCell = @"fordhamseal.jpeg";
    
    College *college58 = [College new];
    college58.name = @"Southern Methodist University";
    college58.collegeName = college58.name;
    college58.rank = @"#58";
    college58.imageFile = @"smu campus.jpeg";
    college58.sizeofCollegeCampus = @"231 acres";
    college58.tuition = @"$41,750";
    college58.numberofStudents = @"6,221";
    college58.address = @"6425 Boaz Ln, Dallas, TX 75205";
    college58.acceptanceRate = @"55%";
    college58.phoneNumber = @"(214) 768-2000";
    college58.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Communication, Journalism, and Related Programs, Visual and Performing Arts, and Psychology";
    college58.website = @"www.smu.edu";
    college58.isitIvyLeague = @"No";
    college58.mascot = @"Peruna";
    college58.color = @"Blue, Red";
    college58.satScore = @"";
    college58.actScore = @"";
    college58.collegeNameCell = college58.name;
    college58.collegeRankCell = college58.rank;
    college58.collegePhotoCell = @"smu seal.gif";
    
    College *college59 = [College new]; college59.name = @"Syracuse University"; college59.collegeName = college59.name; college59.rank = @"#59"; college59.imageFile = @"syracuse_campus.jpeg"; college59.sizeofCollegeCampus = @"200 acres"; college59.tuition = @"39,004"; college59.numberofStudents = @"14,671"; college59.address = @"323 S Crouse Ave, Syracuse, NY 13244"; college59.acceptanceRate = @"49.4%"; college59.phoneNumber = @"(315) 443-1763"; college59.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Communication, Journalism, and Related Programs, Social Sciences, Visual and Performing Arts, and Engineering"; college59.website = @"www.syr.edu"; college59.isitIvyLeague = @"No"; college59.mascot = @"Otto the Orange"; college59.color = @"Orange, Syracuse, 'Cuse,"; college59.collegeNameCell = college59.name; college59.collegeRankCell = college59.rank; college59.collegePhotoCell = @"Syracuse_University_Seal.svg.png";
   
   College *college60 = [College new]; college60.name = @"University of Maryland--College Park"; college60.collegeName = college60.name; college60.rank = @"#60"; college60.imageFile = @"u of maryland college park campus.jpeg"; college60.sizeofCollegeCampus = @"1,250 acres"; college60.tuition = @"27,287"; college60.numberofStudents = @"26,775"; college60.address = @"7965 Baltimore Ave, College Park, MD 20742 "; college60.acceptanceRate = @"44.7%"; college60.phoneNumber = @"(301) 405-1000 "; college60.majorPrograms = @"Criminology, Accounting, Economics, Psychology, and Speech Communication and Rhetoric"; college60.website = @"www.umuc.edu"; college60.isitIvyLeague = @"No"; college60.mascot = @"Testudo"; college60.color = @"Gold, Red, White, Black"; college60.collegeNameCell = college60.name; college60.collegeRankCell = college60.rank; college60.collegePhotoCell = @"u of maryland college park seal.png";
   
    College *college61 = [College new]; college61.name = @"University of Pittsburgh "; college61.collegeName = college61.name; college61.rank = @"#61"; college61.imageFile = @"pittsbrgh_campus.jpeg"; college61.sizeofCollegeCampus = @"132 acres."; college61.tuition = @"26,280"; college61.numberofStudents = @"18,427"; college61.address = @"4200 Fifth Ave, Pittsburgh, PA 15213"; college61.acceptanceRate = @"58%"; college61.phoneNumber = @"(412) 624-4141"; college61.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Health Professions and Related Programs, English Language and Literature/Letters, and Engineering"; college61.website = @"www.pitt.edu"; college61.isitIvyLeague = @"No"; college61.mascot = @"Roc the Panther"; college61.color = @"Gold, Blue"; college61.collegeNameCell = college61.name; college61.collegeRankCell = college61.rank; college61.collegePhotoCell = @"pittsburgh_logo.png";
  
    College *college62 = [College new]; college62.name = @"University of Connecticut"; college62.collegeName = college62.name; college62.rank = @"#62"; college62.imageFile = @"connecticut_campus.jpeg"; college62.sizeofCollegeCampus = @"4,313 acres"; college62.tuition = @"25,868"; college62.numberofStudents = @"17,815"; college62.address = @"115 N Eagleville Rd, Storrs-Mansfield, CT 06269"; college62.acceptanceRate = @"47.3%"; college62.phoneNumber = @"(860) 486-2000"; college62.majorPrograms = @"Social Sciences, Business, Management, Marketing, and Related Support Services, Science Technologies/Technicians, Engineering, and Psychology"; college62.website = @"www.uconn.edu"; college62.isitIvyLeague = @"No"; college62.mascot = @"Jonathan the Husky"; college62.color = @"White, Blue"; college62.collegeNameCell = college62.name; college62.collegeRankCell = college62.rank; college62.collegePhotoCell = @"connecticut_logo.png";
    
    College *college63 = [College new]; college63.name = @"University of Georgia"; college63.collegeName = college63.name; college63.rank = @"#63"; college63.imageFile = @"u of georgia campus.jpeg"; college63.sizeofCollegeCampus = @"759 acres"; college63.tuition = @"28,052"; college63.numberofStudents = @"26,373"; college63.address = @"210 S Jackson St, Athens, GA 30602"; college63.acceptanceRate = @"63%"; college63.phoneNumber = @"(706) 542-2112 "; college63.majorPrograms = @"Psychology, Finance, Marketing/Marketing Management, Biology/Biological Sciences, and Business Administration and Management"; college63.website = @"www.uga.edu"; college63.isitIvyLeague = @"No"; college63.mascot = @"Hairy Dawg, Uga"; college63.color = @"Red, Black"; college63.collegeNameCell = college63.name; college63.collegeRankCell = college63.rank; college63.collegePhotoCell = @"u of georgia seal.png";
    
    College *college64 = [College new]; college64.name = @"Purdue University--West Lafayette "; college64.collegeName = college64.name; college64.rank = @"#64"; college64.imageFile = @"purdue_campus.jpeg"; college64.sizeofCollegeCampus = @"2,468 acres"; college64.tuition = @"28,702"; college64.numberofStudents = @"30,836"; college64.address = @"101 N Grant St #110, West Lafayette, IN 47907"; college64.acceptanceRate = @"68.3%"; college64.phoneNumber = @"(765) 494-4600 "; college64.majorPrograms = @"Engineering, Liberal Arts and Sciences, General Studies and Humanities, Business, Management, Marketing, and Related Support Services, Agriculture, Agriculture Operations, and Related Sciences, and Family and Consumer Sciences/Human Sciences"; college64.website = @"www.purdue.edu"; college64.isitIvyLeague = @"No"; college64.mascot = @"Boilermaker Special"; college64.color = @"Old gold, Black"; college64.collegeNameCell = college64.name; college64.collegeRankCell = college64.rank; college64.collegePhotoCell = @"purdue_logo.png";
    
    College *college65 = [College new]; college65.name = @"Texas A&M University--College Station "; college65.collegeName = college65.name; college65.rank = @"#65"; college65.imageFile = @"texas_campus.jpeg"; college65.sizeofCollegeCampus = @"5,200 acres"; college65.tuition = @"25,035"; college65.numberofStudents = @"39,637"; college65.address = @"College Station, TX 77843"; college65.acceptanceRate = @"63.5%"; college65.phoneNumber = @"(979) 845-3211"; college65.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Engineering, Agriculture, Agriculture Operations, and Related Sciences, Multi/Interdisciplinary Studies, and Biological and Biomedical Sciences"; college65.website = @"www.tamu.edu"; college65.isitIvyLeague = @"No"; college65.mascot = @"Reveille"; college65.color = @"Maroon, White"; college65.collegeNameCell = college65.name; college65.collegeRankCell = college65.rank; college65.collegePhotoCell = @"File:Texas_A%26M_University_Seal.png";
    
    College *college66 = [College new]; college66.name = @"Worcester Polytechnic Institute"; college66.collegeName = college66.name; college66.rank = @"#66"; college66.imageFile = @"WPI_campus.jpeg"; college66.sizeofCollegeCampus = @"80 acres"; college66.tuition = @"41,380"; college66.numberofStudents = @"3,849"; college66.address = @"100 Institute Rd, Worcester, MA 01609"; college66.acceptanceRate = @"56.7%"; college66.phoneNumber = @"(508) 831-5000"; college66.majorPrograms = @"Mechanical Engineering, Electrical and Electronics Engineering, Computer Science, Bioengineering and Biomedical Engineering, and Civil Engineering"; college66.website = @"www.wpi.edu"; college66.isitIvyLeague = @"No"; college66.mascot = @"Gompei the Goat"; college66.color = @"Crimson, Gray"; college66.collegeNameCell = college66.name; college66.collegeRankCell = college66.rank; college66.collegePhotoCell = @"File:WPI_logo.png";
    
    College *college67 = [College new]; college67.name = @"Brigham Young University--Provo "; college67.collegeName = college67.name; college67.rank = @"#67"; college67.imageFile = @"brigham_campus.jpeg"; college67.sizeofCollegeCampus = @"557 acres"; college67.tuition = @"4,710"; college67.numberofStudents = @"30,684"; college67.address = @"1 N University Ave, Provo, UT 84606"; college67.acceptanceRate = @"63%"; college67.phoneNumber = @"(801) 422-1211"; college67.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Biological and Biomedical Sciences, Social Sciences, Education, and Visual and Performing Arts"; college67.website = @"www.byu.edu"; college67.isitIvyLeague = @"No"; college67.mascot = @" Cosmo the Cougar"; college67.color = @"BYU Blue, BYU Tan"; college67.collegeNameCell = college67.name; college67.collegeRankCell = college67.rank; college67.collegePhotoCell = @"brigham_logo.png";
    
    College *college68 = [College new]; college68.name = @"Clemson University"; college68.collegeName = college68.name; college68.rank = @"#68"; college68.imageFile = @"clemson_campus.jpeg"; college68.sizeofCollegeCampus = @"17,000 acres"; college68.tuition = @"29,600"; college68.numberofStudents = @"15,836"; college68.address = @"101 Sikes Ave, Clemson, SC 29634"; college68.acceptanceRate = @"63.3%"; college68.phoneNumber = @" (864) 656-3311"; college68.majorPrograms = @"Physical Sciences, Business, Management, Marketing, and Related Support Services, Engineering, Health Professions and Related Programs, and Social Sciences"; college68.website = @"www.clemson.edu"; college68.isitIvyLeague = @"No"; college68.mascot = @"Clemson Tiger and Cub"; college68.color = @"Purple, Orange"; college68.collegeNameCell = college68.name; college68.collegeRankCell = college68.rank; college68.collegePhotoCell = @"clemson_logo.png";
    
    College *college69 = [College new]; college69.name = @"Rutgers, the State University of New Jersey--New Brunswick"; college69.collegeName = college69.name; college69.rank = @"#69"; college69.imageFile = @"new_brunswick_campus.jpeg"; college69.sizeofCollegeCampus = @"1,990 acres"; college69.tuition = @"26,393"; college69.numberofStudents = @"39,950"; college69.address = @"249 University Ave, Newark, NJ 07102"; college69.acceptanceRate = @"61.1%"; college69.phoneNumber = @"(732) 932-1766"; college69.majorPrograms = @"Psychology, Speech Communication and Rhetoric, Economics, Biology/Biological Sciences, and Political Science and Government"; college69.website = @"www.nb.rutgers.edu"; college69.isitIvyLeague = @"No"; college69.mascot = @"Scarlet Knights"; college69.color = @"Scarlet"; college69.collegeNameCell = college69.name; college69.collegeRankCell = college69.rank; college69.collegePhotoCell = @"File:Rutgers,_The_State_University_of_New_Jersey_logo";
    
    College *college70 = [College new]; college70.name = @"University of Minnesota"; college70.collegeName = college70.name; college70.rank = @"#70"; college70.imageFile = @"minnesota_campus.jpeg"; college70.sizeofCollegeCampus = @"1,204 acres"; college70.tuition = @"18,022"; college70.numberofStudents = @"34,812"; college70.address = @"100 Church St SE, Minneapolis, MN 55455"; college70.acceptanceRate = @"46.1%"; college70.phoneNumber = @"(612) 625-5000"; college70.majorPrograms = @"Social Sciences, Engineering, Biological and Biomedical Sciences, Business, Management, Marketing, and Related Support Services, and Psychology"; college70.website = @"www.umn.edu"; college70.isitIvyLeague = @"No"; college70.mascot = @"Goldy Gopher"; college70.color = @"Gold, Maroon"; college70.collegeNameCell = college70.name; college70.collegeRankCell = college70.rank; college70.collegePhotoCell = @"Umnseal.png";
    
    College *college71 = [College new]; college71.name = @"Michigan State University "; college71.collegeName = college71.name; college71.rank = @"#71"; college71.imageFile = @"michigan_campus.jpeg"; college71.sizeofCollegeCampus = @"5,192 acres"; college71.tuition = @"31,148"; college71.numberofStudents = @"46,648"; college71.address = @"101 Marshall Adams Hall, East Lansing, MI 48824"; college71.acceptanceRate = @"72.9%"; college71.phoneNumber = @"(517) 355-1855"; college71.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Communication, Journalism, and Related Programs, Biological and Biomedical Sciences and Health Professions and Related Programs"; college71.website = @"www.msu.edu"; college71.isitIvyLeague = @"No"; college71.mascot = @"Sparty"; college71.color = @"White, Green"; college71.collegeNameCell = college71.name; college71.collegeRankCell = college71.rank; college71.collegePhotoCell = @"MSU_Seal_2010.svg.png";
    
    College *college72 = [College new]; college72.name = @"University of Iowa"; college72.collegeName = college72.name; college72.rank = @"#72"; college72.imageFile = @"iowa_campus.jpeg"; college72.sizeofCollegeCampus = @"1,880 acres"; college72.tuition = @"26,279"; college72.numberofStudents = @"21,564"; college72.address = @"107 Calvin Hall Iowa City, IA 52242-1396"; college72.acceptanceRate = @"79.80000000000001%"; college72.phoneNumber = @"(319) 335-3500"; college72.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Communication, Journalism, and Related Programs, Health Professions and Related Programs, Liberal Arts and Sciences, and Studies and Humanities"; college72.website = @"www.uiowa.edu"; college72.isitIvyLeague = @"No"; college72.mascot = @"Herky the Hawk"; college72.color = @"Black, Old gold"; college72.collegeNameCell = college72.name; college72.collegeRankCell = college72.rank; college72.collegePhotoCell = @"File:UI-seal.png";
    
    College *college73 = [College new]; college73.name = @"Virginia Tech"; college73.collegeName = college73.name; college73.rank = @"#73"; college73.imageFile = @"virginia_campus.jpeg"; college73.sizeofCollegeCampus = @"2,600 acres"; college73.tuition = @"25,320"; college73.numberofStudents = @"23,700"; college73.address = @"1007 pamplin hall, blackburg, VA 24061"; college73.acceptanceRate = @"66.5%"; college73.phoneNumber = @" (540) 231-6000"; college73.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Engineering, Biological and Biomedical Sciences, Social Sciences, and Family and Consumer Sciences/Human Sciences"; college73.website = @"www.vt.edu"; college73.isitIvyLeague = @"No"; college73.mascot = @"HokieBird"; college73.color = @"Chicago Maroon, Burnt Orange"; college73.collegeNameCell = college73.name; college73.collegeRankCell = college73.rank; college73.collegePhotoCell = @"virginia_logo.png";
    
    College *college74 = [College new]; college74.name = @"Stevens Institute of Technology"; college74.collegeName = college74.name; college74.rank = @"#74"; college74.imageFile = @"SIT_campus.jpeg"; college74.sizeofCollegeCampus = @"55 acres"; college74.tuition = @"43,561"; college74.numberofStudents = @"5,541"; college74.address = @"Castle Point on Hudson Hoboken, NJ 07030"; college74.acceptanceRate = @"41.7%"; college74.phoneNumber = @"(201) 216-5000"; college74.majorPrograms = @"Engineering, Business, Management, Marketing, and Related Support Services, Computer and Information Sciences and Support Services, Engineering Technologies and Engineering-Related Fields, and Biological and Biomedical Sciences"; college74.website = @"www.stevens.edu"; college74.isitIvyLeague = @"No"; college74.mascot = @"Attila the Duck"; college74.color = @"Grey, Stevens Red"; college74.collegeNameCell = college74.name; college74.collegeRankCell = college74.rank; college74.collegePhotoCell = @"File:SIT_Seal.jpg";
    
    College *college75 = [College new]; college75.name = @"University of Delaware"; college75.collegeName = college75.name; college75.rank = @"#75"; college75.imageFile = @"delaware_campus.jpeg"; college75.sizeofCollegeCampus = @"2,012 acres"; college75.tuition = @"27,462"; college75.numberofStudents = @"17,120"; college75.address = @"150 S College Ave, Newark, DE 19716"; college75.acceptanceRate = @"61%"; college75.phoneNumber = @"(302) 831-2805"; college75.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Education, Engineering, and Health Professions and Related Programs"; college75.website = @"www.udel.edu"; college75.isitIvyLeague = @"No"; college75.mascot = @"YoUDee, Blue Hen"; college75.color = @"Gold, Blue"; college75.collegeNameCell = college75.name; college75.collegeRankCell = college75.rank; college75.collegePhotoCell = @"delaware_logo.png";
    
    College *college76 = [College new]; college76.name = @"American University"; college76.collegeName = college76.name; college76.rank = @"#76"; college76.imageFile = @"americancampus.jpeg"; college76.sizeofCollegeCampus = @"84 acres"; college76.tuition = @"39,499"; college76.numberofStudents = @"7,212"; college76.address = @" 4400 Massachusetts Ave NW, Washington, DC 20016"; college76.acceptanceRate = @"41.6%"; college76.phoneNumber = @" (202) 885-1000"; college76.majorPrograms = @"International Relations and Affairs, Business, Management, Marketing, and Related Support Services, Political Science and Government, Communication, Journalism, and Related Programs, and Economics"; college76.website = @"www.american.edu"; college76.isitIvyLeague = @"No"; college76.mascot = @"American University Clawed the Eagle"; college76.color = @"Blue, Red"; college76.collegeNameCell = college76.name; college76.collegeRankCell = college76.rank; college76.collegePhotoCell = @"americanseal.png";
    
    College *college77 = [College new]; college77.name = @"Baylor University"; college77.collegeName = college77.name; college77.rank = @"#77"; college77.imageFile = @"baylor_campus.jpeg"; college77.sizeofCollegeCampus = @"1,000 acres"; college77.tuition = @"33,916"; college77.numberofStudents = @"12,575"; college77.address = @"1311 S 5th St, Waco, Texas 76798"; college77.acceptanceRate = @"40%"; college77.phoneNumber = @"(254) 710-1011"; college77.majorPrograms = @"Biology/Biological Sciences, Psychology, Registered Nursing/Registered Nurse, Accounting, and Marketing/Marketing Management"; college77.website = @"www.baylor.edu"; college77.isitIvyLeague = @"No"; college77.mascot = @"Judge Joy, Judge Lady"; college77.color = @"Green, Gold"; college77.collegeNameCell = college77.name; college77.collegeRankCell = college77.rank; college77.collegePhotoCell = @"baylor_seal.png";
    
    College *college78 = [College new]; college78.name = @"Colorado School of Mines"; college78.collegeName = college78.name; college78.rank = @"#78"; college78.imageFile = @"coloradominescampus.jpeg"; college78.sizeofCollegeCampus = @"470 acres"; college78.tuition = @"30,684"; college78.numberofStudents = @"5,346"; college78.address = @"1500 Illinois Street Golden, CO 80401"; college78.acceptanceRate = @"44.5%"; college78.phoneNumber = @"(303) 273-3000"; college78.majorPrograms = @"Engineering, Mathematics and Statistics, Physical Sciences, and Social Sciences"; college78.website = @"www.mines.edu"; college78.isitIvyLeague = @"No"; college78.mascot = @"Blaster the Burro, Marvin the Miner"; college78.color = @"Silver, Blue"; college78.collegeNameCell = college78.name; college78.collegeRankCell = college78.rank; college78.collegePhotoCell = @"coloradominesseal.jpeg";
    
    College *college79 = [College new]; college79.name = @"State University of New York College of Environmental Science and Forestry"; college79.collegeName = college79.name; college79.rank = @"#79"; college79.imageFile = @"suny_campus.jpeg"; college79.sizeofCollegeCampus = @"12 acres"; college79.tuition = @"15,820"; college79.numberofStudents = @"1,744"; college79.address = @"1 Forestry Dr, Syracuse, NY 13210"; college79.acceptanceRate = @"46.800000000000004%"; college79.phoneNumber = @"(315) 470-6500"; college79.majorPrograms = @"Environmental Biology, Environmental Science, Natural Resources Management and Policy,Engineering, and Landscape Architecture"; college79.website = @"www.esf.edu"; college79.isitIvyLeague = @"No"; college79.mascot = @"Mighty Oaks"; college79.color = @"Green, White and Gold"; college79.collegeNameCell = college79.name; college79.collegeRankCell = college79.rank; college79.collegePhotoCell = @"suny_seal.png";
    
    College *college80 = [College new]; college80.name = @"University of Alabama"; college80.collegeName = college80.name; college80.rank = @"#80"; college80.imageFile = @"alabamacampus.jpeg"; college80.sizeofCollegeCampus = @" 1,000 acres"; college80.tuition = @"22,950"; college80.numberofStudents = @"26,234"; college80.address = @"The University of Alabama, Tuscaloosa, AL 35487"; college80.acceptanceRate = @"43.5%"; college80.phoneNumber = @" (205) 348-6010"; college80.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Health Professions and Related Programs, Communication, Journalism, and Related Programs, Engineering, and Family and Consumer Sciences/Human Sciences"; college80.website = @"www.ua.edu"; college80.isitIvyLeague = @"No"; college80.mascot = @"Big Al"; college80.color = @"Crimson, White"; college80.collegeNameCell = college80.name; college80.collegeRankCell = college80.rank; college80.collegePhotoCell = @"alabamaseal.png";
    
    College *college81 = [College new]; college81.name = @"University of California, Santa Cruz"; college81.collegeName = college81.name; college81.rank = @"#81"; college81.imageFile = @"cali u santa cruz campus.jpg"; college81.sizeofCollegeCampus = @"2,000 acres"; college81.tuition = @"36,294"; college81.numberofStudents = @"15,945"; college81.address = @"1156 High St, Santa Cruz, CA 95064"; college81.acceptanceRate = @"67.4%"; college81.phoneNumber = @" (831) 459-0111"; college81.majorPrograms = @"Psychology, Business/Managerial Economics, English Language and Literature/Letters, Sociology, and Environmental Studies"; college81.website = @"www.ucsc.edu"; college81.isitIvyLeague = @"No"; college81.mascot = @"Sammy the Slug"; college81.color = @"Blue, Gold"; college81.collegeNameCell = college81.name; college81.collegeRankCell = college81.rank; college81.collegePhotoCell = @"calu u santa cruz seal.png";
    
    College *college82 = [College new]; college82.name = @"Clark University"; college82.collegeName = college82.name; college82.rank = @"#82"; college82.imageFile = @"clarkcampus.jpeg"; college82.sizeofCollegeCampus = @"50 acres"; college82.tuition = @"38,450"; college82.numberofStudents = @"2,311"; college82.address = @"950 Main St, Worcester, MA 01610"; college82.acceptanceRate = @"67.9%"; college82.phoneNumber = @"(508) 793-7711"; college82.majorPrograms = @"Psychology, Political Science and Government, Communication and Media Studies, Business Administration, Management and Operations, and English Language and Literature, General"; college82.website = @"www.clarku.edu"; college82.isitIvyLeague = @"No"; college82.mascot = @"Cougar"; college82.color = @"Scarlet, White"; college82.collegeNameCell = college82.name; college82.collegeRankCell = college82.rank; college82.collegePhotoCell = @"clarkseal.jpeg";
    
    College *college83 = [College new]; college83.name = @"Drexel University"; college83.collegeName = college83.name; college83.rank = @"#83"; college83.imageFile = @"Drexel_campus.jpeg"; college83.sizeofCollegeCampus = @"96 acres"; college83.tuition = @"36,090"; college83.numberofStudents = @"11,899"; college83.address = @"3141 Chestnut St, Philadelphia, PA 19104"; college83.acceptanceRate = @"58%"; college83.phoneNumber = @" (215) 895-2000"; college83.majorPrograms = @"Business, Management, Marketing, and Related Support Services,  Engineering, Health Professions and Related Programs, Visual and Performing Arts, and Computer and Information Sciences and Support Services"; college83.website = @"www.drexel.edu"; college83.isitIvyLeague = @"No"; college83.mascot = @"Mario the Magnificent, Dragon"; college83.color = @"Gold, Blue"; college83.collegeNameCell = college83.name; college83.collegeRankCell = college83.rank; college83.collegePhotoCell = @"Drexel_seal.png";
    
    College *college84 = [College new]; college84.name = @"Indiana University--Bloomington"; college84.collegeName = college84.name; college84.rank = @"#84"; college84.imageFile = @"indianabloomingtoncampus.jpeg"; college84.sizeofCollegeCampus = @"1,937 acres"; college84.tuition = @"31,483"; college84.numberofStudents = @"32,543"; college84.address = @"107 S Indiana Ave, Bloomington, IN 47405"; college84.acceptanceRate = @"72.3%"; college84.phoneNumber = @"(812) 855-4848"; college84.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Communication, Journalism, and Related Programs, Parks, Recreation, Leisure, and Fitness Studies, Education, and Social Sciences"; college84.website = @"www.iub.edu"; college84.isitIvyLeague = @"No"; college84.mascot = @"Indiana Hoosiers"; college84.color = @"Crimson, Cream"; college84.collegeNameCell = college84.name; college84.collegeRankCell = college84.rank; college84.collegePhotoCell = @"indianabloomingtonseal.jpeg";
    
    College *college85 = [College new]; college85.name = @"Marquette University"; college85.collegeName = college85.name; college85.rank = @"#85"; college85.imageFile = @"marquette campus.jpeg"; college85.sizeofCollegeCampus = @"94 acres"; college85.tuition = @"33,244"; college85.numberofStudents = @"8,387"; college85.address = @"1250 W Wisconsin Ave, Milwaukee, WI 53233"; college85.acceptanceRate = @"56.8%"; college85.phoneNumber = @"(414) 288-7250"; college85.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Communication, Journalism, and Related Programs, Engineering, Health Professions and Related Programs, and Social Sciences"; college85.website = @"www.marquette.edu"; college85.isitIvyLeague = @"No"; college85.mascot = @"The Golden Eagle"; college85.color = @"Gold, Navy Blue"; college85.collegeNameCell = college85.name; college85.collegeRankCell = college85.rank; college85.collegePhotoCell = @"marquette seal.png";
    
    College *college86 = [College new]; college86.name = @"University of Denver"; college86.collegeName = college86.name; college86.rank = @"#86"; college86.imageFile = @"denvercampus.jpeg"; college86.sizeofCollegeCampus = @"125 acres"; college86.tuition = @"39,117"; college86.numberofStudents = @"5,453"; college86.address = @"2199 S University Blvd, Denver, CO 80210"; college86.acceptanceRate = @"68.2%"; college86.phoneNumber = @"(303) 871-2000"; college86.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Visual and Performing Arts, Communication, Journalism, and Related Programs, and Psychology"; college86.website = @"www.du.edu"; college86.isitIvyLeague = @"No"; college86.mascot = @"Boone"; college86.color = @"Gold, Crimson"; college86.collegeNameCell = college86.name; college86.collegeRankCell = college86.rank; college86.collegePhotoCell = @"denverseal.jpeg";
    
    College *college87 = [College new]; college87.name = @"University of Tulsa"; college87.collegeName = college87.name; college87.rank = @"#87"; college87.imageFile = @"tulsa campus.jpeg"; college87.sizeofCollegeCampus = @"209 acres"; college87.tuition = @"31,198"; college87.numberofStudents = @"3,004"; college87.address = @"800 S Tucker Dr, Tulsa, OK 74104"; college87.acceptanceRate = @"41%"; college87.phoneNumber = @"(918) 631-2000"; college87.majorPrograms = @"Engineering, Business, Management, Marketing, and Related Support Services, Social Sciences, Visual and Performing Arts, and Health Professions and Related Programs"; college87.website = @"www.utulsa.edu"; college87.isitIvyLeague = @"No"; college87.mascot = @"Captain Cane"; college87.color = @" Crimson, Old gold, Royal blue"; college87.collegeNameCell = college87.name; college87.collegeRankCell = college87.rank; college87.collegePhotoCell = @"tulsa seal.png";
    
    College *college88 = [College new]; college88.name = @"Auburn University"; college88.collegeName = college88.name; college88.rank = @"#88"; college88.imageFile = @"auburncampus.jpeg"; college88.sizeofCollegeCampus = @"1,875 acres"; college88.tuition = @"25,190"; college88.numberofStudents = @"20,446"; college88.address = @"226 Thach Concourse, Auburn, AL 36849"; college88.acceptanceRate = @"70%"; college88.phoneNumber = @" (334) 844-4000"; college88.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Engineering, Education, Biological and Biomedical Sciences, and Social Sciences"; college88.website = @"www.auburn.edu"; college88.isitIvyLeague = @"No"; college88.mascot = @"Aubie"; college88.color = @"Navy Blue, Burnt Orange"; college88.collegeNameCell = college88.name; college88.collegeRankCell = college88.rank; college88.collegePhotoCell = @"auburnseal.jpeg";
    
    College *college89 = [College new]; college89.name = @"Binghamton University--State University of New York"; college89.collegeName = college89.name; college89.rank = @"#89"; college89.imageFile = @"binghamton campus.jpeg"; college89.sizeofCollegeCampus = @"930 acres"; college89.tuition = @"16,761"; college89.numberofStudents = @"14,746"; college89.address = @"4400 Vestal Pkwy E, Binghamton, NY 13902"; college89.acceptanceRate = @"40.7%"; college89.phoneNumber = @"(607) 777-2000"; college89.majorPrograms = @"Business Administration and Management, English Language and Literature, Psychology, Biology/Biological Sciences, and Engineering"; college89.website = @"www.binghamton.edu"; college89.isitIvyLeague = @"No"; college89.mascot = @"Baxter The Bearcat"; college89.color = @"Green, White, Black"; college89.collegeNameCell = college89.name; college89.collegeRankCell = college89.rank; college89.collegePhotoCell = @"binghamton seal.png";
    
    College *college90 = [College new]; college90.name = @"Miami University--Oxford"; college90.collegeName = college90.name; college90.rank = @"#90"; college90.imageFile = @"miamioxfordcampus.jpeg"; college90.sizeofCollegeCampus = @"2,000 acres"; college90.tuition = @"29,158"; college90.numberofStudents = @"14,936"; college90.address = @"501 E High St, Oxford, OH 45056"; college90.acceptanceRate = @"74.1%"; college90.phoneNumber = @" (513) 529-1809"; college90.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Education, Biological and Biomedical Sciences, and Psychology"; college90.website = @"www.muohio.edu"; college90.isitIvyLeague = @"No"; college90.mascot = @"Swoop the RedHawk"; college90.color = @"White, Red"; college90.collegeNameCell = college90.name; college90.collegeRankCell = college90.rank; college90.collegePhotoCell = @"miamioxfordseal.png";
    
    College *college91 = [College new]; college91.name = @"St. Louis University"; college91.collegeName = college91.name; college91.rank = @"#91"; college91.imageFile = @"stlouiscampus.jpeg"; college91.sizeofCollegeCampus = @"268 acres"; college91.tuition = @"35,246"; college91.numberofStudents = @"8,670"; college91.address = @"1 Grand Boulevard St. Louis, MO 63103"; college91.acceptanceRate = @"61.3%"; college91.phoneNumber = @"(314) 977-2222"; college91.majorPrograms = @"Registered Nursing/Registered Nurse, Biology/Biological Sciences, Physical Therapy/Therapist, Psychology, and Organizational Communication"; college91.website = @"www.slu.edu"; college91.isitIvyLeague = @"No"; college91.mascot = @"Billikens"; college91.color = @"Blue, White"; college91.collegeNameCell = college91.name; college91.collegeRankCell = college91.rank; college91.collegePhotoCell = @"saintlouisseal.png";
    
    College *college92 = [College new]; college92.name = @"Stony Brook University--State University of New York"; college92.collegeName = college92.name; college92.rank = @"#92"; college92.imageFile = @"stonycampus.jpeg"; college92.sizeofCollegeCampus = @"1,454 acres"; college92.tuition = @"18,134"; college92.numberofStudents = @"15,926"; college92.address = @"100 Nicolls Rd, Stony Brook, NY 11794"; college92.acceptanceRate = @"39.1%"; college92.phoneNumber = @"(631) 689-6000"; college92.majorPrograms = @"Psychology, Biology/Biological Sciences, Health Professions and Related Clinical Sciences, Business Administration and Management, and Registered Nursing/Registered Nurse"; college92.website = @"www.stonybrook.edu"; college92.isitIvyLeague = @"No"; college92.mascot = @"Wolfie the Seawolf"; college92.color = @"Grey, Scarlet"; college92.collegeNameCell = college92.name; college92.collegeRankCell = college92.rank; college92.collegePhotoCell = @"stonyseal.gif";
    
    College *college93 = [College new]; college93.name = @"Texas Christian University"; college93.collegeName = college93.name; college93.rank = @"#93"; college93.imageFile = @"texaschristiancampus.jpeg"; college93.sizeofCollegeCampus = @"275 acres"; college93.tuition = @"34,590"; college93.numberofStudents = @"8,229"; college93.address = @"2800 S University Dr, Fort Worth, TX 76129"; college93.acceptanceRate = @"37.6%"; college93.phoneNumber = @"(817) 257-7000"; college93.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Communication, Journalism, and Related Programs, Health Professions and Related Programs, Social Sciences, and Visual and Performing Arts"; college93.website = @"www.tcu.edu"; college93.isitIvyLeague = @"No"; college93.mascot = @"Super Frog"; college93.color = @"White, Purple"; college93.collegeNameCell = college93.name; college93.collegeRankCell = college93.rank; college93.collegePhotoCell = @"texaschristianseal.png";
    
    College *college94 = [College new]; college94.name = @"University of San Diego"; college94.collegeName = college94.name; college94.rank = @"#94"; college94.imageFile = @"sandiegocampus.jpg"; college94.sizeofCollegeCampus = @"5,493 acres"; college94.tuition = @"39,970"; college94.numberofStudents = @"5,493"; college94.address = @"5998 Alcalá Park, San Diego, CA 92110"; college94.acceptanceRate = @"47.5%"; college94.phoneNumber = @"(619) 260-4600"; college94.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Communication, Journalism, and Related Programs, Biological and Biomedical Sciences, and Psychology"; college94.website = @"www.sandiego.edu"; college94.isitIvyLeague = @"No"; college94.mascot = @"Diego Torero"; college94.color = @"Navy Blue, Columbia blue, White"; college94.collegeNameCell = college94.name; college94.collegeRankCell = college94.rank; college94.collegePhotoCell = @"sandiegoseal.gif";
    
    College *college95 = [College new]; college95.name = @"University of Vermont"; college95.collegeName = college95.name; college95.rank = @"#95"; college95.imageFile = @"vermontcampus.jpg"; college95.sizeofCollegeCampus = @"460 acres"; college95.tuition = @"35,582"; college95.numberofStudents = @"11,482"; college95.address = @"85 S Prospect St, Burlington, 05401"; college95.acceptanceRate = @"75.4%"; college95.phoneNumber = @" (802) 656-3131"; college95.majorPrograms = @"Business Administration and Management, Psychology, English Language and Literature, Political Science and Government, and Environmental Studies"; college95.website = @"www.uvm.edu"; college95.isitIvyLeague = @"No"; college95.mascot = @"Rally"; college95.color = @"Gold, Green"; college95.collegeNameCell = college95.name; college95.collegeRankCell = college95.rank; college95.collegePhotoCell = @"vermontseal.png";
    
    College *college96 = [College new]; college96.name = @"Florida State University"; college96.collegeName = college96.name; college96.rank = @"#96"; college96.imageFile = @"fsu campus.jpeg"; college96.sizeofCollegeCampus = @"448 acres"; college96.tuition = @"20,992"; college96.numberofStudents = @"32,201"; college96.address = @" 600 W College Ave, Tallahassee, FL 32304"; college96.acceptanceRate = @"58.5%"; college96.phoneNumber = @"(850) 644-2525"; college96.majorPrograms = @"Finance, Criminal Justice/Safety Studies, English Language and Literature, Political Science and Government, and Psychology"; college96.website = @"www.fsu.edu"; college96.isitIvyLeague = @"No"; college96.mascot = @"Seminole"; college96.color = @"Gold, Garnet"; college96.collegeNameCell = college96.name; college96.collegeRankCell = college96.rank; college96.collegePhotoCell = @"fsu seal.png";
    
    College *college97 = [College new]; college97.name = @"University of Colorado--Boulder"; college97.collegeName = college97.name; college97.rank = @"#97"; college97.imageFile = @"u of colorado boulder campus.jpeg"; college97.sizeofCollegeCampus = @"600 acres"; college97.tuition = @"31,378"; college97.numberofStudents = @"26,325"; college97.address = @"2055 Regent Dr, Boulder, CO 80309"; college97.acceptanceRate = @"86.9%"; college97.phoneNumber = @"(303) 492-1411"; college97.majorPrograms = @"Social Sciences, Business, Management, Marketing, and Related Support Services, Biological and Biomedical Sciences, Psychology, and Communication, Journalism, and Related Programs"; college97.website = @"www.colorado.edu"; college97.isitIvyLeague = @"No"; college97.mascot = @"Ralphie the Buffalo, Chip"; college97.color = @"Silver, Black, Gold"; college97.collegeNameCell = college97.name; college97.collegeRankCell = college97.rank; college97.collegePhotoCell = @"u of colorado boulder seal.png";
    
    College *college98 = [College new]; college98.name = @"University of Massachusetts--Amherst"; college98.collegeName = college98.name; college98.rank = @"#98"; college98.imageFile = @"umassamherstcampus.jpeg"; college98.sizeofCollegeCampus = @"1,463 acres"; college98.tuition = @"26,645"; college98.numberofStudents = @"21,812"; college98.address = @"181 Presidents Dr, Amherst, MA 01003"; college98.acceptanceRate = @"65.6%"; college98.phoneNumber = @" (413) 545-0111"; college98.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Psychology, Biological and Biomedical Sciences, and Communication, Journalism, and Related Programs"; college98.website = @"www.umass.edu"; college98.isitIvyLeague = @"No"; college98.mascot = @"Sam the Minuteman"; college98.color = @"Maroon, White"; college98.collegeNameCell = college98.name; college98.collegeRankCell = college98.rank; college98.collegePhotoCell = @"umassamherstseal.png";
    
    College *college99 = [College new]; college99.name = @"University of Missouri"; college99.collegeName = college99.name; college99.rank = @"#99"; college99.imageFile = @"u of missouri campus.jpeg"; college99.sizeofCollegeCampus = @"1,250 acres"; college99.tuition = @"23,366"; college99.numberofStudents = @"26,024"; college99.address = @"319 jesse hall, Columbia, MO 65211"; college99.acceptanceRate = @"82.3%"; college99.phoneNumber = @" (573) 882-2121"; college99.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Communication, Journalism, and Related Programs, Health Professions and Related Programs, Engineering, and Social Sciences"; college99.website = @"www.missouri.edu"; college99.isitIvyLeague = @"No"; college99.mascot = @"Truman the Tiger"; college99.color = @"Gold, Black"; college99.collegeNameCell = college99.name; college99.collegeRankCell = college99.rank; college99.collegePhotoCell = @"u of missouri seal.jpeg";
    
    College *college100 = [College new]; college100.name = @"Iowa State University"; college100.collegeName = college100.name; college100.rank = @"#100"; college100.imageFile = @"iowa_campus.jpeg"; college100.sizeofCollegeCampus = @"1,795 acres"; college100.tuition = @"19,838"; college100.numberofStudents = @"24,343"; college100.address = @"2229 Lincoln Way, Ames, IA 50011"; college100.acceptanceRate = @"86.2%"; college100.phoneNumber = @"(515) 294-4111"; college100.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Engineering, Agriculture, Agriculture Operations, and Related Sciences, Biological and Biomedical Sciences, and Communication, Journalism, and Related Programs"; college100.website = @"www.iastate.edu"; college100.isitIvyLeague = @"No"; college100.mascot = @"Cy the Cardinal"; college100.color = @"Gold, Cardinal"; college100.collegeNameCell = college100.name; college100.collegeRankCell = college100.rank; college100.collegePhotoCell = @"iowa_seal.jpeg";
    
    College *college101 = [College new]; college101.name = @"University of California--Riverside"; college101.collegeName = college101.name; college101.rank = @"#101"; college101.imageFile = @"u of cali riverside campus.jpeg"; college101.sizeofCollegeCampus = @"1,200 acres"; college101.tuition = @"35,801"; college101.numberofStudents = @"18,523"; college101.address = @"900 University Ave, Riverside, CA 92521"; college101.acceptanceRate = @"69.3%"; college101.phoneNumber = @" (951) 827-1012"; college101.majorPrograms = @"Social Sciences, Business, Management, Marketing, and Related Support Services, Biological and Biomedical Sciences, Psychology and Multi/Interdisciplinary Studies               "; college101.website = @""; college101.isitIvyLeague = @"No"; college101.mascot = @"Scotty the Bear"; college101.color = @"Gold, Sky Blue"; college101.collegeNameCell = college101.name; college101.collegeRankCell = college101.rank; college101.collegePhotoCell = @"u of cali riverside seal.jpeg";
    College *college102 = [College new]; college102.name = @"University of Nebraska--Lincoln"; college102.collegeName = college102.name; college102.rank = @"#102"; college102.imageFile = @"nebraskacampus.jpg"; college102.sizeofCollegeCampus = @"624 acres"; college102.tuition = @"20,968"; college102.numberofStudents = @"19,345"; college102.address = @"1400 R St, Lincoln, NE 68508"; college102.acceptanceRate = @"59.3%"; college102.phoneNumber = @"(402) 472-7211"; college102.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Engineering, Family and Consumer Sciences/Human Sciences, Education, Agriculture, Agriculture Operations, and Related Sciences"; college102.website = @"www.unl.edu"; college102.isitIvyLeague = @"No"; college102.mascot = @"Herbie Husker, Lil' Red"; college102.color = @"Scarlet, Cream"; college102.collegeNameCell = college102.name; college102.collegeRankCell = college102.rank; college102.collegePhotoCell = @"nebraskaseal.jpeg";
    College *college103 = [College new]; college103.name = @"University of Oklahoma"; college103.collegeName = college103.name; college103.rank = @"#103"; college103.imageFile = @"220px-Bizzell_Library_4-15-2006_11-20-33_AM.jpg"; college103.sizeofCollegeCampus = @"3,914 acres"; college103.tuition = @"18,978"; college103.numberofStudents = @"21,413"; college103.address = @"660 Parrington Oval, Norman, OK 73019"; college103.acceptanceRate = @"81.8%"; college103.phoneNumber = @"(405) 325-0311"; college103.majorPrograms = @"Health Professions and Related Programs, Multi/Interdisciplinary Studies, Psychology, Business, Management, Marketing, and Related Support Services, Liberal Arts and Sciences, General Studies and Humanities"; college103.website = @"www.ou.edu"; college103.isitIvyLeague = @"No"; college103.mascot = @"Boomer and Sooner, Sooner Schooner"; college103.color = @"Crimson, Cream"; college103.collegeNameCell = college103.name; college103.collegeRankCell = college103.rank; college103.collegePhotoCell = @"1283462865841.jpg";
    College *college104 = [College new]; college104.name = @"University of Tennessee"; college104.collegeName = college104.name; college104.rank = @"#104"; college104.imageFile = @"birdview1.jpg"; college104.sizeofCollegeCampus = @"560 acres"; college104.tuition = @"25,238"; college104.numberofStudents = @"21,214"; college104.address = @"527 Andy Holt Tower Knoxville, TN 37996"; college104.acceptanceRate = @"69.7%"; college104.phoneNumber = @"(865) 974-1000"; college104.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Communication, Journalism, and Related Programs, Psychology, Social Sciences and Engineering"; college104.website = @"www.utk.edu"; college104.isitIvyLeague = @"No"; college104.mascot = @"Smokey IX"; college104.color = @"White, Orange"; college104.collegeNameCell = college104.name; college104.collegeRankCell = college104.rank; college104.collegePhotoCell = @"University_of_Tennessee_seal.png";
    College *college105 = [College new]; college105.name = @"Loyola University Chicago"; college105.collegeName = college105.name; college105.rank = @"#105"; college105.imageFile = @"ic_picture_final.jpg"; college105.sizeofCollegeCampus = @"105 acres"; college105.tuition = @"34,218"; college105.numberofStudents = @"9,856"; college105.address = @"6339 N Sheridan Rd, Chicago, IL 60660"; college105.acceptanceRate = @"54.9%"; college105.phoneNumber = @"(773) 274-3000"; college105.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Biological and Biomedical Sciences, Psychology, Communication, Journalism, and Related Programs                             "; college105.website = @""; college105.isitIvyLeague = @"No"; college105.mascot = @" LU Wolf"; college105.color = @" Gold, Black, Maroon"; college105.collegeNameCell = college105.name; college105.collegeRankCell = college105.rank; college105.collegePhotoCell = @"786868438486a0cbfc217d977766601e.jpg";
    College *college106 = [College new]; college106.name = @"North Carolina State University--Raleigh"; college106.collegeName = college106.name; college106.rank = @"#106"; college106.imageFile = @"north-carolina-state-university-office.jpg"; college106.sizeofCollegeCampus = @"2,200 acres"; college106.tuition = @"20,953"; college106.numberofStudents = @"25,176"; college106.address = @"2211 Hillsborough St, Raleigh, NC 27607"; college106.acceptanceRate = @"52.3%"; college106.phoneNumber = @" (919) 515-2011"; college106.majorPrograms = @"Information not available"; college106.website = @"www.ncsu.edu"; college106.isitIvyLeague = @"No"; college106.mascot = @"Mr. and Ms. Wuf, Tuffy"; college106.color = @"Red, White"; college106.collegeNameCell = college106.name; college106.collegeRankCell = college106.rank; college106.collegePhotoCell = @"Nimages.jpeg";
    College *college107 = [College new]; college107.name = @"University at Buffalo--The State University of New York"; college107.collegeName = college107.name; college107.rank = @"#107"; college107.imageFile = @"about_ub.jpg"; college107.sizeofCollegeCampus = @"1,350 acres"; college107.tuition = @"15,592"; college107.numberofStudents = @"19,334"; college107.address = @"12 Capen Hall, Buffalo, NY 14260"; college107.acceptanceRate = @"53.2%"; college107.phoneNumber = @"(716) 645-6900"; college107.majorPrograms = @"Information not available"; college107.website = @"www.buffalo.edu"; college107.isitIvyLeague = @"No"; college107.mascot = @"Victor E. Bull"; college107.color = @"White, Blue"; college107.collegeNameCell = college107.name; college107.collegeRankCell = college107.rank; college107.collegePhotoCell = @"University_at_Buffalo_The_State_University_of_New_York_seal.png";
    College *college108 = [College new]; college108.name = @"University of Kansas"; college108.collegeName = college108.name; college108.rank = @"#108"; college108.imageFile = @"images6111.jpeg"; college108.sizeofCollegeCampus = @"1,000 acres"; college108.tuition = @"22,608"; college108.numberofStudents = @"19,695"; college108.address = @"1502 Iowa Street Lawrence, KS 66045-7576"; college108.acceptanceRate = @"92.7%"; college108.phoneNumber = @"(785) 864-2700"; college108.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Health Professions and Related Programs, Social Sciences, Visual and Performing Arts, Communication, Journalism, and Related Programs                                    "; college108.website = @"www.ku.edu"; college108.isitIvyLeague = @"No"; college108.mascot = @"Jayhawk"; college108.color = @"Crimson, Blue"; college108.collegeNameCell = college108.name; college108.collegeRankCell = college108.rank; college108.collegePhotoCell = @"seal300.gif";
    College *college109 = [College new]; college109.name = @"University of New Hampshire"; college109.collegeName = college109.name; college109.rank = @"#109"; college109.imageFile = @"images+5+65.jpeg"; college109.sizeofCollegeCampus = @"2,600 acres"; college109.tuition = @"28,884"; college109.numberofStudents = @"12,609"; college109.address = @"83 Main St, Durham, NH 03824"; college109.acceptanceRate = @"74.2%"; college109.phoneNumber = @" (603) 862-2050"; college109.majorPrograms = @"Business Administration and Management, General, Liberal Arts and Sciences/Liberal Studies, Psychology, General, English Language and Literature, General, Speech Communication and Rhetoric"; college109.website = @"www.unh.edu"; college109.isitIvyLeague = @"No"; college109.mascot = @"Wild E. Cat, Gnarlz"; college109.color = @"White, Blue"; college109.collegeNameCell = college109.name; college109.collegeRankCell = college109.rank; college109.collegePhotoCell = @"UNewHampshire_seal.png";
    College *college110 = [College new]; college110.name = @"University of San Francisco"; college110.collegeName = college110.name; college110.rank = @"#110"; college110.imageFile = @"dsc03586.jpg"; college110.sizeofCollegeCampus = @"55 acres"; college110.tuition = @"38,884"; college110.numberofStudents = @"6,051"; college110.address = @"2130 Fulton St, San Francisco, CA 94117"; college110.acceptanceRate = @"58%"; college110.phoneNumber = @"(415) 422-5555"; college110.majorPrograms = @"Registered Nursing/Registered Nurse, Business Administration and Management, General, Psychology, General, Marketing/Marketing Management, General, Speech Communication and Rhetoric"; college110.website = @"www.usfca.edu"; college110.isitIvyLeague = @"No"; college110.mascot = @"The Don"; college110.color = @"Green, Gold"; college110.collegeNameCell = college110.name; college110.collegeRankCell = college110.rank; college110.collegePhotoCell = @"images12.jpeg";
    College *college111 = [College new]; college111.name = @"University of the Pacific"; college111.collegeName = college111.name; college111.rank = @"#111"; college111.imageFile = @"images5516.jpeg"; college111.sizeofCollegeCampus = @"175 acres"; college111.tuition = @"38,320"; college111.numberofStudents = @"3,883"; college111.address = @"3601 Pacific Ave, Stockton, CA 95211"; college111.acceptanceRate = @"35.8%"; college111.phoneNumber = @" (209) 946-2285"; college111.majorPrograms = @"Information not available"; college111.website = @"www.pacific.edu"; college111.isitIvyLeague = @"No"; college111.mascot = @"Power Cat"; college111.color = @"Black, Orange"; college111.collegeNameCell = college111.name; college111.collegeRankCell = college111.rank; college111.collegePhotoCell = @"images-1.jpeg";
    College *college112 = [College new]; college112.name = @"Illinois Institute of Technology"; college112.collegeName = college112.name; college112.rank = @"#112"; college112.imageFile = @"220px-IIT_Main_Building.jpg"; college112.sizeofCollegeCampus = @"120 acres"; college112.tuition = @"37,093"; college112.numberofStudents = @"2,714"; college112.address = @"3300 S Federal St, Chicago, IL 60616"; college112.acceptanceRate = @"63.5%"; college112.phoneNumber = @"(312) 567-3000"; college112.majorPrograms = @"Architecture, Mechanical Engineering, Civil Engineering, General, Electrical and Electronics Engineering, Business Administration and Management, General"; college112.website = @""; college112.isitIvyLeague = @"No"; college112.mascot = @"Talon The Hawk"; college112.color = @"Scarlet, Grey"; college112.collegeNameCell = college112.name; college112.collegeRankCell = college112.rank; college112.collegePhotoCell = @"175px-IIT_Seal.svg.png";
    College *college113 = [College new]; college113.name = @"University of St. Thomas"; college113.collegeName = college113.name; college113.rank = @"#113"; college113.imageFile = @"070814mde062_003.jpg"; college113.sizeofCollegeCampus = @"78 acres"; college113.tuition = @"32,035"; college113.numberofStudents = @"6,175"; college113.address = @"2115 Summit Ave, St Paul, MN 55105"; college113.acceptanceRate = @"84.5%"; college113.phoneNumber = @"(651) 962-5000"; college113.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Philosophy and Religious Studies, Psychology, Communication, Journalism, and Related Programs"; college113.website = @"www.stthomas.edu"; college113.isitIvyLeague = @"No"; college113.mascot = @"Tommie the Tomcat"; college113.color = @"Grey, Purple"; college113.collegeNameCell = college113.name; college113.collegeRankCell = college113.rank; college113.collegePhotoCell = @"180px-Seal_of_University_of_St._Thomas_(Texas).svg.png";
    College *college114 = [College new]; college114.name = @"Clarkson University"; college114.collegeName = college114.name; college114.rank = @"#114"; college114.imageFile = @"Clarkson_Exterior_main1.jpg"; college114.sizeofCollegeCampus = @"640 acres"; college114.tuition = @"38,610"; college114.numberofStudents = @"3,018"; college114.address = @"10 Clarkson Ave, Potsdam, NY 13699"; college114.acceptanceRate = @"77.5%"; college114.phoneNumber = @"(315) 268-6400"; college114.majorPrograms = @"Engineering, General, Business Administration and Management, General, Biology/Biological Sciences, General, Physical Sciences"; college114.website = @"www.clarkson.edu"; college114.isitIvyLeague = @"No"; college114.mascot = @"Golden Knight"; college114.color = @"Gold, Green"; college114.collegeNameCell = college114.name; college114.collegeRankCell = college114.rank; college114.collegePhotoCell = @"Clarkson-seal.png";
    College *college115 = [College new]; college115.name = @"Rutgers, the State University of New Jersey--Newark"; college115.collegeName = college115.name; college115.rank = @"#115"; college115.imageFile = @"cacsa.png"; college115.sizeofCollegeCampus = @"37 acres"; college115.tuition = @"25,910"; college115.numberofStudents = @"7,465"; college115.address = @"249 University Avenue Newark, NJ 07102-1896"; college115.acceptanceRate = @"54%"; college115.phoneNumber = @"(973) 353-1766"; college115.majorPrograms = @"Accounting, Criminal Justice/Safety Studies, Finance, General, Psychology, General, Registered Nursing/Registered Nurse"; college115.website = @"http://www.newark.rutgers.edu/"; college115.isitIvyLeague = @"No"; college115.mascot = @"Scarlet Raiders"; college115.color = @"Scarlet"; college115.collegeNameCell = college115.name; college115.collegeRankCell = college115.rank; college115.collegePhotoCell = @"Rutgers_TSUNJ_1000x1000x3c.png";
    College *college116 = [College new]; college116.name = @"University of Dayton"; college116.collegeName = college116.name; college116.rank = @"#116"; college116.imageFile = @"University of Dayton Caldwell Street00006_0.jpg"; college116.sizeofCollegeCampus = @"373 acres"; college116.tuition = @"33,400"; college116.numberofStudents = @"7,843"; college116.address = @"300 College Park, Dayton, OH 45469"; college116.acceptanceRate = @"75.6%"; college116.phoneNumber = @"(937) 229-1000"; college116.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Engineering, Education, Communication, Journalism, and Related Programs, Health Professions and Related Programs                                    "; college116.website = @"www.udayton.edu"; college116.isitIvyLeague = @"No"; college116.mascot = @" Rudy Flyer"; college116.color = @"Columbia blue, Red"; college116.collegeNameCell = college116.name; college116.collegeRankCell = college116.rank; college116.collegePhotoCell = @"200px-Ohio_University_seal.svg.png";
    College *college117 = [College new]; college117.name = @"University of Oregon"; college117.collegeName = college117.name; college117.rank = @"#117"; college117.imageFile = @"vfiles20482.jpg"; college117.sizeofCollegeCampus = @"295 acres"; college117.tuition = @"28,660"; college117.numberofStudents = @"20,623"; college117.address = @" 1585 East 13th Avenue, Eugene, OR 97403"; college117.acceptanceRate = @"73%"; college117.phoneNumber = @" (541) 346-1000"; college117.majorPrograms = @"Business/Commerce, General, Journalism, Psychology, General, Political Science and Government, General, Sociology                                    "; college117.website = @"www.uoregon.edu"; college117.isitIvyLeague = @"No"; college117.mascot = @"The Oregon Duck"; college117.color = @"Green, Yellow"; college117.collegeNameCell = college117.name; college117.collegeRankCell = college117.rank; college117.collegePhotoCell = @"UO_seal.jpg";
    College *college118 = [College new]; college118.name = @"University of South Carolina"; college118.collegeName = college118.name; college118.rank = @"#118"; college118.imageFile = @"26262626126.jpg"; college118.sizeofCollegeCampus = @"438 acres"; college118.tuition = @"26,352"; college118.numberofStudents = @"22,556"; college118.address = @"816 Bull St, Columbia, SC 29208"; college118.acceptanceRate = @"63.1%"; college118.phoneNumber = @" (803) 777-7000"; college118.majorPrograms = @"Business Administration, Management and Operations, Research and Experimental Psychology, Biology, General, Registered Nursing, Nursing Administration, Nursing Research and Clinical Nursing, Teacher Education and Professional Development, Specific Levels and Methods"; college118.website = @"www.sc.edu"; college118.isitIvyLeague = @"No"; college118.mascot = @"University of South Carolina Cocky"; college118.color = @"Garnet, Black"; college118.collegeNameCell = college118.name; college118.collegeRankCell = college118.rank; college118.collegePhotoCell = @"15661516156.png";
    College *college119 = [College new]; college119.name = @"Catholic University of America"; college119.collegeName = college119.name; college119.rank = @"#119"; college119.imageFile = @"sdavf.jpeg"; college119.sizeofCollegeCampus = @" 184 acres"; college119.tuition = @"36,820"; college119.numberofStudents = @"3,633"; college119.address = @"620 Michigan Ave NE, Washington, DC 20064"; college119.acceptanceRate = @"75.1%"; college119.phoneNumber = @"(202) 319-5000"; college119.majorPrograms = @"Architecture, Political Science and Government, General, Registered Nursing/Registered Nurse, Psychology, General, Mass Communication/Media Studies"; college119.website = @"www.cua.edu"; college119.isitIvyLeague = @"No"; college119.mascot = @"The Catholic University of America Cardinal"; college119.color = @"Gold, Black, White, Red"; college119.collegeNameCell = college119.name; college119.collegeRankCell = college119.rank; college119.collegePhotoCell = @"image005.gif";
    College *college120 = [College new]; college120.name = @"Duquesne University"; college120.collegeName = college120.name; college120.rank = @"#120"; college120.imageFile = @"68451.jpeg"; college120.sizeofCollegeCampus = @"49 acres"; college120.tuition = @"30,054"; college120.numberofStudents = @"5,677"; college120.address = @"600 Forbes Avenue, Pittsburgh, PA 15282"; college120.acceptanceRate = @"70.1%"; college120.phoneNumber = @"(412) 396-6000"; college120.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Health Professions and Related Programs, Education, Communication, Journalism, and Related Programs, Social Sciences"; college120.website = @"www.duq.edu"; college120.isitIvyLeague = @"No"; college120.mascot = @"The Duke"; college120.color = @"Blue, Red"; college120.collegeNameCell = college120.name; college120.collegeRankCell = college120.rank; college120.collegePhotoCell = @"06428.jpeg";
    College *college121 = [College new]; college121.name = @"Howard University"; college121.collegeName = college121.name; college121.rank = @"#121"; college121.imageFile = @"yuggub.jpeg"; college121.sizeofCollegeCampus = @"258 acres"; college121.tuition = @"22,683"; college121.numberofStudents = @"7,164"; college121.address = @"2400 6th St NW, Washington, DC 20059"; college121.acceptanceRate = @"53.9%"; college121.phoneNumber = @"(202) 806-6100"; college121.majorPrograms = @"Journalism, Biology, General, Psychology, General, Radio, Television, and Digital Communication, Political Science and Government, General"; college121.website = @"www.howard.edu"; college121.isitIvyLeague = @"No"; college121.mascot = @"Bison"; college121.color = @"Blue, Red"; college121.collegeNameCell = college121.name; college121.collegeRankCell = college121.rank; college121.collegePhotoCell = @"Howard_University_seal.png";
    College *college122 = [College new]; college122.name = @"Michigan Technological University"; college122.collegeName = college122.name; college122.rank = @"#122"; college122.imageFile = @"300px-Michigan_Tech_campus_2011.jpg"; college122.sizeofCollegeCampus = @"925 acres"; college122.tuition = @"27,258"; college122.numberofStudents = @"5,731"; college122.address = @"1400 Townsend Dr, Houghton, MI 49931"; college122.acceptanceRate = @"74%"; college122.phoneNumber = @"(906) 487-1885"; college122.majorPrograms = @"Engineering, Business, Management, Marketing, and Related Support Services, Computer and Information Sciences and Support Services, Biological and Biomedical Sciences, Natural Resources and Conservation"; college122.website = @"www.mtu.edu"; college122.isitIvyLeague = @"No"; college122.mascot = @" Blizzard T. Husky"; college122.color = @"Silver, Metallic Gold"; college122.collegeNameCell = college122.name; college122.collegeRankCell = college122.rank; college122.collegePhotoCell = @"200px-MTUSeal.svg.png";
    College *college123 = [College new]; college123.name = @"University of Arizona"; college123.collegeName = college123.name; college123.rank = @"#123"; college123.imageFile = @"oiojimok.jpeg"; college123.sizeofCollegeCampus = @"391 acres"; college123.tuition = @"26,231"; college123.numberofStudents = @"30,665"; college123.address = @"1401 E University Blvd, Tucson, AZ 85721"; college123.acceptanceRate = @"71.4%"; college123.phoneNumber = @" (520) 621-2211"; college123.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Biological and Biomedical Sciences, Psychology, Visual and Performing Arts"; college123.website = @"www.arizona.edu"; college123.isitIvyLeague = @"No"; college123.mascot = @"Wilbur"; college123.color = @"Navy Blue, Cardinal"; college123.collegeNameCell = college123.name; college123.collegeRankCell = college123.rank; college123.collegePhotoCell = @"University_of_Arizona_seal.png";
    College *college124 = [College new]; college124.name = @"Missouri University of Science & Technology "; college124.collegeName = college124.name; college124.rank = @"#124"; college124.imageFile = @"big_00.jpg"; college124.sizeofCollegeCampus = @"284 acres"; college124.tuition = @"23,666"; college124.numberofStudents = @"5,672"; college124.address = @"1870 Miner Cir, Rolla, MO 65409"; college124.acceptanceRate = @"89.8%"; college124.phoneNumber = @" (573) 341-4111"; college124.majorPrograms = @"Information not available"; college124.website = @"www.mst.edu"; college124.isitIvyLeague = @"No"; college124.mascot = @"Joe Miner"; college124.color = @"Silver, Dark green, Gold"; college124.collegeNameCell = college124.name; college124.collegeRankCell = college124.rank; college124.collegePhotoCell = @"Missouri_University_of_Science_and_Technology.png";
    College *college125 = [College new]; college125.name = @"New School "; college125.collegeName = college125.name; college125.rank = @"#125"; college125.imageFile = @"college-photo_14338.jpg"; college125.sizeofCollegeCampus = @"N/A"; college125.tuition = @"37,846"; college125.numberofStudents = @"7,081"; college125.address = @"66 W 12th St, New York, NY 10011"; college125.acceptanceRate = @"69.3%"; college125.phoneNumber = @"(212) 229-5600"; college125.majorPrograms = @"Information not available"; college125.website = @"www.newschool.edu"; college125.isitIvyLeague = @"No"; college125.mascot = @"Narwhals"; college125.color = @"Yellow, Red, Orange"; college125.collegeNameCell = college125.name; college125.collegeRankCell = college125.rank; college125.collegePhotoCell = @"aa6das6d.jpeg";
    College *college126 = [College new]; college126.name = @"Temple University "; college126.collegeName = college126.name; college126.rank = @"#126"; college126.imageFile = @"xkCVOUtwH8FIAQAF.jpg"; college126.sizeofCollegeCampus = @"330 acres"; college126.tuition = @"23,334"; college126.numberofStudents = @"27,702"; college126.address = @"580 Meetinghouse Rd, Ambler, PA 19002 "; college126.acceptanceRate = @"62.8%"; college126.phoneNumber = @"(267) 468-8000 "; college126.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Communication, Journalism, and Related Programs, Visual and Performing Arts, Education, Social Sciences"; college126.website = @"www.temple.edu"; college126.isitIvyLeague = @"No"; college126.mascot = @"Hooter the Owl"; college126.color = @"Cherry, White"; college126.collegeNameCell = college126.name; college126.collegeRankCell = college126.rank; college126.collegePhotoCell = @"Temple_University_Seal.png";
    College *college127 = [College new]; college127.name = @"University of Kentucky"; college127.collegeName = college127.name; college127.rank = @"#127"; college127.imageFile = @"hiiuhiihi.jpeg"; college127.sizeofCollegeCampus = @"779 acres"; college127.tuition = @"19,864"; college127.numberofStudents = @"20,099"; college127.address = @"410 Administration Dr, Lexington, KY 40506"; college127.acceptanceRate = @"68.4%"; college127.phoneNumber = @" (859) 257-9000 "; college127.majorPrograms = @"Biology/Biological Sciences, General, Psychology, General, Accounting, Registered Nursing/Registered Nurse, Business/Commerce, General"; college127.website = @"www.uky.edu"; college127.isitIvyLeague = @"No"; college127.mascot = @"Wildcat"; college127.color = @"White, Blue"; college127.collegeNameCell = college127.name; college127.collegeRankCell = college127.rank; college127.collegePhotoCell = @"uk-seal-1930.gif";
    College *college128 = [College new]; college128.name = @"University of Utah "; college128.collegeName = college128.name; college128.rank = @"#128"; college128.imageFile = @"coldd.jpeg"; college128.sizeofCollegeCampus = @" 1,535 acres"; college128.tuition = @"22,912"; college128.numberofStudents = @"24,297"; college128.address = @"201 Presidents Cir, Salt Lake City, UT 84112"; college128.acceptanceRate = @"83.4%"; college128.phoneNumber = @"(801) 581-7200"; college128.majorPrograms = @"Social Sciences, Business, Management, Marketing, and Related Support Services, Communication, Journalism, and Related Programs, Health Professions and Related Programs, Engineering"; college128.website = @"www.utah.edu"; college128.isitIvyLeague = @"No"; college128.mascot = @"University of Utah Swoop"; college128.color = @"Crimson and White"; college128.collegeNameCell = college128.name; college128.collegeRankCell = college128.rank; college128.collegePhotoCell = @"UofU_official_seal.png";
    College *college129 = [College new]; college129.name = @"Washington State University"; college129.collegeName = college129.name; college129.rank = @"#129"; college129.imageFile = @"college-photo_8117._445x280-zmm.JPG"; college129.sizeofCollegeCampus = @"1,742 acres"; college129.tuition = @"25,382"; college129.numberofStudents = @"22,763"; college129.address = @"Wilson Rd, Pullman, WA 99164"; college129.acceptanceRate = @"82.5%"; college129.phoneNumber = @"(509) 335-3564"; college129.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Engineering, Health Professions and Related Programs, Communication, Journalism, and Related Programs"; college129.website = @"www.wsu.edu"; college129.isitIvyLeague = @"No"; college129.mascot = @"Washington State University Vancouver Butch T. Cougar"; college129.color = @"Grey, Crimson"; college129.collegeNameCell = college129.name; college129.collegeRankCell = college129.rank; college129.collegePhotoCell = @"200px-Washington_State_U_Seal.png";
    College *college130 = [College new]; college130.name = @"Ohio University "; college130.collegeName = college130.name; college130.rank = @"#130"; college130.imageFile = @"tYNe.jpeg"; college130.sizeofCollegeCampus = @"1,773 acres"; college130.tuition = @"19,180"; college130.numberofStudents = @"21,655"; college130.address = @" 1 Ohio University, Athens, OH 45701"; college130.acceptanceRate = @"86.1%"; college130.phoneNumber = @"(740) 593-1000"; college130.majorPrograms = @"Registered Nursing/Registered Nurse, Speech Communication and Rhetoric, Liberal Arts and Sciences, General Studies and Humanities, Other, Secondary Education and Teaching, Journalism"; college130.website = @"www.ohio.edu"; college130.isitIvyLeague = @"No"; college130.mascot = @" Rufus the Bobcat"; college130.color = @"Green, White"; college130.collegeNameCell = college130.name; college130.collegeRankCell = college130.rank; college130.collegePhotoCell = @"Seal_of_the_Ohio_State_University.png";
    College *college131 = [College new]; college131.name = @"Seton Hall University"; college131.collegeName = college131.name; college131.rank = @"#131"; college131.imageFile = @"287px-Seton_Hall_University_Seal.svg.png"; college131.sizeofCollegeCampus = @"58 acres"; college131.tuition = @"34,750"; college131.numberofStudents = @"5,148"; college131.address = @"400 S Orange Ave, South Orange, NJ 07079"; college131.acceptanceRate = @"85%"; college131.phoneNumber = @" (973) 761-9000"; college131.majorPrograms = @"Registered Nursing/Registered Nurse, Finance, General, Biology/Biological Sciences, General, Criminal Justice/Safety Studies, Humanities/Humanistic Studies        "; college131.website = @"www.shu.edu"; college131.isitIvyLeague = @"No"; college131.mascot = @"Pirate"; college131.color = @"Blue, White"; college131.collegeNameCell = college131.name; college131.collegeRankCell = college131.rank; college131.collegePhotoCell = @"287px-Seton_Hall_University_Seal.svg.png";
    College *college132 = [College new]; college132.name = @"University at Albany, The State University of New York"; college132.collegeName = college132.name; college132.rank = @"#132"; college132.imageFile = @"collinscircle350.jpg"; college132.sizeofCollegeCampus = @" 586 acres"; college132.tuition = @"18,145"; college132.numberofStudents = @"12,779"; college132.address = @"1400 Washington Ave, Albany, NY 12222"; college132.acceptanceRate = @"51.3%"; college132.phoneNumber = @" (518) 442-3300"; college132.majorPrograms = @"Information not available"; college132.website = @"www.albany.edu"; college132.isitIvyLeague = @"No"; college132.mascot = @"Great Dane"; college132.color = @"Purple, Gold"; college132.collegeNameCell = college132.name; college132.collegeRankCell = college132.rank; college132.collegePhotoCell = @"180px-University_at_Albany,_SUNY_Seal.svg.png";
    College *college133 = [College new]; college133.name = @"Colorado State University"; college133.collegeName = college133.name; college133.rank = @"#133"; college133.imageFile = @"CNSNS.jpeg"; college133.sizeofCollegeCampus = @"586 acres"; college133.tuition = @"24,400"; college133.numberofStudents = @"23,261"; college133.address = @"1062 Campus Delivery, Fort Collins, CO 80523"; college133.acceptanceRate = @"75.9%"; college133.phoneNumber = @"(970) 491-1101"; college133.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Family and Consumer Sciences/Human Sciences, Biological and Biomedical Sciences, Communication, Journalism, and Related Programs, Social Sciences"; college133.website = @"www.colostate.edu"; college133.isitIvyLeague = @"No"; college133.mascot = @"Cam the Ram"; college133.color = @" Gold, Dark green"; college133.collegeNameCell = college133.name; college133.collegeRankCell = college133.rank; college133.collegePhotoCell = @"Colorado_State_University_logo.png";
    College *college134 = [College new]; college134.name = @"DePaul University"; college134.collegeName = college134.name; college134.rank = @"#134"; college134.imageFile = @"large_DePaul_University.jpg"; college134.sizeofCollegeCampus = @"36 acres"; college134.tuition = @"32,295"; college134.numberofStudents = @"16,384"; college134.address = @"1 E. Jackson Boulevard, Chicago, IL 60604-2287"; college134.acceptanceRate = @"64.1%"; college134.phoneNumber = @"(312) 362-8000"; college134.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Communication, Journalism, and Related Programs, Liberal Arts and Sciences, General Studies and Humanities, Social Sciences, Computer and Information Sciences and Support Services"; college134.website = @"www.depaul.edu"; college134.isitIvyLeague = @"No"; college134.mascot = @"DIBS"; college134.color = @"Scarlet, Royal blue"; college134.collegeNameCell = college134.name; college134.collegeRankCell = college134.rank; college134.collegePhotoCell = @"VNVNV.jpg";
    College *college135 = [College new]; college135.name = @"Hofstra University"; college135.collegeName = college135.name; college135.rank = @"#135"; college135.imageFile = @"12930.jpg"; college135.sizeofCollegeCampus = @"240 acres"; college135.tuition = @"35,450"; college135.numberofStudents = @"7,183"; college135.address = @"1000 Fulton Ave, Hempstead, NY 11549"; college135.acceptanceRate = @"58.8%"; college135.phoneNumber = @" (516) 463-6600"; college135.majorPrograms = @"Marketing/Marketing Management, General, Psychology, General, Accounting, Business Administration and Management, General, English Language and Literature, General"; college135.website = @"www.hofstra.edu"; college135.isitIvyLeague = @"No"; college135.mascot = @" Kate and Willie Pride"; college135.color = @"Gold, White, Blue"; college135.collegeNameCell = college135.name; college135.collegeRankCell = college135.rank; college135.collegePhotoCell = @"220px-HUSeal.png";
    College *college136 = [College new]; college136.name = @"Louisiana State University--Baton Rouge"; college136.collegeName = college136.name; college136.rank = @"#136"; college136.imageFile = @"117473-004-31BB11A6.jpg"; college136.sizeofCollegeCampus = @"2,000 acres"; college136.tuition = @"19,362"; college136.numberofStudents = @"23,977"; college136.address = @"110 Thomas Boyd, Baton Rouge, LA 70808"; college136.acceptanceRate = @"79.6%"; college136.phoneNumber = @"(225) 578-3202"; college136.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Education, Engineering, Social Sciences, Biological and Biomedical Sciences"; college136.website = @"www.lsu.edu"; college136.isitIvyLeague = @"No"; college136.mascot = @"Mike the Tiger"; college136.color = @"Purple, Gold"; college136.collegeNameCell = college136.name; college136.collegeRankCell = college136.rank; college136.collegePhotoCell = @"LSU_Seal.PNG";
    College *college137 = [College new]; college137.name = @"University of Arkansas "; college137.collegeName = college137.name; college137.rank = @"#137"; college137.imageFile = @"BIQAHNOG.jpeg"; college137.sizeofCollegeCampus = @"425 acres"; college137.tuition = @"18,434"; college137.numberofStudents = @"19,027"; college137.address = @"1125 W Maple St, Fayetteville, AR 72701"; college137.acceptanceRate = @"60.9%"; college137.phoneNumber = @"(479) 575-2000"; college137.majorPrograms = @"Information not available"; college137.website = @"www.uark.edu"; college137.isitIvyLeague = @"No"; college137.mascot = @"Tusk"; college137.color = @"Cardinal, White"; college137.collegeNameCell = college137.name; college137.collegeRankCell = college137.rank; college137.collegePhotoCell = @"SNCNVV.jpeg";
    College *college138 = [College new]; college138.name = @"Arizona State University "; college138.collegeName = college138.name; college138.rank = @"#138"; college138.imageFile = @"VNVNV.jpeg"; college138.sizeofCollegeCampus = @"1,966 acres"; college138.tuition = @"22,977"; college138.numberofStudents = @"58,404"; college138.address = @"4701 W Thunderbird Rd, Glendale, AZ 85306"; college138.acceptanceRate = @"88.9%"; college138.phoneNumber = @"(602) 543-5500"; college138.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Education, Multi/Interdisciplinary Studies, Social Sciences, Communication, Journalism, and Related Programs"; college138.website = @"www.asu.edu"; college138.isitIvyLeague = @"No"; college138.mascot = @"Sparky"; college138.color = @"Gold, Maroon"; college138.collegeNameCell = college138.name; college138.collegeRankCell = college138.rank; college138.collegePhotoCell = @"200px-Arizona_State_University_seal.svg.png";
    College *college139 = [College new]; college139.name = @"George Mason University "; college139.collegeName = college139.name; college139.rank = @"#139"; college139.imageFile = @"VirtualCampus02.jpg"; college139.sizeofCollegeCampus = @"806 acres"; college139.tuition = @"27,764"; college139.numberofStudents = @"20,782"; college139.address = @"4400 University Dr, Fairfax, VA 22030"; college139.acceptanceRate = @"52.8%"; college139.phoneNumber = @" (703) 993-1000"; college139.majorPrograms = @"Psychology, General, Communication, General, Accounting, Biology/Biological Sciences, General, Business Administration and Management, General"; college139.website = @"www.gmu.edu"; college139.isitIvyLeague = @"No"; college139.mascot = @"The Patriot"; college139.color = @"Gold, Green"; college139.collegeNameCell = college139.name; college139.collegeRankCell = college139.rank; college139.collegePhotoCell = @"gmu-seal.gif";
    College *college140 = [College new]; college140.name = @"Kansas State University"; college140.collegeName = college140.name; college140.rank = @"#140"; college140.imageFile = @"KSU Anderson Hall.jpg"; college140.sizeofCollegeCampus = @"664 acres"; college140.tuition = @"19,123"; college140.numberofStudents = @"19,385"; college140.address = @"119 Anderson Hall, Manhattan, KS 66506"; college140.acceptanceRate = @"98.9%"; college140.phoneNumber = @"(785) 532-6011"; college140.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Agriculture, Agriculture Operations, and Related Sciences, Social Sciences, Education, Engineering"; college140.website = @"www.k-state.edu"; college140.isitIvyLeague = @"No"; college140.mascot = @"Willie the Wildcat"; college140.color = @"Royal Purple"; college140.collegeNameCell = college140.name; college140.collegeRankCell = college140.rank; college140.collegePhotoCell = @"220px-Kansas_State_University_seal.png";
    College *college141 = [College new]; college141.name = @"New Jersey Institute of Technology "; college141.collegeName = college141.name; college141.rank = @"#141"; college141.imageFile = @"POop.jpeg"; college141.sizeofCollegeCampus = @"48 acres"; college141.tuition = @"27,140"; college141.numberofStudents = @"6,604"; college141.address = @" 323 Martin Luther KIng Jr.Blvd, Newark, NJ 07103"; college141.acceptanceRate = @"68.5%"; college141.phoneNumber = @"(973) 596-3000"; college141.majorPrograms = @"Information not available"; college141.website = @"www.njit.edu"; college141.isitIvyLeague = @"No"; college141.mascot = @"Highlander"; college141.color = @"Black, White, Red"; college141.collegeNameCell = college141.name; college141.collegeRankCell = college141.rank; college141.collegePhotoCell = @"WGOO.jpeg";
    College *college142 = [College new]; college142.name = @"Oklahoma State University "; college142.collegeName = college142.name; college142.rank = @"#142"; college142.imageFile = @"220px-Edmon_Low_Library_-_Oklahoma_State_University.jpg"; college142.sizeofCollegeCampus = @"1,489 acres"; college142.tuition = @"19,457"; college142.numberofStudents = @"19,009"; college142.address = @" 1111 W 17th St, Tulsa, OK 74107"; college142.acceptanceRate = @"81.7%"; college142.phoneNumber = @"(405) 744-5000"; college142.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Agriculture, Agriculture Operations, and Related Sciences, Engineering, Family and Consumer Sciences/Human Sciences, Education"; college142.website = @"www.okstate.edu"; college142.isitIvyLeague = @"No"; college142.mascot = @"Pistol Pete"; college142.color = @"Orange, Black"; college142.collegeNameCell = college142.name; college142.collegeRankCell = college142.rank; college142.collegePhotoCell = @"232hr29hr.jpeg";
    College *college143 = [College new]; college143.name = @"Oregon State University"; college143.collegeName = college143.name; college143.rank = @"#143"; college143.imageFile = @"FJFJFJJ.jpeg"; college143.sizeofCollegeCampus = @"577 acres"; college143.tuition = @"22,212"; college143.numberofStudents = @"20,621"; college143.address = @"1500 SW Jefferson Way, Corvallis, OR 97331"; college143.acceptanceRate = @"77.7%"; college143.phoneNumber = @"(541) 737-1000"; college143.majorPrograms = @"Business Administration and Management, General, Human Development and Family Studies, General, Liberal Arts and Sciences/Liberal Studies, Health and Physical Education/Fitness, General, Natural Sciences                                    "; college143.website = @"www.oregonstate.edu"; college143.isitIvyLeague = @"No"; college143.mascot = @"Benny Beaver"; college143.color = @"Black, Orange"; college143.collegeNameCell = college143.name; college143.collegeRankCell = college143.rank; college143.collegePhotoCell = @"VBVCJBCJ.jpeg";
    College *college144 = [College new]; college144.name = @"Polytechnic Institute of New York University"; college144.collegeName = college144.name; college144.rank = @"#144"; college144.imageFile = @"IGJWGJWGWO.jpeg"; college144.sizeofCollegeCampus = @"3 acres"; college144.tuition = @"39,566"; college144.numberofStudents = @"1,939"; college144.address = @"6 Metrotech Center, Brooklyn, NY 11201"; college144.acceptanceRate = @"68.2%"; college144.phoneNumber = @"(718) 260-3600"; college144.majorPrograms = @"Electrical and Electronics Engineering, Civil Engineering, General, Engineering/Industrial Management, Chemical Engineering, Mechanical Engineering"; college144.website = @"www.poly.edu"; college144.isitIvyLeague = @"No"; college144.mascot = @"Fighting Blue Jays"; college144.color = @"Purple, Green"; college144.collegeNameCell = college144.name; college144.collegeRankCell = college144.rank; college144.collegePhotoCell = @"safe_image.php.jpeg";
    College *college145 = [College new]; college145.name = @"University of Cincinnati "; college145.collegeName = college145.name; college145.rank = @"#145"; college145.imageFile = @"college-photo_13736._445x280-zmm.jpg"; college145.sizeofCollegeCampus = @"194 acres"; college145.tuition = @"25,816"; college145.numberofStudents = @"21,878"; college145.address = @"2600 Clifton Ave, Cincinnati, OH 45221"; college145.acceptanceRate = @"64.8%"; college145.phoneNumber = @"(513) 556-6000"; college145.majorPrograms = @"Information not available"; college145.website = @"www.uc.edu"; college145.isitIvyLeague = @"No"; college145.mascot = @"Bearcat"; college145.color = @"Red, Black"; college145.collegeNameCell = college145.name; college145.collegeRankCell = college145.rank; college145.collegePhotoCell = @"BMBMBMBMBM.jpeg";
    College *college146 = [College new]; college146.name = @"South Carolina State University"; college146.collegeName = college146.name; college146.rank = @"#146"; college146.imageFile = @"633062188779493750_shm-courtyard.jpg"; college146.sizeofCollegeCampus = @"160 acres"; college146.tuition = @"18,170"; college146.numberofStudents = @"3,744"; college146.address = @"300 College Street NE, Orangeburg, South Carolina 29115"; college146.acceptanceRate = @"95.8%"; college146.phoneNumber = @"(803) 536-7000"; college146.majorPrograms = @"Biology/Biological Sciences, General, Family and Consumer Sciences/Human Sciences, General, Criminal Justice/Law Enforcement Administration, Psychology, General, Social Work"; college146.website = @"www.scsu.edu"; college146.isitIvyLeague = @"No"; college146.mascot = @"South Carolina State University Bulldog"; college146.color = @" Blue, Garnet"; college146.collegeNameCell = college146.name; college146.collegeRankCell = college146.rank; college146.collegePhotoCell = @"SHBNJER.jpeg";
    College *college147 = [College new]; college147.name = @"St. John's University "; college147.collegeName = college147.name; college147.rank = @"#147"; college147.imageFile = @"St._Johns_University_Law_School_in_Queens_New_York_1.jpg"; college147.sizeofCollegeCampus = @"97 acres"; college147.tuition = @"35,520"; college147.numberofStudents = @"15,766"; college147.address = @" 8000 Utopia Pkwy, Queens, NY 11439"; college147.acceptanceRate = @"49.1%"; college147.phoneNumber = @"(718) 990-6161"; college147.majorPrograms = @"Information not available"; college147.website = @"www.stjohns.edu"; college147.isitIvyLeague = @"No"; college147.mascot = @"Red Storm"; college147.color = @"Red, White"; college147.collegeNameCell = college147.name; college147.collegeRankCell = college147.rank; college147.collegePhotoCell = @"St._John's_University_(New_York)_seal.png";
    College *college148 = [College new]; college148.name = @"University of Illinois--Chicago "; college148.collegeName = college148.name; college148.rank = @"#148"; college148.imageFile = @"BIDDNFDOB.jpeg"; college148.sizeofCollegeCampus = @"240 acres"; college148.tuition = @"25,440"; college148.numberofStudents = @"16,925"; college148.address = @"700 S Halsted St #2029, Chicago, IL 60607"; college148.acceptanceRate = @"62.8%"; college148.phoneNumber = @"(312) 996-7000"; college148.majorPrograms = @"Information not available"; college148.website = @"www.uic.edu"; college148.isitIvyLeague = @"No"; college148.mascot = @"Sparky D. Dragon"; college148.color = @"Indigo, Red"; college148.collegeNameCell = college148.name; college148.collegeRankCell = college148.rank; college148.collegePhotoCell = @"sCSICSICS.jpeg";
    College *college149 = [College new]; college149.name = @"University of Rhode Island"; college149.collegeName = college149.name; college149.rank = @"#149"; college149.imageFile = @"tumblr_l32xftyQfB1qand6ro1_400.jpg"; college149.sizeofCollegeCampus = @"1,245 acres"; college149.tuition = @"27,454"; college149.numberofStudents = @"13,219"; college149.address = @"35 Campus Ave, Kingston, RI 02881"; college149.acceptanceRate = @"76%"; college149.phoneNumber = @"(401) 874-1000"; college149.majorPrograms = @"Registered Nursing/Registered Nurse, Speech Communication and Rhetoric, Psychology, General, Accounting, Physical Education Teaching and Coaching"; college149.website = @"www.uri.edu"; college149.isitIvyLeague = @"No"; college149.mascot = @" Rhody the Ram"; college149.color = @"Columbia blue, White, Dark blue"; college149.collegeNameCell = college149.name; college149.collegeRankCell = college149.rank; college149.collegePhotoCell = @"Uriseal.png";
    College *college150 = [College new]; college150.name = @"St. John Fisher College "; college150.collegeName = college150.name; college150.rank = @"#150"; college150.imageFile = @"VOJBOOJAA.jpeg"; college150.sizeofCollegeCampus = @"154 acres"; college150.tuition = @"27,370"; college150.numberofStudents = @"2,871"; college150.address = @"3690 East Ave, Rochester, NY 14618"; college150.acceptanceRate = @"66.5%"; college150.phoneNumber = @" (585) 385-8000"; college150.majorPrograms = @"Information not available"; college150.website = @"www.sjfc.edu"; college150.isitIvyLeague = @"No"; college150.mascot = @"Saint John Fisher College Cardinal"; college150.color = @"Cardinal, Gold"; college150.collegeNameCell = college150.name; college150.collegeRankCell = college150.rank; college150.collegePhotoCell = @"Saint_John_Fisher_College.gif";
    College *college151 = [College new]; college151.name = @"University of Alabama-- Birmingham "; college151.collegeName = college151.name; college151.rank = @"#151"; college151.imageFile = @"university-of-alabama-birmingham.jpg"; college151.sizeofCollegeCampus = @"323 acres"; college151.tuition = @"17,730"; college151.numberofStudents = @"11,128"; college151.address = @"1530 Third Avenue S Birmingham, AL 35294"; college151.acceptanceRate = @"72.2%"; college151.phoneNumber = @" (205) 934-4011"; college151.majorPrograms = @"Information not available"; college151.website = @"www.uab.edu"; college151.isitIvyLeague = @"No"; college151.mascot = @" Blaze the Dragon"; college151.color = @"Gold, Green, White"; college151.collegeNameCell = college151.name; college151.collegeRankCell = college151.rank; college151.collegePhotoCell = @"University_of_Alabama_at_Birmingham_seal.png";
    College *college152 = [College new]; college152.name = @"University of Mississippi"; college152.collegeName = college152.name; college152.rank = @"#152"; college152.imageFile = @"275px-Olemisslyceum.jpg"; college152.sizeofCollegeCampus = @"2,500 acres"; college152.tuition = @"16,266"; college152.numberofStudents = @"15,346"; college152.address = @"PO Box 1848 University, MS 38677-1848"; college152.acceptanceRate = @"79%"; college152.phoneNumber = @"(662) 915-7211"; college152.majorPrograms = @"Elementary Education and Teaching, Marketing/Marketing Management, General, Finance, General, Pharmacy, Pharmaceutical Sciences, and Administration, Other, Business Administration and Management, General                                    "; college152.website = @"www.olemiss.edu"; college152.isitIvyLeague = @"No"; college152.mascot = @"Rebel Black Bear"; college152.color = @"Crimson, Yale Blue"; college152.collegeNameCell = college152.name; college152.collegeRankCell = college152.rank; college152.collegePhotoCell = @"VLVOBVLOBL.jpeg";
    College *college153 = [College new]; college153.name = @"University of Texas--Dallas"; college153.collegeName = college153.name; college153.rank = @"#153"; college153.imageFile = @"VNBOOALOF.jpeg"; college153.sizeofCollegeCampus = @"500 acres"; college153.tuition = @"28,194"; college153.numberofStudents = @"18,864"; college153.address = @"800 W Campbell Rd, Richardson, TX 75080"; college153.acceptanceRate = @"53%"; college153.phoneNumber = @"(972) 883-2111"; college153.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Biological and Biomedical Sciences, Multi/Interdisciplinary Studies, Psychology, Social Sciences"; college153.website = @"www.utdallas.edu"; college153.isitIvyLeague = @"No"; college153.mascot = @"Temoc"; college153.color = @"Orange, Green"; college153.collegeNameCell = college153.name; college153.collegeRankCell = college153.rank; college153.collegePhotoCell = @"seal.jpeg";
    College *college154 = [College new]; college154.name = @"Adelphi University"; college154.collegeName = college154.name; college154.rank = @"#154"; college154.imageFile = @"adelphi-university.jpg"; college154.sizeofCollegeCampus = @"75 acres"; college154.tuition = @"29,320"; college154.numberofStudents = @"5,021"; college154.address = @"154 Cambridge Ave, Garden City, NY 11530"; college154.acceptanceRate = @"69%"; college154.phoneNumber = @"(800) 233-5744"; college154.majorPrograms = @"Health Professions and Related Programs, Business, Management, Marketing, and Related Support Services, Social Sciences, Psychology, Education"; college154.website = @""; college154.isitIvyLeague = @"No"; college154.mascot = @"Panther"; college154.color = @"Gold, Brown"; college154.collegeNameCell = college154.name; college154.collegeRankCell = college154.rank; college154.collegePhotoCell = @"Adelphi_University_Seal.svg.png";
    College *college155 = [College new]; college155.name = @"Illinois State University "; college155.collegeName = college155.name; college155.rank = @"#155"; college155.imageFile = @"COKCOKOAA.jpeg"; college155.sizeofCollegeCampus = @"490 acres"; college155.tuition = @"20,016"; college155.numberofStudents = @"18,594"; college155.address = @"Campus Box 2200 Normal, IL 61790-2200"; college155.acceptanceRate = @"63.4%"; college155.phoneNumber = @"(309) 438-2111"; college155.majorPrograms = @"Education, Business, Management, Marketing, and Related Support Services, Health Professions and Related Programs, Social Sciences, Communication, Journalism, and Related Programs"; college155.website = @"illinoisstate.edu"; college155.isitIvyLeague = @"No"; college155.mascot = @"Reggie Redbird"; college155.color = @"Red, White"; college155.collegeNameCell = college155.name; college155.collegeRankCell = college155.rank; college155.collegePhotoCell = @"CCINCICA.jpeg";
    College *college156 = [College new]; college156.name = @"University of Hawaii--Manoa"; college156.collegeName = college156.name; college156.rank = @"#156"; college156.imageFile = @"VACOAA.jpeg"; college156.sizeofCollegeCampus = @"320 acres"; college156.tuition = @"25,652"; college156.numberofStudents = @"25,652"; college156.address = @"2500 Campus Road Honolulu, HI 96822"; college156.acceptanceRate = @"78.4%"; college156.phoneNumber = @"(808) 956-8111"; college156.majorPrograms = @"Psychology, Accounting, Accounting and Finance, Pre-Nursing Studies"; college156.website = @"manoa.hawaii.edu"; college156.isitIvyLeague = @"No"; college156.mascot = @"No Mascot"; college156.color = @"Green, Black, White"; college156.collegeNameCell = college156.name; college156.collegeRankCell = college156.rank; college156.collegePhotoCell = @"55749414.jpeg";
    College *college157 = [College new]; college157.name = @"University of Maine"; college157.collegeName = college157.name; college157.rank = @"#157"; college157.imageFile = @"AOOOJWOF.jpeg"; college157.sizeofCollegeCampus = @"660 acres"; college157.tuition = @"27,454"; college157.numberofStudents = @"8,911"; college157.address = @"168 College Avenue Orono, ME 04469"; college157.acceptanceRate = @"77.7%"; college157.phoneNumber = @"(207) 581-1110"; college157.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Engineering, Education, Health Professions and Related Programs, Biological and Biomedical Sciences"; college157.website = @"www.umaine.edu"; college157.isitIvyLeague = @"No"; college157.mascot = @"Bananas the Bear"; college157.color = @"Blue, White"; college157.collegeNameCell = college157.name; college157.collegeRankCell = college157.rank; college157.collegePhotoCell = @"VOBOJSA.jpeg";
    College *college158 = [College new]; college158.name = @"University of Wyoming"; college158.collegeName = college158.name; college158.rank = @"#158"; college158.imageFile = @"THTHW.jpeg"; college158.sizeofCollegeCampus = @"785 acres"; college158.tuition = @"13,428"; college158.numberofStudents = @"10,163"; college158.address = @"1000 E. University Avenue Laramie, WY 82071"; college158.acceptanceRate = @"96%"; college158.phoneNumber = @"(307) 766-1121"; college158.majorPrograms = @"Registered Nursing/Registered Nurse, Elementary Education and Teaching, Business Administration and Management, General, Psychology, General, Speech Communication and Rhetoric"; college158.website = @"www.uwyo.edu"; college158.isitIvyLeague = @"No"; college158.mascot = @"Pistol Pete, Cowboy Joe"; college158.color = @"Brown, Gold"; college158.collegeNameCell = college158.name; college158.collegeRankCell = college158.rank; college158.collegePhotoCell = @"HQAH.jpeg";
    College *college159 = [College new]; college159.name = @"Florida Institute of Technology"; college159.collegeName = college159.name; college159.rank = @"#159"; college159.imageFile = @"AJBOOBFBOJAB.jpeg"; college159.sizeofCollegeCampus = @"130 acres"; college159.tuition = @"34,710"; college159.numberofStudents = @"2,724"; college159.address = @"150 W. University Boulevard Melbourne, FL 32901-6975"; college159.acceptanceRate = @"57.4%"; college159.phoneNumber = @"(321) 674-8000"; college159.majorPrograms = @"Aerospace, Aeronautical and Astronautical/Space Engineering, Mechanical Engineering, Electrical and Electronics Engineering, Civil Engineering, General, Marine Biology and Biological Oceanography"; college159.website = @"www.fit.edu"; college159.isitIvyLeague = @"No"; college159.mascot = @"Florida panther"; college159.color = @"Grey, Crimson"; college159.collegeNameCell = college159.name; college159.collegeRankCell = college159.rank; college159.collegePhotoCell = @"SOAOGG.jpeg";
    College *college160 = [College new]; college160.name = @"Maryville University of St. Louis"; college160.collegeName = college160.name; college160.rank = @"#160"; college160.imageFile = @"OAJBGOJBHJOBH.jpeg"; college160.sizeofCollegeCampus = @"130 acres"; college160.tuition = @"23,746"; college160.numberofStudents = @"3,035"; college160.address = @"650 Maryville University Drive St Louis, MO 63141-7299"; college160.acceptanceRate = @"67.4%"; college160.phoneNumber = @"(800) 627-9855"; college160.majorPrograms = @"Registered Nursing/Registered Nurse, Accounting, Business/Commerce, General, Health Professions and Related Clinical Sciences, Other, Psychology, General                             "; college160.website = @"www.maryville.edu"; college160.isitIvyLeague = @"No"; college160.mascot = @"No Mascot"; college160.color = @"No Colors"; college160.collegeNameCell = college160.name; college160.collegeRankCell = college160.rank; college160.collegePhotoCell = @"SFDSFSFOA.jpeg";
    College *college161 = [College new]; college161.name = @"Mississippi State University"; college161.collegeName = college161.name; college161.rank = @"#161"; college161.imageFile = @"dsfds.jpeg"; college161.sizeofCollegeCampus = @"4,200 acres"; college161.tuition = @"15,828"; college161.numberofStudents = @"16,312"; college161.address = @"PO Box 6018 Mississippi State, MS 39762"; college161.acceptanceRate = @"67.8%"; college161.phoneNumber = @" (662) 325-2323"; college161.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Education, Engineering, Multi/Interdisciplinary Studies, Agriculture, Agriculture Operations, and Related Sciences                                    "; college161.website = @"www.msstate.edu"; college161.isitIvyLeague = @"No"; college161.mascot = @"Bully Bulldog"; college161.color = @"White, Maroon"; college161.collegeNameCell = college161.name; college161.collegeRankCell = college161.rank; college161.collegePhotoCell = @"wgw.jpeg";
    College *college162 = [College new]; college162.name = @"University of Louisville "; college162.collegeName = college162.name; college162.rank = @"#162"; college162.imageFile = @"isdofda.jpeg"; college162.sizeofCollegeCampus = @"345 acres"; college162.tuition = @"21,650"; college162.numberofStudents = @"15,597"; college162.address = @"2301 S. Third Street Louisville, KY 40292"; college162.acceptanceRate = @"72.7%"; college162.phoneNumber = @"(502) 852-5555"; college162.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Engineering, Education, Parks, Recreation, Leisure, and Fitness Studies, Health Professions and Related Programs"; college162.website = @"louisville.edu"; college162.isitIvyLeague = @"No"; college162.mascot = @"Cardinal Bird"; college162.color = @"Red, Black"; college162.collegeNameCell = college162.name; college162.collegeRankCell = college162.rank; college162.collegePhotoCell = @"gaPGA.jpeg";
    College *college163 = [College new]; college163.name = @"University of Maryland--Baltimore County"; college163.collegeName = college163.name; college163.rank = @"#163"; college163.imageFile = @"bgadkbfabd.jpeg"; college163.sizeofCollegeCampus = @" 530 acres"; college163.tuition = @"20,825"; college163.numberofStudents = @"10,573"; college163.address = @"1000 Hilltop Circle Baltimore, MD 21250"; college163.acceptanceRate = @"60.8%"; college163.phoneNumber = @"(410) 455-1000"; college163.majorPrograms = @"Social Sciences, Biological and Biomedical Sciences, Computer and Information Sciences and Support Services, Psychology, Visual and Performing Arts"; college163.website = @"www.umbc.edu"; college163.isitIvyLeague = @"No"; college163.mascot = @"True Grit"; college163.color = @"Black, Gold"; college163.collegeNameCell = college163.name; college163.collegeRankCell = college163.rank; college163.collegePhotoCell = @"sela.jpeg";
    College *college164 = [College new]; college164.name = @"San Diego State University"; college164.collegeName = college164.name; college164.rank = @"#164"; college164.imageFile = @"bmdfabdd.jpeg"; college164.sizeofCollegeCampus = @"283 acres"; college164.tuition = @"18,236"; college164.numberofStudents = @"26,371"; college164.address = @"5500 Campanile Drive San Diego, CA 92182-7455"; college164.acceptanceRate = @"32.9%"; college164.phoneNumber = @"(619) 594-5200"; college164.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Psychology, English Language and Literature/Letters, Health Professions and Related Programs"; college164.website = @"www.sdsu.edu"; college164.isitIvyLeague = @"No"; college164.mascot = @"Monty - Montezuma"; college164.color = @"Black, Scarlet, Gold"; college164.collegeNameCell = college164.name; college164.collegeRankCell = college164.rank; college164.collegePhotoCell = @"sdfkjiasgfj.jpeg";
    College *college165 = [College new]; college165.name = @"Texas Tech University"; college165.collegeName = college165.name; college165.rank = @"#165"; college165.imageFile = @"dbffmdabmdba.jpeg"; college165.sizeofCollegeCampus = @"1,839 acres"; college165.tuition = @"18,155"; college165.numberofStudents = @"26,063"; college165.address = @"Box 45005 Lubbock, TX 79409"; college165.acceptanceRate = @"66.3%"; college165.phoneNumber = @"(806) 742-2011"; college165.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Engineering, Family and Consumer Sciences/Human Sciences, Communication, Journalism, and Related Programs, Social Sciences"; college165.website = @"www.ttu.edu"; college165.isitIvyLeague = @"No"; college165.mascot = @"The Masked Rider, Raider Red"; college165.color = @"Black, Scarlet"; college165.collegeNameCell = college165.name; college165.collegeRankCell = college165.rank; college165.collegePhotoCell = @"bfaoiboabodf.jpeg";
    College *college166 = [College new]; college166.name = @"University of Idaho "; college166.collegeName = college166.name; college166.rank = @"#166"; college166.imageFile = @"bdfamda.jpeg"; college166.sizeofCollegeCampus = @"1,450 acres"; college166.tuition = @"19,000"; college166.numberofStudents = @"9,586"; college166.address = @"875 Perimeter Drive, PO Box 442282 Moscow, ID 83844-2282"; college166.acceptanceRate = @"60.9%"; college166.phoneNumber = @"(208) 885-6111"; college166.majorPrograms = @"Psychology, General, Mechanical Engineering, Foreign Languages and Literatures, General, Marketing/Marketing Management, General, Secondary Education and Teaching"; college166.website = @"www.uidaho.edu"; college166.isitIvyLeague = @"No"; college166.mascot = @"Joe Vandal"; college166.color = @" Silver, Vandal Gold"; college166.collegeNameCell = college166.name; college166.collegeRankCell = college166.rank; college166.collegePhotoCell = @"sdFMAAS.jpeg";
    College *college167 = [College new]; college167.name = @"University of La Verne"; college167.collegeName = college167.name; college167.rank = @"#167"; college167.imageFile = @"banfdbdad.jpeg"; college167.sizeofCollegeCampus = @"38 acres"; college167.tuition = @"33,350"; college167.numberofStudents = @"2,172"; college167.address = @"1950 Third Street La Verne, CA 91750"; college167.acceptanceRate = @"39.9%"; college167.phoneNumber = @"(909) 593-3511"; college167.majorPrograms = @"Business Administration and Management, General, Entrepreneurship/Entrepreneurial Studies, Liberal Arts and Sciences/Liberal Studies, Child Development, Psychology, General                                    "; college167.website = @"laverne.edu"; college167.isitIvyLeague = @"No"; college167.mascot = @"Leo's"; college167.color = @"No Colors"; college167.collegeNameCell = college167.name; college167.collegeRankCell = college167.rank; college167.collegePhotoCell = @"badnkdab.jpeg";
    College *college168 = [College new]; college168.name = @"West Virginia University"; college168.collegeName = college168.name; college168.rank = @"#168"; college168.imageFile = @"dfpbafdab.jpeg"; college168.sizeofCollegeCampus = @"1,456 acres"; college168.tuition = @"18,868"; college168.numberofStudents = @"22,711"; college168.address = @"PO Box 6201 Morgantown, WV 26506-6201"; college168.acceptanceRate = @"84.8%"; college168.phoneNumber = @"(304) 293-0111"; college168.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Engineering, Multi/Interdisciplinary Studies, Communication, Journalism, and Related Programs, Health Professions and Related Programs"; college168.website = @"www.wvu.edu"; college168.isitIvyLeague = @"No"; college168.mascot = @"The Mountaineer"; college168.color = @" Blue, Old gold"; college168.collegeNameCell = college168.name; college168.collegeRankCell = college168.rank; college168.collegePhotoCell = @"dbnldfbd.jpeg";
    College *college169 = [College new]; college169.name = @"University of Massachusetts--Lowell"; college169.collegeName = college169.name; college169.rank = @"#169"; college169.imageFile = @"dfbnadbdbda.jpeg"; college169.sizeofCollegeCampus = @"135 acres"; college169.tuition = @"18,965"; college169.numberofStudents = @"11,729"; college169.address = @"1 University Avenue Lowell, MA 01854"; college169.acceptanceRate = @"65%"; college169.phoneNumber = @" (978) 934-4000"; college169.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Engineering, Homeland Security, Law Enforcement, Firefighting and Related Protective Services, Health Professions and Related Programs, Computer and Information Sciences and Support Services"; college169.website = @"www.uml.edu"; college169.isitIvyLeague = @"No"; college169.mascot = @"Rowdy the River Hawk"; college169.color = @"White, Blue, Persian red"; college169.collegeNameCell = college169.name; college169.collegeRankCell = college169.rank; college169.collegePhotoCell = @"dabpod.jpeg";
    College *college170 = [College new]; college170.name = @"University of North Dakota"; college170.collegeName = college170.name; college170.rank = @"#170"; college170.imageFile = @"asdfasdf.jpeg"; college170.sizeofCollegeCampus = @"550 acres"; college170.tuition = @"17,170"; college170.numberofStudents = @"11,522"; college170.address = @"University Station Grand Forks, ND 58202"; college170.acceptanceRate = @"70.8%"; college170.phoneNumber = @"(800) 225-5863"; college170.majorPrograms = @"Airline/Commercial/Professional Pilot and Flight Crew, Registered Nursing/Registered Nurse, Air Traffic Controller, Psychology, General, General Studies        "; college170.website = @"und.edu"; college170.isitIvyLeague = @"No"; college170.mascot = @"No Mascot"; college170.color = @"White, Black, Green"; college170.collegeNameCell = college170.name; college170.collegeRankCell = college170.rank; college170.collegePhotoCell = @"bfabdfbab.jpeg";
    College *college171 = [College new]; college171.name = @"University of South Florida"; college171.collegeName = college171.name; college171.rank = @"#171"; college171.imageFile = @"asdfas.jpeg"; college171.sizeofCollegeCampus = @"1,561 acres"; college171.tuition = @"14,994"; college171.numberofStudents = @"29,975"; college171.address = @"4202 E. Fowler Avenue Tampa, FL 33620-9951"; college171.acceptanceRate = @"38%"; college171.phoneNumber = @"(813) 974-2011"; college171.majorPrograms = @"Finance, General, Criminology, Biomedical Sciences, General, Psychology, General, Elementary Education and Teaching"; college171.website = @"www.usf.edu"; college171.isitIvyLeague = @"No"; college171.mascot = @"Rocky D. Bull"; college171.color = @"Green, gold"; college171.collegeNameCell = college171.name; college171.collegeRankCell = college171.rank; college171.collegePhotoCell = @"asdf.jpeg";
    College *college172 = [College new]; college172.name = @"Virginia Commonwealth University"; college172.collegeName = college172.name; college172.rank = @"#172"; college172.imageFile = @"dohgosdoshag.jpeg"; college172.sizeofCollegeCampus = @"143 acres"; college172.tuition = @"23,300"; college172.numberofStudents = @"23,754"; college172.address = @"Box 842527 Richmond, VA 23284"; college172.acceptanceRate = @"65.7%"; college172.phoneNumber = @"(804) 828-0100"; college172.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Visual and Performing Arts, Health Professions and Related Programs, Homeland Security, Law Enforcement, Firefighting and Related Protective Services, Psychology"; college172.website = @"www.vcu.edu"; college172.isitIvyLeague = @"No"; college172.mascot = @"Rodney the Ram"; college172.color = @"Black, gold"; college172.collegeNameCell = college172.name; college172.collegeRankCell = college172.rank; college172.collegePhotoCell = @"adhgihosdgji.jpeg";
    College *college173 = [College new]; college173.name = @"Biola University"; college173.collegeName = college173.name; college173.rank = @"#173"; college173.imageFile = @"asdolkgdasg.jpeg"; college173.sizeofCollegeCampus = @" 95 acres"; college173.tuition = @"31,004"; college173.numberofStudents = @"4,271"; college173.address = @"13800 Biola Avenue La Mirada, CA 90639-0001"; college173.acceptanceRate = @"76.4%"; college173.phoneNumber = @"(562) 903-6000"; college173.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Visual and Performing Arts, Theology and Religious Vocations, Psychology, Social Sciences"; college173.website = @"www.biola.edu"; college173.isitIvyLeague = @"No"; college173.mascot = @"Biola Eagle"; college173.color = @"White, Red"; college173.collegeNameCell = college173.name; college173.collegeRankCell = college173.rank; college173.collegePhotoCell = @"ashdihgoais.jpeg";
    College *college174 = [College new]; college174.name = @"Pace University"; college174.collegeName = college174.name; college174.rank = @"#174"; college174.imageFile = @"asdlfdjasf.jpeg"; college174.sizeofCollegeCampus = @"257 acres"; college174.tuition = @"36,504"; college174.numberofStudents = @"8,025"; college174.address = @"1 Pace Plaza New York, NY 10038"; college174.acceptanceRate = @"73.8%"; college174.phoneNumber = @"(212) 346-1200"; college174.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Communication, Journalism, and Related Programs, Health Professions and Related Programs, Psychology, Visual and Performing Arts"; college174.website = @"www.pace.edu"; college174.isitIvyLeague = @"No"; college174.mascot = @" Pace University Setter"; college174.color = @"No Colors"; college174.collegeNameCell = college174.name; college174.collegeRankCell = college174.rank; college174.collegePhotoCell = @"ahofdshaf.jpeg";
    College *college175 = [College new]; college175.name = @"St. Mary's University of Minnesota"; college175.collegeName = college175.name; college175.rank = @"#175"; college175.imageFile = @"ansdlknfdlasf.jpeg"; college175.sizeofCollegeCampus = @"350 acres"; college175.tuition = @"28,320"; college175.numberofStudents = @"2,061"; college175.address = @"700 Terrace Heights Winona, MN 55987-1399"; college175.acceptanceRate = @"71.9%"; college175.phoneNumber = @"(507) 452-4430"; college175.majorPrograms = @"Business/Commerce, General, Accounting, Marketing/Marketing Management, General, Criminal Justice/Police Science, Human Resources Management/Personnel Administration, General"; college175.website = @"www.smumn.edu"; college175.isitIvyLeague = @"No"; college175.mascot = @"Big Red Cardinal"; college175.color = @"No Colors"; college175.collegeNameCell = college175.name; college175.collegeRankCell = college175.rank; college175.collegePhotoCell = @"slkdflasfdhf.jpeg";
    College *college176 = [College new]; college176.name = @"University of Central Florida "; college176.collegeName = college176.name; college176.rank = @"#176"; college176.imageFile = @"asdnflnkasdfl.jpeg"; college176.sizeofCollegeCampus = @"1,415 acres"; college176.tuition = @"21,063"; college176.numberofStudents = @"49,900"; college176.address = @"4000 Central Florida Boulevard Orlando, FL 32816"; college176.acceptanceRate = @"45%"; college176.phoneNumber = @"(407) 823-2000"; college176.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Health Professions and Related Programs, Education, Psychology, Multi/Interdisciplinary Studies"; college176.website = @"www.ucf.edu"; college176.isitIvyLeague = @"No"; college176.mascot = @"Knightro"; college176.color = @"Black, Old gold"; college176.collegeNameCell = college176.name; college176.collegeRankCell = college176.rank; college176.collegePhotoCell = @"nskdfskjahsd.jpeg";
    College *college177 = [College new]; college177.name = @"Utah State University "; college177.collegeName = college177.name; college177.rank = @"#177"; college177.imageFile = @"asdofaihsfosdhf.jpeg"; college177.sizeofCollegeCampus = @"450 acres"; college177.tuition = @"17,078"; college177.numberofStudents = @"23,279"; college177.address = @"Old Main Hill Logan, UT 84322"; college177.acceptanceRate = @"96.9%"; college177.phoneNumber = @"(435) 797-1000"; college177.majorPrograms = @"Economics, General, Communication Sciences and Disorders, General, Elementary Education and Teaching, Business Administration and Management, General, Multi-/Interdisciplinary Studies, Other"; college177.website = @"www.usu.edu"; college177.isitIvyLeague = @"No"; college177.mascot = @"Big Blue"; college177.color = @"Aggie Blue, Fighting White"; college177.collegeNameCell = college177.name; college177.collegeRankCell = college177.rank; college177.collegePhotoCell = @"bsdkjfjasjkfdhs.jpeg";
    College *college178 = [College new]; college178.name = @"Azusa Pacific University"; college178.collegeName = college178.name; college178.rank = @"#178"; college178.imageFile = @"sfkjshadfdkjsahfd.jpeg"; college178.sizeofCollegeCampus = @"103 acres"; college178.tuition = @"31,076"; college178.numberofStudents = @"5,998"; college178.address = @"901 E. Alosta Avenue Azusa, CA 91702"; college178.acceptanceRate = @"49.2%"; college178.phoneNumber = @"(626) 969-3434"; college178.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Health Professions and Related Programs, Liberal Arts and Sciences, General Studies and Humanities, Communication, Journalism, and Related Programs, Psychology"; college178.website = @"www.apu.edu"; college178.isitIvyLeague = @"No"; college178.mascot = @"Coug the Cougar"; college178.color = @"Brick, Black"; college178.collegeNameCell = college178.name; college178.collegeRankCell = college178.rank; college178.collegePhotoCell = @"sbdkfbasdkjfd.jpeg";
    College *college179 = [College new]; college179.name = @"Edgewood College "; college179.collegeName = college179.name; college179.rank = @"#179"; college179.imageFile = @"ashkdfasf.jpeg"; college179.sizeofCollegeCampus = @"55 acres"; college179.tuition = @"23,740"; college179.numberofStudents = @"1,951"; college179.address = @"1000 Edgewood College Drive Madison, WI 53711-1997"; college179.acceptanceRate = @"71.9%"; college179.phoneNumber = @"(608) 663-4861"; college179.majorPrograms = @"Registered Nursing/Registered Nurse, Business/Commerce, General, Elementary Education and Teaching, Business Administration and Management, General, Psychology, General"; college179.website = @"www.edgewood.edu"; college179.isitIvyLeague = @"No"; college179.mascot = @"Eddy the Eagle"; college179.color = @"No Colors"; college179.collegeNameCell = college179.name; college179.collegeRankCell = college179.rank; college179.collegePhotoCell = @"asdfklashdofl.jpeg";
    College *college180 = [College new]; college180.name = @"Southern Illinois University--Carbondale "; college180.collegeName = college180.name; college180.rank = @"#180"; college180.imageFile = @"hkasjdhfkjsdf.jpeg"; college180.sizeofCollegeCampus = @"1,136 acres"; college180.tuition = @"22,844"; college180.numberofStudents = @"15,000"; college180.address = @"Undergraduate Admissions, 425 Clocktower Drive Carbondale, IL 62901"; college180.acceptanceRate = @"44.1%"; college180.phoneNumber = @"(618) 453-2121"; college180.majorPrograms = @"Education, Business, Management, Marketing, and Related Support Services, Health Professions and Related Programs, Engineering Technologies and Engineering-Related Fields, Visual and Performing Arts"; college180.website = @"www.siu.edu"; college180.isitIvyLeague = @"No"; college180.mascot = @"Southern Illinois University Carbondale Brown Dawg, Southern Illinois University Carbondale Gray Dawg"; college180.color = @"Maroon, White"; college180.collegeNameCell = college180.name; college180.collegeRankCell = college180.rank; college180.collegePhotoCell = @"skdjfkahsdkf.jpeg";
    College *college181 = [College new]; college181.name = @"University of Missouri--Kansas City "; college181.collegeName = college181.name; college181.rank = @"#181"; college181.imageFile = @"kljsdfashdlf.jpeg"; college181.sizeofCollegeCampus = @"93 acres"; college181.tuition = @"21,754"; college181.numberofStudents = @"10,134"; college181.address = @"5100 Rockhill Road Kansas City, MO 64110"; college181.acceptanceRate = @"69.3%"; college181.phoneNumber = @"(816) 235-1000"; college181.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Health Professions and Related Programs, Liberal Arts and Sciences, General Studies and Humanities, Education, Physical Sciences        "; college181.website = @"www.umkc.edu"; college181.isitIvyLeague = @"No"; college181.mascot = @"Kasey the Kangaroo"; college181.color = @"Blue, Gold"; college181.collegeNameCell = college181.name; college181.collegeRankCell = college181.rank; college181.collegePhotoCell = @"dhnskfhasdf.jpeg";
    College *college182 = [College new]; college182.name = @"University of New Mexico"; college182.collegeName = college182.name; college182.rank = @"#182"; college182.imageFile = @"bhaskdlfhlhfa.jpeg"; college182.sizeofCollegeCampus = @"769 acres"; college182.tuition = @"19,919"; college182.numberofStudents = @"22,643"; college182.address = @"1 University of New Mexico Albuquerque, NM 87131-0001"; college182.acceptanceRate = @"63.9%"; college182.phoneNumber = @"(505) 277-0111"; college182.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Education, Health Professions and Related Programs, Social Sciences, Psychology"; college182.website = @"www.unm.edu"; college182.isitIvyLeague = @"No"; college182.mascot = @"Lobo"; college182.color = @"Silver, Turquoise, White, Cherry Red"; college182.collegeNameCell = college182.name; college182.collegeRankCell = college182.rank; college182.collegePhotoCell = @"kjashdffa.jpeg";
    College *college183 = [College new]; college183.name = @"Ball State University"; college183.collegeName = college183.name; college183.rank = @"#183"; college183.imageFile = @"abhsdfkjdhasf.jpeg"; college183.sizeofCollegeCampus = @"1,140 acres"; college183.tuition = @"23,650"; college183.numberofStudents = @"17,627"; college183.address = @"2000 University Avenue Muncie, IN 47306"; college183.acceptanceRate = @"67.5%"; college183.phoneNumber = @"(765) 289-1241"; college183.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Education, Liberal Arts and Sciences, General Studies and Humanities, Communication, Journalism, and Related Programs, Health Professions and Related Programs"; college183.website = @"cms.bsu.edu"; college183.isitIvyLeague = @"No"; college183.mascot = @"Charlie Cardinal"; college183.color = @"Cardinal, White"; college183.collegeNameCell = college183.name; college183.collegeRankCell = college183.rank; college183.collegePhotoCell = @"hksdkjfadhsf.jpeg";
    College *college184 = [College new]; college184.name = @"Bowling Green State University"; college184.collegeName = college184.name; college184.rank = @"#184"; college184.imageFile = @"ndlkhfads.jpeg"; college184.sizeofCollegeCampus = @"1,338 acres"; college184.tuition = @"17,828"; college184.numberofStudents = @"15,059"; college184.address = @"110 McFall Center Bowling Green, OH 43403"; college184.acceptanceRate = @"75.5%"; college184.phoneNumber = @"(419) 372-2531"; college184.majorPrograms = @"Liberal Arts and Sciences/Liberal Studies, Design and Visual Communications, General, Kindergarten/Preschool Education and Teaching, Sport and Fitness Administration/Management, Teacher Education, Multiple Levels"; college184.website = @"www.bgsu.edu"; college184.isitIvyLeague = @"No"; college184.mascot = @"Freddie Falcon"; college184.color = @"Orange, Brown"; college184.collegeNameCell = college184.name; college184.collegeRankCell = college184.rank; college184.collegePhotoCell = @"sdfkldhs.jpeg";
    College *college185 = [College new]; college185.name = @"North Dakota State University"; college185.collegeName = college185.name; college185.rank = @"#185"; college185.imageFile = @"nsdflhasf.jpeg"; college185.sizeofCollegeCampus = @"258 acres"; college185.tuition = @"17,478"; college185.numberofStudents = @"11,911"; college185.address = @"PO Box 6050 Fargo, ND 58108-6050"; college185.acceptanceRate = @"86%"; college185.phoneNumber = @"(701) 231-8011"; college185.majorPrograms = @"Civil Engineering, General, Environmental Design/Architecture, Human Development and Family Studies, General, Mechanical Engineering, Registered Nursing/Registered Nurse"; college185.website = @"www.ndsu.nodak.edu"; college185.isitIvyLeague = @"No"; college185.mascot = @"Thundar"; college185.color = @"Yellow, Green"; college185.collegeNameCell = college185.name; college185.collegeRankCell = college185.rank; college185.collegePhotoCell = @"jlskdjfas.jpeg";
    College *college186 = [College new]; college186.name = @"University of Alabama--Huntsville "; college186.collegeName = college186.name; college186.rank = @"#186"; college186.imageFile = @"asdfljadhs.jpeg"; college186.sizeofCollegeCampus = @"400 acres"; college186.tuition = @"19,424"; college186.numberofStudents = @"5,935"; college186.address = @"301 Sparkman Drive Huntsville, AL 35899"; college186.acceptanceRate = @"63.7%"; college186.phoneNumber = @"(256) 824-1000"; college186.majorPrograms = @"Engineering, Business, Management, Marketing, and Related Support Services, Health Professions and Related Programs, Biological and Biomedical Sciences, Visual and Performing Arts"; college186.website = @"www.uah.edu"; college186.isitIvyLeague = @"No"; college186.mascot = @"Charger Blue"; college186.color = @"White, Royal blue"; college186.collegeNameCell = college186.name; college186.collegeRankCell = college186.rank; college186.collegePhotoCell = @"kadfskafsdfsf.jpeg";
    College *college187 = [College new]; college187.name = @"University of Houston "; college187.collegeName = college187.name; college187.rank = @"#187"; college187.imageFile = @"sdkfjasf.jpeg"; college187.sizeofCollegeCampus = @"594 acres"; college187.tuition = @"18,601"; college187.numberofStudents = @"31,764"; college187.address = @"4800 Calhoun Road Houston, TX 77204"; college187.acceptanceRate = @"63.6%"; college187.phoneNumber = @"(713) 743-1000"; college187.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Psychology, Social Sciences, Communication, Journalism, and Related Programs, Biological and Biomedical Sciences"; college187.website = @"www.uh.edu"; college187.isitIvyLeague = @"No"; college187.mascot = @"Shasta"; college187.color = @"Scarlet, White"; college187.collegeNameCell = college187.name; college187.collegeRankCell = college187.rank; college187.collegePhotoCell = @"dsfasdfasdf.jpeg";
    College *college188 = [College new]; college188.name = @"Andrews University"; college188.collegeName = college188.name; college188.rank = @"#188"; college188.imageFile = @"asdfsfafasdf.jpeg"; college188.sizeofCollegeCampus = @"300 acres"; college188.tuition = @"24,478"; college188.numberofStudents = @"1,929"; college188.address = @"Berrien Springs, MI 49104"; college188.acceptanceRate = @"36.1%"; college188.phoneNumber = @"(800) 253-2874"; college188.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Education, Engineering Technologies and Engineering-Related Fields, Visual and Performing Arts, Health Professions and Related Programs"; college188.website = @"www.andrews.edu"; college188.isitIvyLeague = @"No"; college188.mascot = @"Andrews University Cardinal"; college188.color = @"No Colors"; college188.collegeNameCell = college188.name; college188.collegeRankCell = college188.rank; college188.collegePhotoCell = @"asdfasfasf.jpeg";
    College *college189 = [College new]; college189.name = @"Ashland University"; college189.collegeName = college189.name; college189.rank = @"#189"; college189.imageFile = @"fdhsfkasdhf.jpeg"; college189.sizeofCollegeCampus = @"150 acres"; college189.tuition = @"28,582"; college189.numberofStudents = @"Information not available"; college189.address = @"401 College Avenue Ashland, OH 44805"; college189.acceptanceRate = @"72.2%"; college189.phoneNumber = @"(419) 289-4142"; college189.majorPrograms = @"Information not available"; college189.website = @"www.ashland.edu"; college189.isitIvyLeague = @"No"; college189.mascot = @"Tuffy Eagle"; college189.color = @"No Colors"; college189.collegeNameCell = college189.name; college189.collegeRankCell = college189.rank; college189.collegePhotoCell = @"asdkjhfkasdfhasdf.jpeg";
    College *college190 = [College new]; college190.name = @"Montana State University "; college190.collegeName = college190.name; college190.rank = @"#190"; college190.imageFile = @"jsfkjasdhf.jpeg"; college190.sizeofCollegeCampus = @"1,780 acres"; college190.tuition = @"20,018"; college190.numberofStudents = @"12,188"; college190.address = @"Bozeman, MT 59717"; college190.acceptanceRate = @"60.2%"; college190.phoneNumber = @"(406) 994-0211"; college190.majorPrograms = @"Engineering, Business, Management, Marketing, and Related Support Services, Health Professions and Related Programs, Education, Family and Consumer Sciences/Human Sciences"; college190.website = @"www.montana.edu"; college190.isitIvyLeague = @"No"; college190.mascot = @"Champ"; college190.color = @"Blue, Gold"; college190.collegeNameCell = college190.name; college190.collegeRankCell = college190.rank; college190.collegePhotoCell = @"shldfsalhfs.jpeg";
    College *college191 = [College new]; college191.name = @"New Mexico State University"; college191.collegeName = college191.name; college191.rank = @"#191"; college191.imageFile = @"sdfasfdsf.jpeg"; college191.sizeofCollegeCampus = @"3,500 acres"; college191.tuition = @"19,068"; college191.numberofStudents = @"14,495"; college191.address = @"Box 30001, MSC 3004 Las Cruces, NM 88003-8001"; college191.acceptanceRate = @"80.2%"; college191.phoneNumber = @" (505) 646-0111"; college191.majorPrograms = @"Criminal Justice/Safety Studies, Registered Nursing/Registered Nurse, Elementary Education and Teaching, Psychology, General, Biology/Biological Sciences, General"; college191.website = @"www.nmsu.edu"; college191.isitIvyLeague = @"No"; college191.mascot = @"No Mascot"; college191.color = @"No Colors"; college191.collegeNameCell = college191.name; college191.collegeRankCell = college191.rank; college191.collegePhotoCell = @"asdnfsjajdnfs.png";
    College *college192 = [College new]; college192.name = @"Northern Illinois University "; college192.collegeName = college192.name; college192.rank = @"#192"; college192.imageFile = @"jshkahfdkfdhsf.jpeg"; college192.sizeofCollegeCampus = @"800 acres"; college192.tuition = @"22,510"; college192.numberofStudents = @"17,306"; college192.address = @"PO Box 3001 DeKalb, IL 60115"; college192.acceptanceRate = @"52.5%"; college192.phoneNumber = @"(815) 753-1000"; college192.majorPrograms = @"Speech Communication and Rhetoric, Psychology, General, Registered Nursing/Registered Nurse, Accounting, Elementary Education and Teaching"; college192.website = @"www.niu.edu"; college192.isitIvyLeague = @"No"; college192.mascot = @"Victor E. Huskie"; college192.color = @"Black, Cardinal"; college192.collegeNameCell = college192.name; college192.collegeRankCell = college192.rank; college192.collegePhotoCell = @"gdfaksgdfkgf.jpeg";
    College *college193 = [College new]; college193.name = @"University of Colorado--Denver "; college193.collegeName = college193.name; college193.rank = @"#193"; college193.imageFile = @"dshfkhsdkafkjashf.jpeg"; college193.sizeofCollegeCampus = @"126 acres"; college193.tuition = @"20,570"; college193.numberofStudents = @"12,674"; college193.address = @"Campus Box 167 PO Box 173364 Denver, CO 80217-3364"; college193.acceptanceRate = @"74.5%"; college193.phoneNumber = @"(303) 556-5600"; college193.majorPrograms = @"Business Administration and Management, General, Registered Nursing/Registered Nurse, Psychology, General, Biology/Biological Sciences, General, Speech Communication and Rhetoric"; college193.website = @"www.ucdenver.edu"; college193.isitIvyLeague = @"No"; college193.mascot = @" Milo the Lynx"; college193.color = @"Gold, Black"; college193.collegeNameCell = college193.name; college193.collegeRankCell = college193.rank; college193.collegePhotoCell = @"dkjsafhsdkfja.jpeg";
    College *college194 = [College new]; college194.name = @"University of Nevada--Reno"; college194.collegeName = college194.name; college194.rank = @"#194"; college194.imageFile = @"hkjasdfhaksdjfas.jpeg"; college194.sizeofCollegeCampus = @"255 acres"; college194.tuition = @"19,844"; college194.numberofStudents = @"14,820"; college194.address = @"Reno, NV 89557"; college194.acceptanceRate = @"86.2%"; college194.phoneNumber = @"(775) 784-1110"; college194.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Health Professions and Related Programs, Education, Engineering"; college194.website = @"www.unr.edu"; college194.isitIvyLeague = @"No"; college194.mascot = @"Alphie, Wolfie Jr."; college194.color = @"Silver, Blue"; college194.collegeNameCell = college194.name; college194.collegeRankCell = college194.rank; college194.collegePhotoCell = @"sdgkjfaksdjhf.jpeg";
    College *college195 = [College new]; college195.name = @"University of North Carolina--Greensboro "; college195.collegeName = college195.name; college195.rank = @"#195"; college195.imageFile = @"dasgkfaskjfd.jpeg"; college195.sizeofCollegeCampus = @"210 acres"; college195.tuition = @"19,934"; college195.numberofStudents = @"14,660"; college195.address = @"PO Box 26170 Greensboro, NC 27402"; college195.acceptanceRate = @"58.7%"; college195.phoneNumber = @"(336) 334-5000"; college195.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Education, Health Professions and Related Programs, Social Sciences, Visual and Performing Arts"; college195.website = @"www.uncg.edu"; college195.isitIvyLeague = @"No"; college195.mascot = @"Spartan, Minerva"; college195.color = @"Gold, Navy Blue, White"; college195.collegeNameCell = college195.name; college195.collegeRankCell = college195.rank; college195.collegePhotoCell = @"dhkasfjdhasd.jpeg";
    College *college196 = [College new]; college196.name = @"Western Michigan University"; college196.collegeName = college196.name; college196.rank = @"#196"; college196.imageFile = @"hsdfkhas.jpeg"; college196.sizeofCollegeCampus = @"1,200 acres"; college196.tuition = @"22,338"; college196.numberofStudents = @"20,054"; college196.address = @"1903 W. Michigan Avenue Kalamazoo, MI 49008"; college196.acceptanceRate = @"83.2%"; college196.phoneNumber = @"(269) 387-1000"; college196.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Education, Health Professions and Related Programs, Communication, Journalism, and Related Programs, Engineering"; college196.website = @"www.wmich.edu"; college196.isitIvyLeague = @"No"; college196.mascot = @"Buster Bronco"; college196.color = @"Brown, Gold"; college196.collegeNameCell = college196.name; college196.collegeRankCell = college196.rank; college196.collegePhotoCell = @"sdhkfasjhfdkjf.jpeg";
    College *college197 = [College new]; college197.name = @"Widener University "; college197.collegeName = college197.name; college197.rank = @"#197"; college197.imageFile = @"hdfakjsdf.jpeg"; college197.sizeofCollegeCampus = @"108 acres"; college197.tuition = @"36,382"; college197.numberofStudents = @"3,347"; college197.address = @"1 University Place Chester, PA 19013"; college197.acceptanceRate = @"66.3%"; college197.phoneNumber = @"(610) 499-4000"; college197.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Health Professions and Related Programs, Engineering, Psychology, Education"; college197.website = @"www.widener.edu"; college197.isitIvyLeague = @"No"; college197.mascot = @"No Mascot"; college197.color = @"Gold, Blue"; college197.collegeNameCell = college197.name; college197.collegeRankCell = college197.rank; college197.collegePhotoCell = @"dhkshkdjasf.jpeg";
    College *college198 = [College new]; college198.name = @"East Carolina University"; college198.collegeName = college198.name; college198.rank = @"#198"; college198.imageFile = @"dasfasdfdsaf.jpeg"; college198.sizeofCollegeCampus = @"1,386 acres"; college198.tuition = @"17,896"; college198.numberofStudents = @"21,589"; college198.address = @"East Fifth Street Greenville, NC 27858-4353"; college198.acceptanceRate = @"60.7%"; college198.phoneNumber = @" (252) 328-6131"; college198.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Health Professions and Related Programs, Education, Communication, Journalism, and Related Programs, Biological and Biomedical Sciences"; college198.website = @"www.ecu.edu"; college198.isitIvyLeague = @"No"; college198.mascot = @"Pee Dee Pirate"; college198.color = @"Royal Purple, Old gold"; college198.collegeNameCell = college198.name; college198.collegeRankCell = college198.rank; college198.collegePhotoCell = @"dasfdasfasdf.jpeg";
    College *college199 = [College new]; college199.name = @"Louisiana Tech University"; college199.collegeName = college199.name; college199.rank = @"#199"; college199.imageFile = @"shafksdhfkdasf.jpeg"; college199.sizeofCollegeCampus = @"1,451 acres"; college199.tuition = @"13,020"; college199.numberofStudents = @"9,109"; college199.address = @"700 W. California Avenue Ruston, LA 71272"; college199.acceptanceRate = @"62.1%"; college199.phoneNumber = @"(318) 257-0211"; college199.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Engineering, Health Professions and Related Programs, Education, Social Sciences"; college199.website = @"www.latech.edu"; college199.isitIvyLeague = @"No"; college199.mascot = @"Champ, Tech XX, Bulldog"; college199.color = @"Reflex Blue, Red"; college199.collegeNameCell = college199.name; college199.collegeRankCell = college199.rank; college199.collegePhotoCell = @"sgfdgskfgkasdf.jpeg";
    College *college200 = [College new]; college200.name = @"South Dakota State University"; college200.collegeName = college200.name; college200.rank = @"#200"; college200.imageFile = @"ksjhfkashdf.jpeg"; college200.sizeofCollegeCampus = @"272 acres"; college200.tuition = @"9,350"; college200.numberofStudents = @"10,993"; college200.address = @"Box 2201 Brookings, SD 57007"; college200.acceptanceRate = @"92.3%"; college200.phoneNumber = @"(800) 952-3541"; college200.majorPrograms = @"Registered Nursing/Registered Nurse, Agribusiness/Agricultural Business Operations, Economics, General, Consumer Economics, Civil Engineering, General"; college200.website = @"www.sdstate.edu"; college200.isitIvyLeague = @"No"; college200.mascot = @"No Mascot"; college200.color = @"No Colors"; college200.collegeNameCell = college200.name; college200.collegeRankCell = college200.rank; college200.collegePhotoCell = @"hasdfkjdsfsdaf.jpeg";
    College *college201 = [College new]; college201.name = @"University of Montana"; college201.collegeName = college201.name; college201.rank = @"#201"; college201.imageFile = @"asdfdasf.jpeg"; college201.sizeofCollegeCampus = @" 220 acres"; college201.tuition = @"21,806"; college201.numberofStudents = @"10,567"; college201.address = @"32 Campus Drive Missoula, MT 59812"; college201.acceptanceRate = @"81.8%"; college201.phoneNumber = @"(406) 243-0211"; college201.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Communication, Journalism, and Related Programs, Visual and Performing Arts, Natural Resources and Conservation"; college201.website = @"www.umt.edu"; college201.isitIvyLeague = @"No"; college201.mascot = @"Monte"; college201.color = @"Maroon, Silver"; college201.collegeNameCell = college201.name; college201.collegeRankCell = college201.rank; college201.collegePhotoCell = @"sdfasdfdsaf.jpeg";
    College *college202 = [College new]; college202.name = @"University of North Carolina--Charlotte"; college202.collegeName = college202.name; college202.rank = @"#202"; college202.imageFile = @"dshfkjshfkjdhsh.jpeg"; college202.sizeofCollegeCampus = @"1,000 acres "; college202.tuition = @"18,386"; college202.numberofStudents = @"20,283"; college202.address = @"9201 University City Boulevard Charlotte, NC 28223-0001"; college202.acceptanceRate = @"69.6%"; college202.phoneNumber = @"(704) 687-8622"; college202.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Social Sciences, Education, Engineering, Psychology        "; college202.website = @"www.uncc.edu"; college202.isitIvyLeague = @"No"; college202.mascot = @"No Mascot"; college202.color = @"No Colors"; college202.collegeNameCell = college202.name; college202.collegeRankCell = college202.rank; college202.collegePhotoCell = @"aslfaksfdhsfkasfjs.jpeg";
    College *college203 = [College new]; college203.name = @"University of South Dakota"; college203.collegeName = college203.name; college203.rank = @"#203"; college203.imageFile = @"shdkfjdhksfjhasdf.jpeg"; college203.sizeofCollegeCampus = @"274 acres"; college203.tuition = @"9,650"; college203.numberofStudents = @"7,473"; college203.address = @"414 E. Clark Street Vermillion, SD 57069"; college203.acceptanceRate = @"88.9%"; college203.phoneNumber = @"(605) 677-5434"; college203.majorPrograms = @"Business, Management, Marketing, and Related Support Services, Health Professions and Related Programs, Psychology, Education, Social Sciences"; college203.website = @"www.usd.edu"; college203.isitIvyLeague = @"No"; college203.mascot = @"Coyotes"; college203.color = @"White, Vermilion"; college203.collegeNameCell = college203.name; college203.collegeRankCell = college203.rank; college203.collegePhotoCell = @"bdksjfdhsfjdhsf.jpeg";

   
    
    colleges = [NSArray arrayWithObjects: college1, college2, college3, college4, college5, college6, college7, college8, college9, college10, college11,college12,college13, college14, college15, college16, college17, college18, college19, college20, college21, college22, college23, college24, college25, college26, college27, college28, college29, college30, college31, college32, college33, college34, college35, college36, college37, college38, college39, college40, college41, college42, college43, college44, college45, college46, college47, college48, college49, college50,  college51, college52, college53, college54, college55, college56, college57, college58, college59, college60, college61, college62, college63, college64, college65, college66, college67, college68, college69, college70, college71, college72, college73, college74,  college75, college76, college77, college78, college79, college80, college81, college82, college83, college84, college85, college86, college87, college88, college89, college90, college91, college92, college93, college94, college95, college96, college97, college98, college99, college100, college101, college102, college103, college104, college105, college106, college107, college108, college109, college110, college111, college112, college113, college114, college115, college116, college117, college118, college119, college120, college121, college122, college123, college124, college125, college126, college127, college128, college129, college130, college131, college132, college133, college134, college135, college136, college137, college138, college139, college140, college141, college142, college143, college144, college145, college146, college147, college148, college149, college150, college151, college152, college153, college154, college155, college156, college157, college158, college159, college160, college161, college162, college163, college164, college165, college166, college167, college168, college169, college170, college171, college172, college173, college174, college175, college176, college177, college178, college179, college180, college181, college182, college183, college184, college185, college186, college187, college188, college189, college190, college191, college192, college193, college194, college195, college196, college197, college198, college199, college200, college201, college202, college203, nil];
    // match up the row heights between both tables
    CGFloat rowHeight = self.tableView.rowHeight;
    self.searchDisplayController.searchResultsTableView.rowHeight = rowHeight;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [banner setAlpha:1];
    [UIView commitAnimations];
    
}

- (void)bannerView:(ADBannerView *)
banner didFailToReceiveAdWithError:(NSError *)error
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    [banner setAlpha:0];
    [UIView commitAnimations];
}

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"SELF.name contains[cd] %@",searchText];
    searchResults = [colleges filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller
shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];
    
    return YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [searchResults count];
        
    } else {
        return [colleges count];
        
    }
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (UIImage *)cellBackgroundForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowCount = [self tableView:[self tableView] numberOfRowsInSection:0];
    NSInteger rowIndex = indexPath.row;
    UIImage *background = nil;
    
    if (rowIndex == 0) {
        background = [UIImage imageNamed:@"cell_top.png"];
    } else if (rowIndex == rowCount - 1) {
        background = [UIImage imageNamed:@"cell_bottom.png"];
    } else {
        background = [UIImage imageNamed:@"cell_middle.png"];
    }
    
    return background;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    College *college = nil;
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        college = [searchResults objectAtIndex:indexPath.row];
    }
    else {
        college = [colleges objectAtIndex:indexPath.row];
    }
    CGFloat rowHeight = self.tableView.rowHeight;
    self.searchDisplayController.searchResultsTableView.rowHeight = rowHeight;
    
    UILabel *CollegeNameLabel = (UILabel *)[cell viewWithTag:101];
    CollegeNameLabel.text = college.collegeNameCell;
    
    UIImageView *collegeImageView = (UIImageView *)[cell viewWithTag:100];
    collegeImageView.image = [UIImage imageNamed:college.collegePhotoCell];
    
    UILabel *CollegeRankLabel = (UILabel *)[cell viewWithTag:102];
    CollegeRankLabel.text = college.collegeRankCell;
    
    
    
    // Assign our own background image for the cell
    UIImage *background = [self cellBackgroundForRowAtIndexPath:indexPath];
    
    UIImageView *cellBackgroundView = [[UIImageView alloc] initWithImage:background];
    cellBackgroundView.image = background;
    cell.backgroundView = cellBackgroundView;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showCollegeDetail"]) {
        CollegeDetailViewController *destViewController = segue.destinationViewController;
        
        NSIndexPath *indexPath = nil;
        
        if ([self.searchDisplayController isActive]) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            destViewController.college = [searchResults objectAtIndex:indexPath.row];
            
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            destViewController.college = [colleges objectAtIndex:indexPath.row];
        }
    }
    
}

@end