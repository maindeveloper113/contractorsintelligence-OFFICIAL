//
//  OnlionTestStep3ViewController.m
//  contractorsintelligence
//
//  Created by IBL Infotech on 21/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "OnlionTestStep3ViewController.h"
#import "OnlionTestViewController.h"
#import "EndTestViewController.h"
#import "ImageZooming.h"
#import "DashboardOneViewController.h"
#import "EndTestViewController.h"
#import "LoginViewController.h"
#import "webViewForOpenPdfViewController.h"
#import "Contact.h"
#import "MBProgressHUD.h"

@interface OnlionTestStep3ViewController (){
    NSTimer *timer;
    int n;
    NSString *voteCount;
    NSString *ansSelected;
    NSMutableDictionary *quesAnsDic;
    NSString* urlforZoom;
    NSString * correctAns;
    int per;
    int Number;
    NSString *ques;
    NSString *flalgeNext;
    int m;
    int occurrences;
    int occurnce2;
    int CorrectFill;
    int inCorrectFill;
    int flgclickAns;
    NSString * Explantion;
    NSInteger totalque;
    int i;
     int j;
    int k;
    NSString *flageFinishTest1;
    NSString *urlforZoomExaplanation;
    NSString *loginType;
    int QuestionHeight;
    int AnswerHeight;
    int ExplanationHeight;
    NSString *ButtonChecked;
    NSString *ButtonUnchecked;
    NSString *ImageTrue;
    NSString *ImageFalse;
    float fontQues;
    float fontAns;
   }

@end

@implementation OnlionTestStep3ViewController
@synthesize btnAns1outlet,btnAns2outlet,btnAns3outlet,btnAns4outlet,ScrollViev;

