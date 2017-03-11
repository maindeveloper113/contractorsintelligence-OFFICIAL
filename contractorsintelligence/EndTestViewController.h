//
//  EndTestViewController.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 22/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EndTestViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblResult;
@property (weak, nonatomic) IBOutlet UILabel *lblCatagory;

@property (weak, nonatomic) IBOutlet UILabel *lbltestName;
@property (weak, nonatomic) IBOutlet UILabel *lbltotalQues;

@property (weak, nonatomic) IBOutlet UILabel *lblAttempt;

@property (weak, nonatomic) IBOutlet UILabel *lblCorrect;
@property (weak, nonatomic) IBOutlet UILabel *lblInCorrect;

@property (weak, nonatomic) IBOutlet UILabel *lblPercentage;
@property (strong,nonatomic)NSString * TestTitle;
@property (strong,nonatomic)NSString * Catagory;
@property (strong,nonatomic)NSString * TotalQues;
@property (strong,nonatomic)NSString * precentage;
@property (strong,nonatomic)NSString *correctans;
@property (strong,nonatomic)NSString *Attempt;
@property (weak,nonatomic)NSString *Result;
@property (strong,nonatomic)NSString *correctFill;
@property (strong,nonatomic)NSString *incorrectFill;

- (IBAction)BackToDashboard:(id)sender;


@property (weak, nonatomic) IBOutlet UILabel *lblResult1;
@property (weak, nonatomic) IBOutlet UILabel *lblCatagory1;

@property (weak, nonatomic) IBOutlet UILabel *lbltestName1;
@property (weak, nonatomic) IBOutlet UILabel *lbltotalQues1;

@property (weak, nonatomic) IBOutlet UILabel *lblAttempt1;

@property (weak, nonatomic) IBOutlet UILabel *lblCorrect1;
@property (weak, nonatomic) IBOutlet UILabel *lblInCorrect1;

@property (weak, nonatomic) IBOutlet UILabel *lblPercentage1;

@property (strong, nonatomic) IBOutlet UIButton *btnDash;
- (IBAction)LogOut:(id)sender;

@end
