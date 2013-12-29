//
//  TF2CollectionViewController.m
//  Your Guide to TF2
//
//  Created by Varun Iyer on 12/25/13.
//  Copyright (c) 2013 MoAppsCo. All rights reserved.
//

#import "TF2CollectionViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface TF2CollectionViewController () {
    NSArray *tf2HomePhotos;
}

@end

@implementation TF2CollectionViewController

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

	// Do any additional setup after loading the view.
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tf2_logo.png"]];
    
    tf2HomePhotos = [NSArray arrayWithObjects:@"get_info.png", @"tf2_mechanics_rounded.png", @"tf2_weapons_rounded.png", @"tf2_hats_rounded.png", @"tf2_items_rounded.png", @"tf2_trade_rounded.png", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return tf2HomePhotos.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UIImageView *recipeImageView = (UIImageView *)[cell viewWithTag:100];
    recipeImageView.image = [UIImage imageNamed:[tf2HomePhotos objectAtIndex:indexPath.row]];
    
    return cell;
}

@end
