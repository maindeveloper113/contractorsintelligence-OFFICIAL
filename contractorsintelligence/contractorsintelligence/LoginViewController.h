//
//  LoginViewController.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 29/09/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

- (IBAction)signUP:(id)sender;
- (IBAction)signIN:(id)sender;
- (IBAction)forgotPassword:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnEmail;
@property (strong, nonatomic) IBOutlet UIButton *btnPassword;



@end
