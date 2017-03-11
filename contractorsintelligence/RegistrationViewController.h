//
//  RegistrationViewController.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 29/09/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrationViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UIAlertViewDelegate>

- (IBAction)cancelRegistration:(id)sender;
- (IBAction)doRegister:(id)sender;

//Form control
@property (weak, nonatomic) IBOutlet UITextField *txtFirstName;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName;
@property (weak, nonatomic) IBOutlet UITextField *txtPhone;
@property (weak, nonatomic) IBOutlet UILabel *lblQuestion;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtConfirmEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtAddress;
@property (weak, nonatomic) IBOutlet UILabel *lblState;
@property (weak, nonatomic) IBOutlet UITextField *txtCity;
@property (weak, nonatomic) IBOutlet UITextField *txtZipcode;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;
@property (weak, nonatomic) IBOutlet UITextField *txtConfirmPass;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollForm;

- (IBAction)selectDesiredQuestion:(id)sender;
- (IBAction)selectState:(id)sender;

//Pickers
@property (strong, nonatomic) IBOutlet UIView *viewQuestion;
@property (strong, nonatomic) IBOutlet UIView *viewState;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerQuestion;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerState;
- (IBAction)doneWithQuestionPicker:(id)sender;
- (IBAction)doneWithStatePicker:(id)sender;


@end
