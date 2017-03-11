//
//  Demopractise.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 30/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Demopractise : UIViewController<UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *Tbl_Demopractice;
@property (strong, nonatomic) NSMutableArray *lowAndBussiness;
@property (strong, nonatomic) NSMutableArray *generalEngineering;
@property (strong, nonatomic) NSMutableArray *generalEngineeringClassification;
@property (strong, nonatomic) NSString * testId;
@property (strong, nonatomic) IBOutlet UIButton *lowandbus;
@property (strong, nonatomic) IBOutlet UIButton *lockandsec;

- (IBAction)LogOut:(id)sender;
- (IBAction)LowAndBuss:(id)sender;

- (IBAction)LockAnSec:(id)sender;
- (IBAction)btnCancel:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lblgeneratengg;
@property (strong, nonatomic)NSString *flageForAccZeroEnableExplnation;


@end
