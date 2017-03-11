//
//  CancelTestSubscribeViewController.h
//  ExamPrep
//
//  Created by IBL Infotech on 04/11/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CancelTestSubscribeViewController : UIViewController<UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *btnAccessLevel1;
- (IBAction)btnAccessLevel1:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnAccessLevel2;
- (IBAction)btnAccessLevel2:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnAccessLevel3;
- (IBAction)btnAccessLevel3:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnAccessLevel4;
- (IBAction)btnAccessLevel4:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnAccessLevel5;
- (IBAction)btnAccessLevel5:(id)sender;

//Class Description...
@property (strong, nonatomic) IBOutlet UILabel *lblAccessLevel1;
@property (strong, nonatomic) IBOutlet UILabel *lblAccessLevel2;
@property (strong, nonatomic) IBOutlet UILabel *lblAccessLevel3;
@property (strong, nonatomic) IBOutlet UILabel *lblAccessLevel4;
@property (strong, nonatomic) IBOutlet UILabel *lblAccessLevel5;

//Other Button
- (IBAction)btnCancelSubscribtion:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnCancelSubscribtion;


- (IBAction)btnBack:(id)sender;
- (IBAction)btnLogout:(id)sender;

//Expire Date Lable
@property (strong, nonatomic) IBOutlet UILabel *expAccessLevel1;
@property (strong, nonatomic) IBOutlet UILabel *expAccessLevel2;
@property (strong, nonatomic) IBOutlet UILabel *expAccessLevel3;
@property (strong, nonatomic) IBOutlet UILabel *expAccessLevel4;
@property (strong, nonatomic) IBOutlet UILabel *expAccessLevel5;




@end
