//
//  AgreementViewController.h
//  ExamPrep
//
//  Created by Brian Roy A. Villanueva on 1/9/15.
//  Copyright (c) 2015 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgreementViewController : UIViewController
{

    IBOutlet UIButton *buttonOk;
}
@property (strong, nonatomic) NSMutableArray *arrAgreement;
@property (strong, nonatomic) IBOutlet UIWebView *viewWeb;
@property(nonatomic,retain) IBOutlet UIButton *buttonOk;
-(IBAction)agreeTerms:(id)sender;
-(IBAction)btnAccept:(id)sender;
@end
