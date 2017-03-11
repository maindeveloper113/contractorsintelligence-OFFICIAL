//
//  TestSubscriptionViewController.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 18/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TestSubscriptionViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

- (IBAction)btnBackToTab:(id)sender;

@property (weak, nonatomic) IBOutlet UITableView *tableForTest;
@property (strong,nonatomic)NSMutableArray * TestSubArray;
- (IBAction)LogOut:(id)sender;

@end
