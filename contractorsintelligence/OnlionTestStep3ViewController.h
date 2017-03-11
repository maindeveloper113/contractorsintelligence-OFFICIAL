//
//  OnlionTestStep3ViewController.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 21/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OnlionTestStep3ViewController : UIViewController<UITextViewDelegate,UIScrollViewDelegate,UIAlertViewDelegate>

@property (strong,nonatomic) NSMutableArray * TestArray3;
@property (strong, nonatomic)NSString *flageForAccZeroEnableExplnation;
@property(strong,nonatomic) NSString * lblheading;
@property (strong,nonatomic)NSString *MainCatagary;

//Main View Default bound
- (IBAction)LogOut:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
- (IBAction)btnEndExam:(id)sender;

//Time remaning...
@property (strong, nonatomic) IBOutlet UILabel *lblTimeRemaining;
@property (strong, nonatomic) IBOutlet UILabel *lblTimeCount;
@property (strong, nonatomic) IBOutlet UILabel *lblMinit;
@property (strong, nonatomic) IBOutlet UILabel *lblSecond;

//Current Score...
@property (strong, nonatomic) IBOutlet UILabel *lblCscore;
@property (strong, nonatomic) IBOutlet UILabel *lblCurrentScore;

//No. of Question
@property (strong, nonatomic) IBOutlet UILabel *lblQuestion;
@property (weak, nonatomic) IBOutlet UILabel *lblCounting;
@property (weak, nonatomic) IBOutlet UILabel *lblTotlCounting;

//View for Question and Answer
@property (strong, nonatomic) IBOutlet UIView *viewForQueAns;
@property (strong, nonatomic) IBOutlet UIScrollView *ScrollViev;
@property (strong, nonatomic) IBOutlet UITextView *txtQues;

//Subview For Pdf
@property (strong, nonatomic) IBOutlet UIView *SubviewForPdf;
- (IBAction)btnForOpenPdf:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *lblForOpenPdf;

//Subview for Image view
@property (strong, nonatomic) IBOutlet UIView *imagview;
@property (weak, nonatomic) IBOutlet UIImageView *QuestionImage;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loaderQueImage;
- (IBAction)ZoomImage:(id)sender;

//Answer View and Explanation view
@property (strong, nonatomic) IBOutlet UIView *queAnsView;

// 1 Answer View
@property (strong, nonatomic) IBOutlet UIView *SubviewAns1;
@property (weak, nonatomic) IBOutlet UIImageView *Image1;
@property (strong, nonatomic) IBOutlet UITextView *lblAns1;
- (IBAction)btnAns1:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnAns1outlet;

// 2 Answer View
@property (strong, nonatomic) IBOutlet UIView *SubviewAns2;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (strong, nonatomic) IBOutlet UITextView *lblAns2;
- (IBAction)btnAns2:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnAns2outlet;

// 3 Answer View
@property (strong, nonatomic) IBOutlet UIView *SubviewAns3;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (strong, nonatomic) IBOutlet UITextView *lblAns3;
- (IBAction)btnAns3:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnAns3outlet;

// 4 Answer View
@property (strong, nonatomic) IBOutlet UIView *SubviewAns4;
@property (weak, nonatomic) IBOutlet UIImageView *image4;
@property (strong, nonatomic) IBOutlet UITextView *lblAns4;
- (IBAction)btnAns4:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnAns4outlet;

// Explanation View
@property (strong, nonatomic) IBOutlet UIView *SubviewExamplanation;
- (IBAction)btnNextQuestion:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *BtnSubmitOutle;

@property (strong, nonatomic) IBOutlet UITextView *txtExplation;
@property (strong, nonatomic) IBOutlet UILabel *lblExplain;

//Explanatino Image
@property (strong, nonatomic) IBOutlet UIView *SubViewExaplanationImage;
@property (strong, nonatomic) IBOutlet UIImageView *imageWebview;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicatorExamplanation;
- (IBAction)ZoomInExaplaination:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnExaplainationImage;


@end
