//
//  DashboardOneViewController.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 02/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardOneViewController : UIViewController<UIAlertViewDelegate>
- (IBAction)openApplicationTab:(id)sender;
- (IBAction)openYourTestSubscriptionTab:(id)sender;
- (IBAction)openOrderOnlineTests:(id)sender;
- (IBAction)openSettingsTab:(id)sender;

- (IBAction)LogOut:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lblApplication;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicatorForTag;



@end
