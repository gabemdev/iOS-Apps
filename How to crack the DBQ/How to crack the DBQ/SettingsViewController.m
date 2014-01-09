//
//  SettingsViewController.m
//  how to crack the dbq
//
//  Created by Varun Iyer on 1/2/14.
//  Copyright (c) 2014 MoAppsCo. All rights reserved.
//

#import "SettingsViewController.h"
#import "SWRevealViewController.h"
#define k_Save @"Saveitem"


@interface SettingsViewController ()

@property (nonatomic, strong) NSArray *menuItems;

@end

@implementation SettingsViewController

@synthesize Label;
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
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.1f alpha:0.7f];
    NSUserDefaults *saveapp = [NSUserDefaults standardUserDefaults];
    bool saved = [saveapp boolForKey:k_Save];
    if (!saved) {
        /// not save code here
    } else {
        ///saved code here
        Label.text = @"Item has been purchased.";
    
    // Add pan gesture to hide the sidebar
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
	// Do any additional setup after loading the view.
}
}
 


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0 && indexPath.section == 3){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://howtocrackthedbq.blogspot.com/"]];
    } else if(indexPath.row == 1 && indexPath.section == 1){
             if ([MFMailComposeViewController canSendMail]) {
                 MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
                 mailViewController.mailComposeDelegate = self;
                 [mailViewController setSubject:@"[How to crack the DBQ] Support request"];
                 [mailViewController setToRecipients:[NSArray arrayWithObject:@"moappsco@gmail.com"]];
                 [self presentModalViewController:mailViewController animated:YES];
             }
              }
    
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error{
    [self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)Purchased {
    Label.text = @"Item has been purchased.";
    NSUserDefaults *saveapp = [NSUserDefaults standardUserDefaults];
    [saveapp setBool:TRUE forKey:k_Save];
    [saveapp synchronize];
}
- (IBAction)PurchaseItem:(id)sender {
    
    _purchaseController = [[PurchasedViewController alloc] initWithNibName:nil bundle:nil];
    _purchaseController.productID = @"com.moappsco.crackingthedbq.dbq1";
    [[SKPaymentQueue defaultQueue] addTransactionObserver:_purchaseController];
    [self presentViewController:_purchaseController animated:YES completion:NULL];
    [_purchaseController getProductID:self];
}
@end
