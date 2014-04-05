//
//  NewsViewController.h
//  Your Guide to TF2
//
//  Created by Varun Iyer on 3/30/14.
//  Copyright (c) 2014 MoAppsCo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tblNews;

- (IBAction)removeDataFile:(id)sender;

-(void)fetchNewDataWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;

@end
