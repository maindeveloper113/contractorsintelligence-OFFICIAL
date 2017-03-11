//
//  OnlinTestStep2ViewController.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 18/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OnlinTestStep2ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblTestName;
@property (weak, nonatomic) IBOutlet UITableView *TblStep2;
@property (strong,nonatomic)NSMutableArray * TestArray2;
@property (strong,nonatomic)NSString * testStep2;
@property (strong,nonatomic)NSString *test_id1;
- (IBAction)btnBackToStep1:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblPassingScore;
@property(strong,nonatomic)NSString *labelHeading;
@property (weak, nonatomic) IBOutlet UILabel *lblTotalQuestion;
@property (weak, nonatomic) IBOutlet UILabel *lbltotal;
@property (weak, nonatomic) IBOutlet UILabel *lblFullScore;
@property (weak, nonatomic) IBOutlet UILabel *lblPassing;
@property (weak, nonatomic) IBOutlet UILabel *lblScore;
@property (weak, nonatomic) IBOutlet UILabel *lbltimeLimit;
@property (weak, nonatomic) IBOutlet UILabel *lblLimit;
@property (weak, nonatomic) IBOutlet UILabel *lbl120;
@property (weak, nonatomic) IBOutlet UILabel *lbl80;
@property (strong,nonatomic)NSString *Catagori;
- (IBAction)btnStartEXam:(id)sender;
- (IBAction)LogOut:(id)sender;
@property (strong, nonatomic)NSString *flageForAccZeroEnableExplnation;
@end
