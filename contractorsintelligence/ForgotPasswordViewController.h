//
//  ForgotPasswordViewController.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 02/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgotPasswordViewController : UIViewController<UIAlertViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UILabel *lblMessage;
- (IBAction)submitRequest:(id)sender;
- (IBAction)cancelRequestion:(id)sender;

@end