- (NSString *)ques { return @"0(NSNull)"; }

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        // For iPhone
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    }
    else
    {
        // For iPad
        self = [super initWithNibName:@"OnlionTestStep3ViewController~ipad" bundle:nibBundleOrNil];
    }

    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    //[ScrollView addSubview:self.DescriptionView];
}
- (void)viewDidLoad
{
    [self setFont];
    [self.imageWebview setHidden:YES];
    [self.lblExplain setHidden:YES];
    [self.indicatorExamplanation stopAnimating];
    self.txtExplation.backgroundColor = [UIColor clearColor];
    [super viewDidLoad];
    ansSelected=nil;
    flalgeNext=@"1";
    n=0;
    flageFinishTest1=@"0";
    per=0.0;
    Number=0.0;
    m=0;
    CorrectFill = 0;
    inCorrectFill = 0;
    flgclickAns=0;
    NSLog(@"getarray %@",self.TestArray3);
    
    i=1;
    j=59;
    k=59;
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(elapsedTime)
                                           userInfo:nil
                                            repeats:YES ];
    NSLog(@"copied Array %@",self.TestArray3);
    [self Question_Fill];
    totalque=self.TestArray3.count;
    NSNumber *someNumber =@(self.TestArray3.count);
    NSString *someString = [someNumber stringValue];
    self.lblTotlCounting.text = someString;
    self.lblTitle.text = self.lblheading;
    loginType=[[NSUserDefaults standardUserDefaults]objectForKey:@"account_type"];
    if([self.flageForAccZeroEnableExplnation isEqualToString:@"1"])
    {
        loginType=@"1";
    }
    
    
      
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setFont
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        QuestionHeight=40;
        ExplanationHeight=40;
        AnswerHeight=35;
        ButtonChecked=@"btn_radiobutton_checked.png";
        ButtonUnchecked=@"btn_radiobutton_unchecked.png";
        ImageTrue=@"img_green.png";
        ImageFalse=@"img_red.png";
        
        fontAns=13.0;
        fontQues=14.0;
        // For iPhone
        [ScrollViev setContentSize:CGSizeMake(320.0,1400.0)];
        [self.lblExplain setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
        [self.lblAns1 setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
        [self.lblAns2 setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
        [self.lblAns3 setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
        [self.lblAns4 setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
        [self.txtQues setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblForOpenPdf setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
        [self.txtExplation setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblTimeRemaining setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
        [self.lblTitle setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
        [self.lblCscore setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
        [self.lblQuestion setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
        [self.lblTimeCount setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
        [self.lblMinit setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
        [self.lblSecond setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
        [self.lblCurrentScore setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
        [self.lblTotlCounting setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
        [self.lblCounting setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
        
    }
    else
    {
        // For iPad
        AnswerHeight=65;
        QuestionHeight=65;
        ExplanationHeight=75;

        ButtonChecked=@"btn_radiobutton_checked_ipad@2x.png";
        ButtonUnchecked=@"btn_radiobutton_unchecked_ipad@2x.png";
        ImageTrue=@"img_green_ipad@2x.png";
        ImageFalse=@"img_red_ipad@2x.png";
        fontQues=19.0;
        fontAns=18.0;
        
        [ScrollViev setContentSize:CGSizeMake(768.0,1400.0)];
        UIFont *font18=[UIFont fontWithName:@"Eurostile LT" size:18.0];
        UIFont *font19=[UIFont fontWithName:@"Eurostile LT" size:19.0];
        UIFont *font20=[UIFont fontWithName:@"Eurostile LT" size:20.0];
        [self.txtExplation setFont:[UIFont fontWithName:@"Eurostile LT" size:25.0]];
        [self.lblExplain setFont:font18];
        [self.lblAns1 setFont:font18];
        [self.lblAns2 setFont:font18];
        [self.lblAns3 setFont:font18];
        [self.lblAns4 setFont:font18];
        [self.txtQues setFont:font19];
        [self.lblForOpenPdf setFont:font20];
        [self.lblTimeRemaining setFont:font20];
        [self.lblTitle setFont:font20];
        [self.lblCscore setFont:font20];
        [self.lblQuestion setFont:font20];
        [self.lblTimeCount setFont:font18];
        [self.lblMinit setFont:font18];
        [self.lblSecond setFont:font18];
        [self.lblCurrentScore setFont:font18];
        [self.lblTotlCounting setFont:font18];
        [self.lblCounting setFont:font18];
        
    }
}
-(void)Question_Fill
{
    [self.loaderQueImage stopAnimating];
    quesAnsDic=[self.TestArray3 objectAtIndex:n];
    ques=[quesAnsDic objectForKey:@"ques"];
    if([ques isEqual:[NSNull null]])
    {
        ques=@"";
    }
    if (([ques rangeOfString:@"<img src"].location == NSNotFound)&&([ques rangeOfString:@"<a"].location ==NSNotFound)) {
        NSLog(@"string does not contain img");
        [self.SubviewForPdf setHidden:YES];
        [self.imagview setHidden:YES];
        float height123;
        height123=[self getHeightfromString:ques :QuestionHeight];
     //   NSLog(@"%f",height);
       
        [self.txtQues setFrame:CGRectMake(0,-5, self.txtQues.frame.size.width, height123)];
         [self.queAnsView setFrame:CGRectMake(0, self.txtQues.frame.size.height, self.queAnsView.frame.size.width, self.queAnsView.frame.size.height)];
        
        NSLog(@"qu:%@",ques);
        NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                       "<head> \n"
                                       "<style type=\"text/css\"> \n"
                                       "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                       "</style> \n"
                                       "</head> \n"
                                       "<body>%@</body> \n"
                                       "</html>",fontQues,ques];
        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[myDescriptionHTML dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
        self.txtQues.attributedText = attributedString;
        
    }
    else if ([ques rangeOfString:@"<a"].location ==NSNotFound) {
        
        [self.loaderQueImage startAnimating];
        
        @try {
            NSLog(@"string contains img!");
            
            NSArray* question_split = [ques componentsSeparatedByString: @"<img src="];
            NSString* question = [question_split objectAtIndex: 0];
            NSString* full_url = [question_split objectAtIndex: 1];
            NSArray* url_split = [full_url componentsSeparatedByString: @"\""];
            NSString* url = [url_split objectAtIndex: 1];
            urlforZoom=url;
            NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                           "<head> \n"
                                           "<style type=\"text/css\"> \n"
                                           "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                           "</style> \n"
                                           "</head> \n"
                                           "<body>%@</body> \n"
                                           "</html>",fontQues,question];
            
            NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[myDescriptionHTML dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
            self.txtQues.attributedText = attributedString;
            [self.SubviewForPdf setHidden:YES];
            [self.QuestionImage setHidden:NO];
            [self.imagview setHidden:NO];
            
            float height123;
            height123=[self getHeightfromString:question :QuestionHeight];
            [self.txtQues setFrame:CGRectMake(0,-5, self.txtQues.frame.size.width, height123)];
            //Set the Position of Imageview According to lenght of Question..

            [self.imagview setFrame:CGRectMake(0, self.txtQues.frame.size.height, self.imagview.frame.size.width, self.imagview.frame.size.height)];
            [self.queAnsView setFrame:CGRectMake(0, self.txtQues.frame.size.height+self.imagview.frame.size.height, self.queAnsView.frame.size.width, self.queAnsView.frame.size.height)];
            
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSData *data1 = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
                UIImage *imgQue1=[UIImage imageWithData:data1];
                
               dispatch_async(dispatch_get_main_queue(), ^{
                
                    //NSLog(@"Width : %f | Height : %f",imgQue.size.width,imgQue.size.height);
                    [self.loaderQueImage stopAnimating];
                    [self.QuestionImage setImage:imgQue1];
                });
                });
        }
        @catch (NSException *exception) {
            NSLog(@"nameee %@",exception.name);
        }
        NSLog(@"string contains img!");
    }
    else if ([ques rangeOfString:@"<img src"].location == NSNotFound)
    {
        
        NSArray* question_split1 = [ques componentsSeparatedByString: @"<a href="];
        NSString* question1 = [question_split1 objectAtIndex: 0];
        NSString* full_url1 = [question_split1 objectAtIndex: 1];
        NSArray* url_split1 = [full_url1 componentsSeparatedByString: @"\""];
        NSString* url1 = [url_split1 objectAtIndex: 1];
       // NSLog(@"%@",url1);
        NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                       "<head> \n"
                                       "<style type=\"text/css\"> \n"
                                       "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                       "</style> \n"
                                       "</head> \n"
                                       "<body>%@</body> \n"
                                       "</html>",fontQues,question1];
        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[myDescriptionHTML dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
        self.txtQues.attributedText = attributedString;
        [self.QuestionImage setHidden:YES];
        [self.imagview setHidden:YES];
        [self.SubviewForPdf setHidden:NO];
        NSDictionary *attributes = @{NSForegroundColorAttributeName: [UIColor
                                                            colorWithRed:85.0f/255.0f
                                                            green:26.0f/255.0f
                                                            blue:139.0f/255.0f
                                                            alpha:1.0f], NSBackgroundColorAttributeName: [UIColor clearColor], NSUnderlineStyleAttributeName: @1,NSUnderlineColorAttributeName:[UIColor blueColor]};
        
        NSAttributedString *myString = [[NSAttributedString alloc] initWithString:@"View PDF File" attributes:attributes];
        self.lblForOpenPdf.attributedText=myString;
        
        //Set the Position of PDF view According to lenght of Question..
        float height123;
        height123=[self getHeightfromString:question1 :QuestionHeight];
        [self.txtQues setFrame:CGRectMake(0,-5, self.txtQues.frame.size.width, height123)];
        
        [self.SubviewForPdf setFrame:CGRectMake(0, self.txtQues.frame.size.height, self.SubviewForPdf.frame.size.width, self.SubviewForPdf.frame.size.height)];
        [self.queAnsView setFrame:CGRectMake(0, self.txtQues.frame.size.height+self.SubviewForPdf.frame.size.height, self.queAnsView.frame.size.width, self.queAnsView.frame.size.height)];
    }
    
    NSString *ans1=[quesAnsDic objectForKey:@"ans1"];
    NSString *ans2=[quesAnsDic objectForKey:@"ans2"];
    NSString *ans3=[quesAnsDic objectForKey:@"ans3"];
    NSString *ans4=[quesAnsDic objectForKey:@"ans4"];
    if([ans1 isEqual:[NSNull null]])
    {
        ans1=@"";
    }
    if([ans2 isEqual:[NSNull null]])
    {
        ans2=@"";
    }
    if([ans3 isEqual:[NSNull null]])
    {
        ans3=@"";
    }
    if([ans4 isEqual:[NSNull null]])
    {
        ans4=@"";
    }
    [self setPositionforAns:ans1 :ans2 :ans3 :ans4];
    Explantion = [quesAnsDic objectForKey:@"explanation"];
    if([Explantion isEqual:[NSNull null]])
    {
       Explantion=@"";
    }

    [self setAnswerInTextview:ans1 :ans2 :ans3 :ans4];
    correctAns = [quesAnsDic objectForKey:@"correct"];
    NSUInteger charactercount =  [correctAns length];
    //NSLog(@"chartrcount %lu",(unsigned long)charactercount);
    quesAnsDic=[self.TestArray3 objectAtIndex:m];
}
-(void)setAnswerInTextview:(NSString *)Ans1:(NSString *)Ans2:(NSString *)Ans3:(NSString *)Ans4
{
    NSString *myDescriptionHTML1 = [NSString stringWithFormat:@"<html> \n"
                                   "<head> \n"
                                   "<style type=\"text/css\"> \n"
                                   "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                   "</style> \n"
                                   "</head> \n"
                                   "<body>%@</body> \n"
                                   "</html>",fontAns,Ans1];
    NSAttributedString *attributedString1 = [[NSAttributedString alloc] initWithData:[myDescriptionHTML1 dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    self.lblAns1.attributedText = attributedString1;

    
    NSString *myDescriptionHTML2 = [NSString stringWithFormat:@"<html> \n"
                                   "<head> \n"
                                   "<style type=\"text/css\"> \n"
                                   "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                   "</style> \n"
                                   "</head> \n"
                                   "<body>%@</body> \n"
                                   "</html>",fontAns,Ans2];
    NSAttributedString *attributedString2 = [[NSAttributedString alloc] initWithData:[myDescriptionHTML2 dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    self.lblAns2.attributedText = attributedString2;

    
    NSString *myDescriptionHTML3 = [NSString stringWithFormat:@"<html> \n"
                                   "<head> \n"
                                   "<style type=\"text/css\"> \n"
                                   "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                   "</style> \n"
                                   "</head> \n"
                                   "<body>%@</body> \n"
                                   "</html>",fontAns,Ans3];
    NSAttributedString *attributedString3 = [[NSAttributedString alloc] initWithData:[myDescriptionHTML3 dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    self.lblAns3.attributedText = attributedString3;

    
    NSString *myDescriptionHTML4 = [NSString stringWithFormat:@"<html> \n"
                                   "<head> \n"
                                   "<style type=\"text/css\"> \n"
                                   "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                   "</style> \n"
                                   "</head> \n"
                                   "<body>%@</body> \n"
                                   "</html>",fontAns,Ans4];
    NSAttributedString *attributedString4 = [[NSAttributedString alloc] initWithData:[myDescriptionHTML4 dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    self.lblAns4.attributedText = attributedString4;
//    [self.lblAns1 setText:ans1];
//    [self.lblAns2 setText:ans2];
//    [self.lblAns3 setText:ans3];
//    [self.lblAns4 setText:ans4];
}

-(void)setPositionforAns:(NSString *)Ans1:(NSString *)Ans2:(NSString *)Ans3:(NSString *)Ans4
{
    
    float height123;
    
    //Answer 1 Height.......
    height123=[self getHeightfromString:Ans1 :AnswerHeight];
    [self.SubviewAns1 setFrame:CGRectMake(0, 0, self.SubviewAns1.frame.size.width, height123)];
    
    //Answer 2 Height.......
    height123=0.0;
    height123=[self getHeightfromString:Ans2 :AnswerHeight];
    [self.SubviewAns2 setFrame:CGRectMake(0,self.SubviewAns1.frame.size.height, self.SubviewAns2.frame.size.width, height123)];
    
    //Answer 3 Height.......
    height123=0.0;
    height123=[self getHeightfromString:Ans3 :AnswerHeight];
    [self.SubviewAns3 setFrame:CGRectMake(0,self.SubviewAns1.frame.size.height+self.SubviewAns2.frame.size.height, self.SubviewAns3.frame.size.width, height123)];
    
    
    //Answer 4 Height.......
    height123=0.0;
    height123=[self getHeightfromString:Ans4 :AnswerHeight];
        [self.SubviewAns4 setFrame:CGRectMake(0,self.SubviewAns1.frame.size.height+self.SubviewAns2.frame.size.height+self.SubviewAns3.frame.size.height, self.SubviewAns4.frame.size.width, height123)];
    
        [self.SubviewExamplanation setFrame:CGRectMake(0,self.SubviewAns1.frame.size.height+self.SubviewAns2.frame.size.height+self.SubviewAns3.frame.size.height+self.SubviewAns4.frame.size.height, self.SubviewExamplanation.frame.size.width, self.SubviewExamplanation.frame.size.height)];

}
-(void)elapsedTime
{
    self.lblSecond.text = [NSString stringWithFormat:@"%d",k];
    self.lblMinit.text = [NSString stringWithFormat:@"%d",j];
    self.lblTimeCount.text = [NSString stringWithFormat:@"%d",i];
    if(k>=0)
    {
        k--;
        if (j>=0 &&k==0)
        {
            k=60;
            j--;
            if (i>=0&&j==0&&k==0)
            {
                k=60;
                j=60;
                i--;
                if (i==0&& j==0 && k==0)
                {
                    
                    [timer invalidate];
                    timer = nil;
                    EndTestViewController * EndTest1 = [[EndTestViewController alloc]initWithNibName:@"EndTestViewController" bundle:nil];
                    [self.navigationController pushViewController:EndTest1 animated:YES];
                }
            }
        }
    }
}
- (IBAction)btnNextQuestion:(id)sender {
    
    if (flgclickAns == 1)
    {
        if ([flalgeNext isEqualToString:@"1"]||[ansSelected isEqualToString:@"0"])
        {
            flalgeNext=@"0";
            if(n+1==totalque)
            {
                flageFinishTest1 =@"1";
                [self.BtnSubmitOutle setTitle:@"Finish Test" forState:UIControlStateNormal];
            }
            else
            {
                [self.BtnSubmitOutle setTitle:@"Next" forState:UIControlStateNormal];
            }
            //NSLog(@"selected Ans is;%@",ansSelected);
            float size=[self.TestArray3 count];
            if([Explantion rangeOfString:@"<img src"].location == NSNotFound)
            {
                if([loginType isEqualToString:@"0"])
                {
                    [self.lblExplain setHidden:YES];
                    [self.txtExplation setHidden:YES];
                }
                else
                {
                if (!Explantion.length == 0)
                {
                    [self.lblExplain setHidden:NO];
                    //CGPoint bottomOffset = CGPointMake(0,self.queAnsView.frame.size.height-self.imagview.frame.size.height-380);
                    //[ScrollViev setContentOffset:bottomOffset animated:YES];
                }
                else
                {
                    [self.lblExplain setHidden:YES];
                }
                    float ExHeight;
                ExHeight=[self getHeightToExplanation:Explantion :ExplanationHeight];
                    //NSLog(@"%f",ExHeight);
                self.txtExplation.frame=CGRectMake(0,self.lblExplain.frame.origin.y+self.lblExplain.frame.size.height, self.txtExplation.frame.size.width, ExHeight);
                    self.SubViewExaplanationImage.frame=CGRectMake(0, self.txtExplation.frame.size.height+self.lblExplain.frame.origin.y+self.lblExplain.frame.size.height, self.SubViewExaplanationImage.frame.size.width, self.SubViewExaplanationImage.frame.size.height);
                NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                               "<head> \n"
                                               "<style type=\"text/css\"> \n"
                                               "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                               "</style> \n"
                                               "</head> \n"
                                               "<body>%@</body> \n"
                                               "</html>",fontAns,Explantion];
                NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[myDescriptionHTML dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
                self.txtExplation.attributedText = attributedString;
                [self.imageWebview setHidden:YES];
                [self.btnExaplainationImage setEnabled:NO];
                }
            }
            else
            {
                [self.lblExplain setHidden:NO];
                [self.imageWebview setHidden:NO];
                [self.btnExaplainationImage setEnabled:YES];
                if([loginType isEqualToString:@"0"])
                {
                    [self.lblExplain setHidden:YES];
                    [self.txtExplation setHidden:YES];
                }
                else
                {
                //CGPoint bottomOffset = CGPointMake(0,self.queAnsView.frame.size.height-260);
                //[ScrollViev setContentOffset:bottomOffset animated:YES];
                NSArray* question_split = [Explantion componentsSeparatedByString: @"<img src="];
                NSString* question = [question_split objectAtIndex: 0];
                NSString* full_url = [question_split objectAtIndex: 1];
                NSArray* url_split = [full_url componentsSeparatedByString: @"\""];
                NSString* url = [url_split objectAtIndex: 1];
                urlforZoomExaplanation=url;
                    
                    float ExHeight=[self getHeightToExplanation:question :ExplanationHeight];
                    self.txtExplation.frame=CGRectMake(0,self.lblExplain.frame.origin.y+self.lblExplain.frame.size.height, self.txtExplation.frame.size.width, ExHeight);
                    self.SubViewExaplanationImage.frame=CGRectMake(0, self.txtExplation.frame.size.height+self.lblExplain.frame.origin.y+self.lblExplain.frame.size.height, self.SubViewExaplanationImage.frame.size.height, self.SubViewExaplanationImage.frame.size.height);
                    
                NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                               "<head> \n"
                                               "<style type=\"text/css\"> \n"
                                               "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                               "</style> \n"
                                               "</head> \n"
                                               "<body>%@</body> \n"
                                               "</html>",fontAns,question];
                NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[myDescriptionHTML dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
                self.txtExplation.attributedText = attributedString;
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
                    UIImage *imgQue=[UIImage imageWithData:data];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        //NSLog(@"Width : %f | Height : %f",imgQue.size.width,imgQue.size.height);
                        [self.indicatorExamplanation stopAnimating];
                        [self.imageWebview setImage:imgQue];
                    });
                });
                }}
            @try
            {
                if([correctAns isEqualToString:ansSelected])
                {
                    Number=Number+1;
                    per=(((Number)*100)/size);
                    NSString *myString1= [[NSNumber numberWithFloat:per] stringValue];
                    [self.lblCurrentScore setText:myString1];
                    CorrectFill=CorrectFill+1;
                    //NSLog(@"THis is correct :%d",CorrectFill);
                }
                else
                {
                    per=((Number*100)/size);
                    //NSLog(@"per:%d",per);
                    NSString *myString1= [[NSNumber numberWithFloat:per] stringValue];
                    [self.lblCurrentScore setText:myString1];
                }
            }
            @catch (NSException *exception) {
                if([correctAns isEqualToString:ansSelected])
                {
                    Number=Number+1;
                    per=(((Number)*100)/size);
                    NSString *myString1= [[NSNumber numberWithFloat:per] stringValue];
                    [self.lblCurrentScore setText:myString1];
                    CorrectFill=CorrectFill+1;
                    //NSLog(@"THis is correct :%d",CorrectFill);
                }
                else
                {
                    per=((Number*100)/size);
                    NSLog(@"per:%d",per);
                    NSString *myString1= [[NSNumber numberWithFloat:per] stringValue];
                    [self.lblCurrentScore setText:myString1];
                }
            }
            @finally {
            }
            [self setBorderColor:ansSelected :correctAns];
            [self GetureDisable];
        }
        else if ([flalgeNext isEqualToString:@"0"])
        {
            [self.lblExplain setHidden:YES];
            [self.imageWebview setHidden:YES];
            [self.btnExaplainationImage setEnabled:NO];
            [self.SubviewForPdf setHidden:YES];
                if([flageFinishTest1 isEqualToString:@"1"])
                {
                    n++;
                    self.flageForAccZeroEnableExplnation=@"0";
                    EndTestViewController * EndTest1 = [[EndTestViewController alloc]initWithNibName:@"EndTestViewController" bundle:nil];
                    //NSLog(@"%@",flageFinishTest1);
                    EndTest1.correctans = correctAns;
                    EndTest1.TestTitle = self.lblTitle.text;
                    EndTest1.TotalQues = self.lblTotlCounting.text;
                    EndTest1.precentage = self.lblCurrentScore.text;
                    EndTest1.Attempt = [NSString stringWithFormat:@"%d",n];
                    EndTest1.correctFill = [NSString stringWithFormat:@"%d",CorrectFill];
                    EndTest1.incorrectFill = [NSString stringWithFormat:@"%d",inCorrectFill];
                    EndTest1.Catagory=self.MainCatagary;
                    EndTest1.Result=[NSString stringWithFormat:@"%d",per];
                    [self.navigationController pushViewController:EndTest1 animated:YES];
                }
            else
            {
            flalgeNext =@"1";
            n++;
            [self.BtnSubmitOutle setTitle:@"Submit" forState:UIControlStateNormal];
            [self borderColorNil];
            [self GestureEnable];
            flgclickAns = 0;
            [self.txtExplation setText:@""];
            ansSelected=@"";
            [self.btnAns1outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
            [self.btnAns2outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
            [self.btnAns3outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
            [self.btnAns4outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
            [self.QuestionImage setImage:nil];
            ScrollViev.contentOffset = CGPointMake(0,0);
            if ([self.TestArray3 count]==n)
            {
            OnlionTestViewController *online = [[OnlionTestViewController alloc]initWithNibName:@"OnlionTestViewController" bundle:nil];
            [self.navigationController pushViewController:online animated:YES];
            }
            m++;
            [self Question_Fill];
            self.lblCounting.text =[NSString stringWithFormat:@"%d",n+1];
         }
        }
        }else
        {
        if ([flalgeNext isEqualToString:@"1"])
        {
            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Oops !"
                                                              message:@"Please select the answer."
                                                             delegate:self
                                                    cancelButtonTitle:@"Ok"
                                                    otherButtonTitles:nil];
            [message show];
        }
    }
}
-(void)setBorderColor:(NSString *)selectedAnswer1:(NSString *)CorrectAnswer
{
    if ([selectedAnswer1 isEqualToString:CorrectAnswer])
    {
        if ([CorrectAnswer isEqualToString:@"A"])
        {
            self.Image1.image = [UIImage imageNamed:ImageTrue];
        }
        else if ([CorrectAnswer isEqualToString:@"B"])
        {
            self.image2.image = [UIImage imageNamed:ImageTrue];
        }
        else if ([CorrectAnswer isEqualToString:@"C"])
        {
            self.image3.image = [UIImage imageNamed:ImageTrue];
        }
        else if ([CorrectAnswer isEqualToString:@"D"])
        {
            self.image4.image = [UIImage imageNamed:ImageTrue];
            //NSLog(@"corrected %d",occurrences);
        }
    }
    else
    {
        if ([selectedAnswer1 isEqualToString:@"A"])
        {
            self.Image1.image = [UIImage imageNamed:ImageFalse];
            inCorrectFill = inCorrectFill+1;
        }
        else if ([selectedAnswer1 isEqualToString:@"B"])
        {
            self.image2.image = [UIImage imageNamed:ImageFalse];
            inCorrectFill = inCorrectFill+1;
        }
        else if ([selectedAnswer1 isEqualToString:@"C"])
        {
            self.image3.image = [UIImage imageNamed:ImageFalse];
            inCorrectFill = inCorrectFill+1;
        }
        else if ([selectedAnswer1 isEqualToString:@"D"])
        {
            self.image4.image = [UIImage imageNamed:ImageFalse];
            inCorrectFill = inCorrectFill+1;
        }
        if([CorrectAnswer isEqualToString:@"A"])
        {
            self.Image1.image = [UIImage imageNamed:ImageTrue];
        }
        else if ([CorrectAnswer isEqualToString:@"B"])
        {
            self.image2.image = [UIImage imageNamed:ImageTrue];
        }
        else if ([CorrectAnswer isEqualToString:@"C"])
        {
            self.image3.image = [UIImage imageNamed:ImageTrue];
        }
        else if ([CorrectAnswer isEqualToString:@"D"])
        {
            self.image4.image = [UIImage imageNamed:ImageTrue];
        }
    }
}

-(void)borderColorNil
{
    self.Image1.image = [UIImage imageNamed:@"q"];
    self.image2.image = [UIImage imageNamed:@"q"];
    self.image3.image = [UIImage imageNamed:@"q"];
    self.image4.image = [UIImage imageNamed:@"q"];
}
-(void)GetureDisable
{
    self.Image1.highlighted=NO;
    self.image2.highlighted=NO;
    self.image3.highlighted=NO;
    self.image4.highlighted=NO;
    
    self.btnAns1outlet.enabled=NO;
    self.btnAns2outlet.enabled=NO;
    self.btnAns3outlet.enabled=NO;
    self.btnAns4outlet.enabled=NO;
}
-(void)GestureEnable
{
    self.Image1.highlighted=YES;
    self.image2.highlighted=YES;
    self.image3.highlighted=YES;
    self.image4.highlighted=YES;
    
    self.btnAns1outlet.enabled=YES;
    self.btnAns2outlet.enabled=YES;
    self.btnAns3outlet.enabled=YES;
    self.btnAns4outlet.enabled=YES;
}

- (IBAction)btnAns1:(id)sender {
    flgclickAns =1;
    if ([ansSelected isEqualToString:@""]) {
        ansSelected=@"A";
        [self.btnAns1outlet setImage:[UIImage imageNamed:ButtonChecked] forState:UIControlStateNormal];
    }
    else
    {
        [self.btnAns1outlet setImage:[UIImage imageNamed:ButtonChecked] forState:UIControlStateNormal];
        ansSelected=@"A";
        [self.btnAns2outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
        [self.btnAns3outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
        [self.btnAns4outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
    }
}

- (IBAction)btnAns2:(id)sender {
    flgclickAns =1;
    //NSLog(@"Dic%@",quesAnsDic);
    if ([ansSelected isEqualToString:@""]) {
        ansSelected=@"B";
        [self.btnAns2outlet setImage:[UIImage imageNamed:ButtonChecked] forState:UIControlStateNormal];
    }
    else
    {
        [self.btnAns2outlet setImage:[UIImage imageNamed:ButtonChecked] forState:UIControlStateNormal];
        ansSelected=@"B";
        [self.btnAns1outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
        [self.btnAns3outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
        [self.btnAns4outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
    }
}

- (IBAction)btnAns3:(id)sender {
    flgclickAns =1;
    //NSLog(@"Dic%@",quesAnsDic);
    if ([ansSelected isEqualToString:@""]) {
        ansSelected=@"C";
        [self.btnAns3outlet setImage:[UIImage imageNamed:ButtonChecked] forState:UIControlStateNormal];
    }
    else
    {
        [self.btnAns3outlet setImage:[UIImage imageNamed:ButtonChecked] forState:UIControlStateNormal];
        ansSelected=@"C";
        [self.btnAns1outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
        [self.btnAns2outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
        [self.btnAns4outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
    }
}

- (IBAction)btnAns4:(id)sender {
    flgclickAns =1;
   // NSLog(@"Dic%@",quesAnsDic);
    if ([ansSelected isEqualToString:@""]) {
        ansSelected=@"D";
        [self.btnAns4outlet setImage:[UIImage imageNamed:ButtonChecked] forState:UIControlStateNormal];
    }
    else
    {
        [self.btnAns4outlet setImage:[UIImage imageNamed:ButtonChecked] forState:UIControlStateNormal];
        ansSelected=@"D";
        [self.btnAns1outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
        [self.btnAns3outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
        [self.btnAns2outlet setImage:[UIImage imageNamed:ButtonUnchecked] forState:UIControlStateNormal];
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
  if(alertView.tag==101)
  {
    if(buttonIndex==0)
    {
        self.flageForAccZeroEnableExplnation=@"0";
        [timer invalidate];
        EndTestViewController * EndTest = [[EndTestViewController alloc]initWithNibName:@"EndTestViewController" bundle:nil];
        EndTest.correctans = correctAns;
        EndTest.TestTitle = self.lblTitle.text;
        EndTest.TotalQues = self.lblTotlCounting.text;
        EndTest.precentage = self.lblCurrentScore.text;
        EndTest.Attempt = [NSString stringWithFormat:@"%d",n];
        EndTest.correctFill = [NSString stringWithFormat:@"%d",CorrectFill];
        EndTest.incorrectFill = [NSString stringWithFormat:@"%d",inCorrectFill];
        
        EndTest.Catagory=self.MainCatagary;
        EndTest.Result=[NSString stringWithFormat:@"%d",per];
        [self.navigationController pushViewController:EndTest animated:YES];
    }
  }
if(alertView.tag==11)
    {
        if(buttonIndex ==0)
        {
            [self jsonCallforLogoutDeveceId];
            
        }
        else
        {
            
        }
    }

}

- (IBAction)btnEndExam:(id)sender {
    
    
    
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                      message:@"Are you sure you want to end the exam?"
                                                     delegate:self
                                            cancelButtonTitle:@"YES"
                                            otherButtonTitles:@"NO",nil];
    message.tag=101;
    [message show];
}

- (IBAction)ZoomImage:(id)sender {
    ImageZooming *Zoom = [[ImageZooming alloc]initWithNibName:@"ImageZooming" bundle:nil];
    Zoom.imageOfStep3 =self.QuestionImage.image;
    Zoom.urlForZoom=urlforZoom;
    [self.navigationController pushViewController:Zoom animated:YES];
}

- (IBAction)LogOut:(id)sender {
    UIAlertView *message1 = [[UIAlertView alloc] initWithTitle:@""
                                                       message:@"Are you sure you want to log out?"
                                                      delegate:self
                                             cancelButtonTitle:@"Yes"
                                             otherButtonTitles:@"No",nil];
    message1.tag=11;
    [message1 show];
}

- (void)resetDefaults {
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        if(![key isEqualToString:@"deviceToken"])
        {
            [defs removeObjectForKey:key];
        }
    }
    [defs synchronize];
    
}
-(void)jsonCallforLogoutDeveceId
{
    NSString *email=[[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
    NSString *deviceId=@"0";
    NSString *deviceOs=@"0";
    NSArray *keys=[NSArray arrayWithObjects:@"email",@"device_id",@"device_os",nil];
    
    NSArray *values=[NSArray arrayWithObjects:email,deviceId,deviceOs, nil];
    
    NSDictionary *jsonDict=[NSDictionary dictionaryWithObjects:values forKeys:keys];
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    NSString *jsonRequest=@"";
    
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonRequest = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    //NSLog(@"%@",jsonRequest);
    
    //1
    
    //code executed in the background
    //2
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading..";
    
    //1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // Create the request.
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:REGISTER_DEVICE_TOKEN]];
        
        // Convert your data and set your request's HTTPBody property
        NSData *requestData = [jsonRequest dataUsingEncoding:NSUTF8StringEncoding];
        
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody: requestData];
        
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSError *er;
        
        NSMutableDictionary *dict ;
        
        if (returnData) {
            
            dict = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&er];
            
        }
        else{
            UIAlertView *alertError=[[UIAlertView alloc] initWithTitle:@"Warning" message:@"Data was not found." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alertError show];
        }
        
        //4
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //code executed on the main queue
            //5
            
            [hud hide:YES];
            
            NSLog(@"returnData : %@",dict);
            
            if([[dict objectForKey:@"Result"] isEqualToString:@"True"])
            {
                @try {
                    [self resetDefaults];
                    LoginViewController *login1=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
                    [self.navigationController pushViewController:login1 animated:YES];
                    
                }
                @catch (NSException *exception) {
                    NSLog(@"%@",exception.name);
                }
                
                
            }
            else
            {
                
            }
        });
    });
}

- (IBAction)btnForOpenPdf:(id)sender {
    NSArray* question_split1 = [ques componentsSeparatedByString: @"<a href="];
    NSString* full_url1 = [question_split1 objectAtIndex: 1];
    NSArray* url_split1 = [full_url1 componentsSeparatedByString: @"\""];
    NSString* url1 = [url_split1 objectAtIndex: 1];
    //NSLog(@"%@",url1);
    webViewForOpenPdfViewController *webview1=[[webViewForOpenPdfViewController alloc]initWithNibName:@"webViewForOpenPdfViewController" bundle:nil];
    webview1.urlforpdf=url1;
    [self.navigationController presentModalViewController:webview1 animated:YES];
}
- (IBAction)ZoomInExaplaination:(id)sender {
    ImageZooming *Zoom = [[ImageZooming alloc]initWithNibName:@"ImageZooming" bundle:nil];
    Zoom.imageOfStep3 =self.QuestionImage.image;
    Zoom.urlForZoom=urlforZoomExaplanation;
    [self.navigationController pushViewController:Zoom animated:YES];
    
}


-(float)getHeightfromString:(NSString *)message:(int)strLength
{
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        // For iPhone
        float length;
        int temp=[message length]/strLength;
        if(temp==0)
        {
            length =30;
        }
        else
        {
            length=(temp+2)*17;
        }
        return length;
    }
    else
    {
        // For iPad
        float length;
        float temp=[message length]/strLength;
        if(temp<1.00)
        {
            length =50;
        }
        else
        {
            length=(temp*20)+50.0;
            //NSLog(@"%f",length);
        }
//        NSString *cellText = message;
//        UIFont *cellFont = [UIFont fontWithName:@"Eurostile LT" size:fontAns];
//        CGSize constraintSize = CGSizeMake(768.0f, MAXFLOAT);
//        CGSize labelSize = [cellText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
//        if(labelSize.height <45.0)
//        {
//            return 65.0;
//        }
//        else
//        {
//            float abc= labelSize.height+25;
//            length=abc;
//            return length;
//        }
return length;
        
    }
    
}
-(float)getHeightToExplanation:(NSString *)message:(int)strLength
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        // For iPhone
        float length;
        int temp=[message length]/strLength;
        if(temp==0)
        {
            length =30;
        }
        else
        {
            length=(temp+2)*17;
        }
        return length;
    }
    else
    {
        // For iPad
        float length;
        NSString *cellText = message;
        UIFont *cellFont = [UIFont fontWithName:@"Eurostile LT" size:fontAns];
        CGSize constraintSize = CGSizeMake(768.0f, MAXFLOAT);
        CGSize labelSize = [cellText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        if(labelSize.height <40.0)
        {
            return 50.0;
        }
        else
        {
            float abc= labelSize.height+25;
            length=abc;
        }
        
        return length;
    }
 
}


@end
