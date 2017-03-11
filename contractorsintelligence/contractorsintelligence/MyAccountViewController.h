//
//  MyAccountViewController.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 23/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAccountViewController : UIViewController<UIAlertViewDelegate,UITextFieldDelegate>
- (IBAction)UpdateAccount:(id)sender;
- (IBAction)BackToDash:(id)sender;
- (IBAction)btnCancelTest:(id)sender;


- (IBAction)UpadatePassword:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *CurrentView;


//Another view for Update passsword
@property (strong, nonatomic) IBOutlet UIButton *btnCancelUpdatePass;
@property (strong, nonatomic) IBOutlet UIButton *btnOkUpdatePass;
@property (strong, nonatomic) IBOutlet UITextField *txtOldPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtNewPassword;
@property (strong, nonatomic) IBOutlet UITextField *txtConfirmPassword;
- (IBAction)btnCancelUpdatepass:(id)sender;
- (IBAction)btnOkUpdatepass:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *SubviewUpdatePassword;





@end
