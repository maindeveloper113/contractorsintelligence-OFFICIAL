//
//  OnlionTestViewController.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 18/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OnlionTestViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lblNewExam;
@property (strong,nonatomic)NSMutableArray * TestArray;
@property (strong,nonatomic)NSString * strGotTest;
@property (strong,nonatomic)NSString *CTname;

- (IBAction)LogOut:(id)sender;

- (IBAction)BackToTest:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *TalbleTest;
@property (strong, nonatomic) IBOutlet UIButton *btnGeneralHealthSafety;
- (IBAction)btnGeneralHealthSafety:(id)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indictorTableload;



@end
