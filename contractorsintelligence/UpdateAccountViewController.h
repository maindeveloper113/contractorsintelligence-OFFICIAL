//
//  UpdateAccountViewController.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 23/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateAccountViewController : UIViewController<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UIAlertViewDelegate>

- (IBAction)cancelRegistration1:(id)sender;
- (IBAction)doRegister1:(id)sender;

//Form control https://www.contractorsischool.com/Services/displaycategory.php
@property (weak, nonatomic) IBOutlet UITextField *txtFirstName1;
@property (weak, nonatomic) IBOutlet UITextField *txtLastName1;
@property (weak, nonatomic) IBOutlet UITextField *txtPhone1;
@property (weak, nonatomic) IBOutlet UILabel *lblQuestion1;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail1;
@property (weak, nonatomic) IBOutlet UITextField *txtConfirmEmail1;
@property (weak, nonatomic) IBOutlet UITextField *txtAddress1;
@property (weak, nonatomic) IBOutlet UILabel *lblState1;
@property (weak, nonatomic) IBOutlet UITextField *txtCity1;
@property (weak, nonatomic) IBOutlet UITextField *txtZipcode1;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword1;
@property (weak, nonatomic) IBOutlet UITextField *txtConfirmPass1;
@property (weak, nonatomic) IBOutlet UIButton *btnstate;

@property(strong,nonatomic)NSMutableArray *jsonQuote;
@property(strong,atomic)NSString *ufirstname;
@property(strong,atomic)NSString *ulastname;
@property(strong,atomic)NSString *uemail;
@property(strong,atomic)NSString *uaddress;
@property(strong,atomic)NSString *ustate;
@property(strong,atomic)NSString *ucity;
@property(strong,atomic)NSString *uzip;
@property(strong,atomic)NSString *umobileno;
@property(strong,atomic)NSString *upassword;
@property(strong,atomic)NSString *uclassification;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollForm1;

- (IBAction)selectDesiredQuestion:(id)sender;
- (IBAction)selectState1:(id)sender;

//Pickers
@property (strong, nonatomic) IBOutlet UIView *viewQuestion1;
@property (strong, nonatomic) IBOutlet UIView *viewState1;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerQuestion1;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerStat1e;
- (IBAction)doneWithQuestionPicker1:(id)sender;
- (IBAction)doneWithStatePicker1:(id)sender;


@end
