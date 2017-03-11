//
//  OrderPracticeTestViewController.h
//  ExamPrep
//
//  Created by IBL Infotech on 03/11/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NIDropDown.h"

@interface OrderPracticeTestViewController : UIViewController<NIDropDownDelegate>
{
    NIDropDown *dropDown;
}
- (IBAction)btnClassDescription:(id)sender;
- (IBAction)btnSubscribe:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *btnClassDescription;
-(void) rel;

- (IBAction)btnBack:(id)sender;
- (IBAction)btnLogout:(id)sender;


@end
