//
//  DashboardOneViewController.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 02/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardOneViewController : UIViewController<UIAlertViewDelegate>
{
    
    IBOutlet UILabel *alertNotification; //The Label that tells the user that the alert has been registered with the system.

}
- (IBAction)openApplicationTab:(id)sender;
- (IBAction)openYourTestSubscriptionTab:(id)sender;
- (IBAction)openOrderOnlineTests:(id)sender;
- (IBAction)openSettingsTab:(id)sender;

- (IBAction)LogOut:(id)sender;

@property(nonatomic, retain) IBOutlet UILabel *alertNotification;
- (IBAction)dismissKeyboard:(id)sender;


@property (strong, nonatomic) IBOutlet UILabel *lblApplication;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicatorForTag;

//Another view for Update passsword
@property (strong, nonatomic) IBOutlet UIButton *btnCancelUpdatePass;
@property (strong, nonatomic) IBOutlet UIButton *btnOkUpdatePass;

@property (strong, nonatomic) IBOutlet UITextField *txtNewPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtConfirmPassword;

- (IBAction)btnCancelUpdatepass:(id)sender;

- (IBAction)btnOkUpdatepass:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *SubviewUpdatePassword;

@end
