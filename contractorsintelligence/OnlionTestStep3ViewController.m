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
#import "Queries.h"
#import "AppDelegate.h"

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
    NSString* url;
   
    NSString *ans1;
    NSString *ans2;
    NSString *ans3;
    NSString *ans4;
   }
@property (strong, nonatomic) IBOutlet UIButton *btnAnswer1;
@property (strong, nonatomic) IBOutlet UIButton *btnAnswer2;
@property (strong, nonatomic) IBOutlet UIButton *btnAnswer3;
@property (strong, nonatomic) IBOutlet UIButton *btnAnswer4;


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
}
-(void)setFont
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        AnswerHeight=35;
        QuestionHeight=30;
        ExplanationHeight=30;
        
        ButtonChecked=@"btn_radiobutton_checked.png";
        ButtonUnchecked=@"btn_radiobutton_unchecked.png";
        ImageTrue=@"img_green.png";
        ImageFalse=@"img_red.png";
        
        fontAns=14.0;
        fontQues=14.0;
        
        // For iPhone
        
        //[ScrollViev setContentSize:CGSizeMake(320.0,2300.0)];
        [ScrollViev setContentSize:CGSizeMake(320.0,2300.0)];
        
        [self.lblExplain setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblAns1 setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblAns2 setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblAns3 setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblAns4 setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.txtQues setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblForOpenPdf setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.txtExplation setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblTimeRemaining setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblTitle setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblCscore setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblQuestion setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
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
        fontQues=18.0;
        fontAns=18.0;
        
        [ScrollViev setContentSize:CGSizeMake(768.0,2300.0)];
//        CGRect rect;
//        rect = ScrollViev.bounds;
//        [ScrollViev setContentSize:CGSizeMake(768.0,ScrollViev.bounds.size.height)];
        
        UIFont *font18=[UIFont fontWithName:@"Eurostile LT" size:18.0];
        UIFont *font19=[UIFont fontWithName:@"Eurostile LT" size:19.0];
        UIFont *font20=[UIFont fontWithName:@"Eurostile LT" size:20.0];
        [self.txtExplation setFont:[UIFont fontWithName:@"Eurostile LT" size:25.0]];
        [self.lblExplain setFont:font18];
        [self.lblAns1 setFont:font18];
        [self.lblAns2 setFont:font18];
        [self.lblAns3 setFont:font18];
        [self.lblAns4 setFont:font18];
        [self.txtQues setFont:font18];
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

    //ques=[Queries formatStringAns:ques];
    //DONT REPLACE
    
    ques = [ques stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    ques = [ques stringByReplacingOccurrencesOfString:@"%2B" withString:@"+"];
    
    ques = [ques stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    if([ques isEqual:[NSNull null]])
    {
        ques=@"";
    }
    if (([ques rangeOfString:@"<img src="].location == NSNotFound)&&([ques rangeOfString:@"<a"].location ==NSNotFound)) {
        
         NSLog(@"string does not contain img");
        
        [self.SubviewForPdf setHidden:YES];
        [self.imagview setHidden:YES];
        float height123;
        NSString *strQues;
        
        strQues = [self stringByStrippingHTML:ques];
        
//        height123=[self getHeightfromString:ques :QuestionHeight];
//        height123=[self getHeightfromString:strQues :QuestionHeight];
//        NSLog(@"height123 %f",height123);
        
        NSLog(@"qu:%@",ques);
        
        //BRX WAS HERE
        NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                       "<head> \n"
                                       "<meta http-equiv=Content-Type content=\"text/html\" charset=\"UTF-8\">"
                                       "<style type=\"text/css\"> \n"
                                       "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                       "p {margin:0px!important;}"
                                       "</style> \n"
                                       "</head> \n"
                                       "<body>%@</body> \n"
                                       "</html>",fontQues,ques];
        
        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[myDescriptionHTML dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
        
        NSLog(@"Formatted Question:%@",myDescriptionHTML);
        
        self.txtQues.attributedText = attributedString;

        CGFloat fixedWidth = _txtQues.frame.size.width;
        CGSize newSize = [_txtQues sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
//        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
//            newSize.height = newSize.height - 8;
//        }
        newSize.height = ( newSize.height < 10 ) ? 30 : newSize.height;
        
        CGRect newFrame = _txtQues.frame;
        newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height );
        newFrame.origin.y = -5;
        _txtQues.frame = newFrame;
        
        [self.queAnsView setFrame:CGRectMake(0, newFrame.size.height + newFrame.origin.y , self.queAnsView.frame.size.width, self.queAnsView.frame.size.height)];
        
    }
    else if ([ques rangeOfString:@"<a"].location ==NSNotFound) {
        
        [self.loaderQueImage startAnimating];
        
        @try {
            
            NSLog(@"string contains img!");
            NSLog(@"%@QUESTION ",ques);

           // NSArray* question_split = [[Queries formatStringAns:ques] componentsSeparatedByString: @"<img src="];
            NSArray* question_split = [ques componentsSeparatedByString: @"<img src="];
            
            NSString* question = [question_split objectAtIndex: 0];
            NSLog(@"question[0] %@",question);
            
            NSString* full_url = [question_split objectAtIndex: 1];
            
            //full_url = [full_url stringByReplacingOccurrencesOfString:@"/>" withString:@""];
            
            NSLog(@"full_url[1]%@",full_url);

            
            NSArray* url_split = [full_url componentsSeparatedByString: @"\""];
            NSLog(@"url_split[1] %@",url_split);
            
           // NSString* url = [url_split objectAtIndex: 1];
            url = [url_split objectAtIndex: 1];
            NSLog(@"url_split[1] %@",url);
            
            // urlforZoom=[url stringByReplacingOccurrencesOfString:@"%0A%0A" withString:@""];
            
            urlforZoom=url;
            NSLog(@"urlforZoom= %@",urlforZoom);
            
            NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                           "<head> \n"
                                           "<meta http-equiv=Content-Type content=\"text/html\" charset=\"UTF-8\">"
                                           "<style type=\"text/css\"> \n"
                                           "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                           "p {margin:0px!important;}"
                                           "</style> \n"
                                           "</head> \n"
                                           "<body>%@</body> \n"
                                           "</html>",fontQues,question];
            
            //myDescriptionHTML=[self styledHTMLwithHTML:question];
            
            
            NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[myDescriptionHTML dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
            
            self.txtQues.attributedText = attributedString;
            
            CGFloat fixedWidth = _txtQues.frame.size.width;
            CGSize newSize = [_txtQues sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
//            if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
//                newSize.height = newSize.height - 8;
//            }
            newSize.height = ( newSize.height < 10 ) ? 30 : newSize.height;
            CGRect newFrame = _txtQues.frame;
            newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height );
            newFrame.origin.y = -5;
            _txtQues.frame = newFrame;
            
            
            [self.SubviewForPdf setHidden:YES];
            [self.QuestionImage setHidden:NO];
            [self.imagview setHidden:NO];
            
            float height123;
            height123=[self getHeightfromString:question :QuestionHeight];
            
          //  [self.txtQues setFrame:CGRectMake(0,-5, self.txtQues.frame.size.width, height123)];
            //Set the Position of Imageview According to lenght of Question..

            [self.imagview setFrame:CGRectMake(0, self.txtQues.frame.size.height, self.imagview.frame.size.width, self.imagview.frame.size.height)];
            
            [self.queAnsView setFrame:CGRectMake(0, self.txtQues.frame.size.height+self.imagview.frame.size.height, self.queAnsView.frame.size.width, self.queAnsView.frame.size.height)];
           
                 NSLog(@"IMAGE URL[1]=%@",url);
            
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                //NSString *url;
                //url=@"http://www.contractorsischool.com/course_img/a/test-5/a-test-5-q125-300x255.gif";
                //url=@"http://192.168.0.12/ExamPrep/a/test-5/a-test-5-q017-031.gif";
                //url=@"http://www.contractorsischool.com/course_img/a/test-5/a-test-5-q017-031-300x255.gif";
                
                NSData *data1 = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
                NSLog(@"IMAGE data1[1]=%@",data1);
              
                UIImage *imgQue1=[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: url]]];
                    
               // UIImage *imgQue1=[UIImage imageWithData:data1];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                
                    NSLog(@"Width : %f | Height : %f",imgQue1.size.width,imgQue1.size.height);
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
    else if ([ques rangeOfString:@"<img src="].location == NSNotFound)
    {
        NSLog(@"Contain PDF");
        NSArray* question_split1 = [ques componentsSeparatedByString: @"<a href="];
        NSString* question1 = [question_split1 objectAtIndex: 0];
        NSString* full_url1 = [question_split1 objectAtIndex: 1];
        NSArray* url_split1 = [full_url1 componentsSeparatedByString: @"\""];
        NSString* url1 = [url_split1 objectAtIndex: 1];
        NSLog(@"%@IMAGE URL",url1);
       
        NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                       "<head> \n"
                                       "<meta http-equiv=Content-Type content=\"text/html\" charset=\"UTF-8\">"
                                       "<style type=\"text/css\"> \n"
                                       "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                       "p {margin:0px!important;}"
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
        
//        Set the Position of PDF view According to lenght of Question..
//        float height123;
//        height123=[self getHeightfromString:question1 :QuestionHeight];
//        [self.txtQues setFrame:CGRectMake(0,-5, self.txtQues.frame.size.width, height123)];
        
        CGFloat fixedWidth = _txtQues.frame.size.width;
        CGSize newSize = [_txtQues sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
//        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
//            newSize.height = newSize.height - 8;
//        }
        newSize.height = ( newSize.height < 10 ) ? 30 : newSize.height;
        CGRect newFrame = _txtQues.frame;
        newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height );
        newFrame.origin.y = -5;
        _txtQues.frame = newFrame;
        
        [self.SubviewForPdf setFrame:CGRectMake(0, self.txtQues.frame.size.height -5,
                                                self.SubviewForPdf.frame.size.width,
                                                self.SubviewForPdf.frame.size.height)];
        
        [self.queAnsView setFrame:CGRectMake(0, self.txtQues.frame.size.height -5 + self.SubviewForPdf.frame.size.height,
                                             self.queAnsView.frame.size.width, self.queAnsView.frame.size.height)];
    }
    //BRX
    ans1 =[quesAnsDic objectForKey:@"ans1"];
    ans1 =[ans1 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    ans1 =[ans1 stringByReplacingOccurrencesOfString:@"%2B" withString:@"+"];
    //ans1 =[ans1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    ans1 =[ans1 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    ans2 =[quesAnsDic objectForKey:@"ans2"];
    ans2 =[ans2 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    ans2 =[ans2 stringByReplacingOccurrencesOfString:@"%2B" withString:@"+"];
    //ans2 =[ans4 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    ans2 =[ans2 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    ans3= [quesAnsDic objectForKey:@"ans3"];
    ans3 =[ans3 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    ans3 =[ans3 stringByReplacingOccurrencesOfString:@"%2B" withString:@"+"];
    //ans3 =[ans3 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    ans3 =[ans3 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    ans4 =[quesAnsDic objectForKey:@"ans4"];
    ans4 =[ans4 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    ans4 =[ans4 stringByReplacingOccurrencesOfString:@"%2B" withString:@"+"];
    //ans4 =[ans4 stringByReplacingOccurrencesOfString:@"%25" withString:@"%"];
    //ans4 = [ans4 stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    //ans4 = [ans4 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    ans4 = [ans4 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    
    //ans4 =[ans4 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"BRX ans1Decoded=%@ ans2=%@ ans3=%@ ans4=%@",ans1,ans2,ans3,ans4);
    
    //NSString *rawText = @"Bed Bath & Beyond - URL=http://www.bedbathandbeyond.com/";
    
    NSString *encodedText = encodeToPercentEscapeString(ans4);
    NSLog(@"Encoded text: %@", encodedText);
    NSString *decodedText = decodeFromPercentEscapeString(encodedText);
    NSLog(@"Original text: %@", decodedText);
    
    
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
    
    //BRX FORMAT THE STRING
    
    //ORIG
    
   // NSString *ans1Encoded=encodeToPercentEscapeString(ans1);
   // NSString *ans1Decoded=decodeFromPercentEscapeString(ans1Encoded);
   // NSLog(@"ans1Encoded= %@",ans1Encoded);
   // NSLog(@"ans1Decoded= %@",ans1Decoded);

    
   // NSString *normal1 = [normal stringByRemovingPercentEncoding];
   // NSLog(@"%@", normal1);
    
    //ans1= [ans1 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //ans1= [ans1 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    //ans1= [ans1 stringByReplacingOccurrencesOfString:@"%2B" withString:@"+"];
    
// ********** //
//    ans1 = [self stringByStrippingHTML:ans1];
//    ans2 = [self stringByStrippingHTML:ans2];
//    ans3 = [self stringByStrippingHTML:ans3];
//    ans4 = [self stringByStrippingHTML:ans4];
// ********** //
    
    [self setAnswerInTextview:ans1:ans2:ans3:ans4];
    
    //BRX COMMENTOUT KO
    [self setPositionforAns:ans1 :ans2 :ans3 :ans4];
    
    Explantion = [quesAnsDic objectForKey:@"explanation"];
    
    //Explantion=[Queries formatStringAns:Explantion];
    
    Explantion = [Explantion stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    Explantion = [Explantion stringByReplacingOccurrencesOfString:@"%2B" withString:@"+"];
    Explantion = [Explantion stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //Explantion = [Explantion stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    //Explantion=[Explantion stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //NSString *explain = [Explantion stringByReplacingOccurrencesOfString:@"&nbsp" withString:@" "];
    
    NSLog(@"BRX %@",Explantion);
    
    
    if([Explantion isEqual:[NSNull null]])
    {
        Explantion=@"";
    }
    
   // [self setAnswerInTextview:[Queries formatStringAns:ans1] :[Queries formatStringAns:ans2] :[Queries formatStringAns:ans3] :[Queries formatStringAns:ans4]];
// ********** //
    CGPoint originPoint;
    originPoint.x=0; originPoint.y = 0;
    [self.lblAns1 setContentOffset:originPoint];
    [self.lblAns2 setContentOffset:originPoint];
    [self.lblAns3 setContentOffset:originPoint];
    [self.lblAns4 setContentOffset:originPoint];
// ********** //
    correctAns = [quesAnsDic objectForKey:@"correct"];
    NSUInteger charactercount =  [correctAns length];
    NSLog(@"chartrcount %lu",(unsigned long)charactercount);
    quesAnsDic=[self.TestArray3 objectAtIndex:m];
    
    [self fitScrollContentsView];
}

-(void)setAnswerInTextview:(NSString *) Ans1:(NSString *)Ans2:(NSString *)Ans3:(NSString *)Ans4
{
    
    NSString *myDescriptionHTML1 = [NSString stringWithFormat:@"<html> \n"
                                    "<head> \n"
                                    "<meta http-equiv=Content-Type content=\"text/html\" charset=\"UTF-8\">"
                                    "<style type=\"text/css\"> \n"
                                    "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                    "p {margin:0px!important;}"
                                    "</style> \n"
                                    "</head> \n"
                                    "<body>%@</body> \n"
                                    "</html>",fontAns,Ans1];

    //NSString *myDescriptionHTML1=[self styledHTMLwithHTML:Ans1

    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[myDescriptionHTML1 dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    NSLog(@"Formatted Answer1:%@",myDescriptionHTML1);
    
    self.lblAns1.attributedText = attributedString;
    
    //-----------------------------------------------//
    

    NSString *myDescriptionHTML2 = [NSString stringWithFormat:@"<html> \n"
                                    "<head> \n"
                                    "<meta http-equiv=Content-Type content=\"text/html\" charset=\"UTF-8\">"
                                    "<style type=\"text/css\"> \n"
                                    "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                    "p {margin:0px!important;}"
                                    "</style> \n"
                                    "</head> \n"
                                    "<body>%@</body> \n"
                                    "</html>",fontAns,Ans2];
   
   
    //NSString *myDescriptionHTML2=[self styledHTMLwithHTML:Ans2];
    
     NSAttributedString *attributedString2 = [[NSAttributedString alloc] initWithData:[myDescriptionHTML2 dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
    self.lblAns2.attributedText = attributedString2;
    
    //-----------------------------------------------//
    
    NSString *myDescriptionHTML3 = [NSString stringWithFormat:@"<html> \n"
                                    "<head> \n"
                                    "<meta http-equiv=Content-Type content=\"text/html\" charset=\"UTF-8\">"
                                    "<style type=\"text/css\"> \n"
                                    "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                    "p {margin:0px!important;}"
                                    "</style> \n"
                                    "</head> \n"
                                    "<body>%@</body> \n"
                                    "</html>",fontAns,Ans3];
    
    
    //NSString *myDescriptionHTML3=[self styledHTMLwithHTML:Ans3];
    
    NSAttributedString *attributedString3 = [[NSAttributedString alloc] initWithData:[myDescriptionHTML3 dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
   
    self.lblAns3.attributedText = attributedString3;

    //-----------------------------------------------//
   
    NSString *myDescriptionHTML4 = [NSString stringWithFormat:@"<html> \n"
                                    "<head> \n"
                                    "<meta http-equiv=Content-Type content=\"text/html\" charset=\"UTF-8\">"
                                    "<style type=\"text/css\"> \n"
                                    "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                    "p {margin:0px!important;}"
                                    "</style> \n"
                                    "</head> \n"
                                    "<body>%@</body> \n"
                                    "</html>",fontAns,Ans4];
    
    //myDescriptionHTML4=[self styledHTMLwithHTML:Ans4];
    
    NSAttributedString *attributedString4 = [[NSAttributedString alloc] initWithData:[myDescriptionHTML4 dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    
   NSLog(@"Formatted Question:%@",myDescriptionHTML4);
    
    self.lblAns4.attributedText = attributedString4;
   
    
    
    //BRX WAS HERE
    /*NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                   "<head> \n"
                                   "<style type=\"text/css\"> \n"
                                   "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                   "</style> \n"
                                   "</head> \n"
                                   "<body>%@</body> \n"
                                   //"</html>",fontQues,ques];
                                   "</html>",fontQues,ques];*/
    
    
   // NSString *myDescriptionHTML=[self styledHTMLwithHTML:Ans4];
    /*
    NSAttributedString *attributedString4 = [[NSAttributedString alloc] initWithData:[myDescriptionHTML dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
    */
    
  //  NSLog(@"Formatted Question:%@",myDescriptionHTML);
    
   // self.txtQues.attributedText = attributedString4;
  //  self.lblAns4.attributedText = attributedString4;


    
    //END
    //-----------------------------------------------//
    
    //BRX WAS HERE
    /*CGRect frame = self.SubviewAns1.frame;
    frame.size.height = self.lblAns1.contentSize.height+10;
    self.SubviewAns1.frame = frame;
    
    CGRect frame1 = self.lblAns2.frame;
    frame.size.height = self.lblAns2.contentSize.height+10;
    self.lblAns2.frame = frame1;
    
     CGRect frame2 = self.lblAns1.frame;
    frame.size.height = self.lblAns3.contentSize.height+10;
    self.lblAns3.frame = frame2;

    CGRect frame3 = self.lblAns3.frame;
    frame.size.height = self.lblAns4.contentSize.height+10;
    self.lblAns4.frame = frame3;
    */
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        
    float height123;
    
    height123=[self getHeightfromString:Ans4 :AnswerHeight];

    //LBL1
    CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
   
        CGSize textViewSize = [[self.lblAns1 text] sizeWithFont:[self.lblAns1 font] constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping];

   [self.lblAns1 setFrame:CGRectMake(55, -2, 270, textViewSize.height + height123)];
   
    //LBL2
    //CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
    CGSize textViewSize2 = [[self.lblAns2 text] sizeWithFont:[self.lblAns2 font] constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping];
   [self.lblAns2 setFrame:CGRectMake(55, -2, 270, textViewSize2.height + height123)];
    
    //LBL3
    //CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
    CGSize textViewSize3 = [[self.lblAns3 text] sizeWithFont:[self.lblAns3 font] constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping];
    [self.lblAns3 setFrame:CGRectMake(55, -2, 270, textViewSize3.height + height123)];
    
    //LBL4
   // CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
    CGSize textViewSize4 = [[self.lblAns4 text] sizeWithFont:[self.lblAns4 font] constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping];
        
   [self.lblAns4 setFrame:CGRectMake(55, -2, 270, textViewSize4.height + height123)];

    self.lblAns1.attributedText = attributedString;
  
    self.lblAns2.attributedText = attributedString2;
       
    self.lblAns3.attributedText = attributedString3;

    self.lblAns4.attributedText = attributedString4;
        

    //[self.lblAns1 setText:Ans1];
    //[self.lblAns2 setText:Ans2];
    //[self.lblAns3 setText:Ans3];
    //[self.lblAns4 setText:Ans4];
        
    }
    else
    {
        
        float height123;
        
        height123=[self getHeightfromString:Ans4 :AnswerHeight];

        //LBL1
        CGSize constraintSize = CGSizeMake(380.0f, MAXFLOAT);
        CGSize textViewSize = [[self.lblAns1 text] sizeWithFont:[self.lblAns1 font] constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping ];
        
        [self.lblAns1 setFrame:CGRectMake(100, 2, 570, textViewSize.height+ height123)];
        
        //LBL2
        //CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
        CGSize textViewSize2 = [[self.lblAns2 text] sizeWithFont:[self.lblAns2 font] constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping];
        [self.lblAns2 setFrame:CGRectMake(100, 2, 570, textViewSize2.height + height123)];
        
        //LBL3
        //CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
        CGSize textViewSize3 = [[self.lblAns3 text] sizeWithFont:[self.lblAns3 font] constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping];
        [self.lblAns3 setFrame:CGRectMake(100, 2, 570, textViewSize3.height + height123)];
        
        //LBL4
        // CGSize constraintSize = CGSizeMake(280.0f, MAXFLOAT);
        CGSize textViewSize4 = [[self.lblAns4 text] sizeWithFont:[self.lblAns4 font] constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping];
        [self.lblAns4 setFrame:CGRectMake(100, 2, 570, textViewSize4.height + height123)];
        
        //UIFont *font18=[UIFont fontWithName:@"Eurostile LT" size:18.0];
        //[self.lblAns1 setFont:font18];
        //[self.lblAns2 setFont:font18];
        //[self.lblAns3 setFont:font18];
        //[self.lblAns4 setFont:font18];
        //[self.txtQues setFont:font18];
    
        //ans1 = [ans1 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
        //ans1=[ans1 stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        //Ans1=[self decodeFromPercentEscapeString:Ans1];
       
    
        self.lblAns1.attributedText = attributedString;
        self.lblAns2.attributedText = attributedString2;
        self.lblAns3.attributedText = attributedString3;
        self.lblAns4.attributedText = attributedString4;
        
        
        //[self.lblAns1 setText:Ans1];
        //[self.lblAns2 setText:Ans2];
        //[self.lblAns3 setText:Ans3];
        //[self.lblAns4 setText:Ans4];
    }
}

-(void)setPositionforAns:(NSString *)Ans1:(NSString *)Ans2:(NSString *)Ans3:(NSString *)Ans4
{
    
    float height123;
    
    
    //Answer 1 Height.......
    
    CGFloat fixedWidth = _lblAns1.frame.size.width;
    CGSize newSize = [_lblAns1 sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        newSize.height = newSize.height - 8;
        newSize.height = ( newSize.height < 30 ) ? 30 : newSize.height;
    }else{
        newSize.height = ( newSize.height < 50 ) ? 50 : newSize.height;
    }
    
    ///height123=[self getHeightfromString:Ans1 :AnswerHeight];
    height123= newSize.height;
    
    [self.SubviewAns1 setFrame:CGRectMake(0, 0, self.SubviewAns1.frame.size.width, height123)];
   // [self.SubviewAns1 setFrame:CGRectMake(0, 0, self.SubviewAns1.frame.size.width, self.SubviewAns1.frame.size.height)];
    _btnAnswer1.frame = _lblAns1.frame;
    
    
    //Answer 2 Height.......
    height123=0.0;
    fixedWidth = _lblAns2.frame.size.width;
    newSize = [_lblAns2 sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        newSize.height = newSize.height - 8;
        newSize.height = ( newSize.height < 30 ) ? 30 : newSize.height;
    }else{
        newSize.height = ( newSize.height < 50 ) ? 50 : newSize.height;
    }

    
    //height123=[self getHeightfromString:Ans2 :AnswerHeight];
    height123= newSize.height;
    [self.SubviewAns2 setFrame:CGRectMake(0,self.SubviewAns1.frame.size.height, self.SubviewAns2.frame.size.width, height123)];
    _btnAnswer2.frame = _lblAns2.frame;
    
    //Answer 3 Height.......
    height123=0.0;
    fixedWidth = _lblAns3.frame.size.width;
    newSize = [_lblAns3 sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        newSize.height = newSize.height - 8;
        newSize.height = ( newSize.height < 30 ) ? 30 : newSize.height;
    }else{
        newSize.height = ( newSize.height < 50 ) ? 50 : newSize.height;
    }
    
    //height123=[self getHeightfromString:Ans3 :AnswerHeight];
    height123= newSize.height;
    [self.SubviewAns3 setFrame:CGRectMake(0,self.SubviewAns1.frame.size.height+self.SubviewAns2.frame.size.height, self.SubviewAns3.frame.size.width, height123)];
    _btnAnswer3.frame = _lblAns3.frame;
    
    //Answer 4 Height.......
    height123=0.0;
    fixedWidth = _lblAns4.frame.size.width;
    newSize = [_lblAns4 sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        newSize.height = newSize.height - 8;
        newSize.height = ( newSize.height < 30 ) ? 30 : newSize.height;
    }else{
        newSize.height = ( newSize.height < 50 ) ? 50 : newSize.height;
    }
    
    //height123=[self getHeightfromString:Ans4 :AnswerHeight];
    height123= newSize.height;
    [self.SubviewAns4 setFrame:CGRectMake(0,self.SubviewAns1.frame.size.height+self.SubviewAns2.frame.size.height+self.SubviewAns3.frame.size.height, self.SubviewAns4.frame.size.width, height123)];
    _btnAnswer4.frame = _lblAns2.frame;
    
    /*height123=[self getHeightfromString:Ans1 :AnswerHeight];
    [self.SubviewAns1 setFrame:CGRectMake(0, 0, self.SubviewAns1.frame.size.width, height123)];
    //BRX WAS HERE
    CGRect frame = self.SubviewAns1.frame;
    frame.size.height = self.lblAns1.contentSize.height+2;
    self.SubviewAns1.frame = frame;
    
    height123=[self getHeightfromString:Ans2 :AnswerHeight];
    CGRect frame1 = self.lblAns2.frame;
    frame.size.height = self.lblAns2.contentSize.height+2;
    self.lblAns2.frame = frame1;
    
    height123=[self getHeightfromString:Ans3 :AnswerHeight];
    CGRect frame2 = self.lblAns1.frame;
    frame.size.height = self.lblAns3.contentSize.height+2;
    self.lblAns3.frame = frame2;
    
    height123=[self getHeightfromString:Ans4 :AnswerHeight];
    CGRect frame3 = self.lblAns3.frame;
    frame.size.height = self.lblAns4.contentSize.height+2;
    self.lblAns4.frame = frame3;
    */
    
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
            if([Explantion rangeOfString:@"<img src="].location == NSNotFound)
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
                    
                   //[self.txtExplation setFrame:CGRectMake(0,self.lblExplain.frame.origin.y+self.lblExplain.frame.size.height, self.txtExplation.frame.size.width, self.txtExplation.frame.size.height)];
                    
                    
                    self.SubViewExaplanationImage.frame=CGRectMake(0, self.txtExplation.frame.size.height+self.lblExplain.frame.origin.y+self.lblExplain.frame.size.height, self.SubViewExaplanationImage.frame.size.width, self.SubViewExaplanationImage.frame.size.height);
               
//                    NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
//                                               "<head> \n"
//                                               "<style type=\"text/css\"> \n"
//                                               "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
//                                               "</style> \n"
//                                               "</head> \n"
//                                               "<body>%@</body> \n"
//                                               "</html>",fontAns,Explantion];
                    
                    NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                                   "<head> \n"
                                                   "<meta http-equiv=Content-Type content=\"text/html\" charset=\"UTF-8\">"
                                                   "<style type=\"text/css\"> \n"
                                                   "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                                   "p {margin:0px!important;}"
                                                   "</style> \n"
                                                   "</head> \n"
                                                   "<body>%@</body> \n"
                                                   "</html>",fontAns,Explantion];
                    
                   // myDescriptionHTML=[self convertHtmlPlainText:myDescriptionHTML];
                   // NSString *myDescriptionHTML=[self styledHTMLwithHTML:Explantion];
                   //  myDescriptionHTML=[self attributedStringWithHTML:Explantion];
                    
                    
                    NSLog(@"%@BRX",myDescriptionHTML);
                
                    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[myDescriptionHTML dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
         
                    
                self.txtExplation.attributedText = attributedString;
//                FITS THE label
                CGRect frame = self.txtExplation.frame;
                CGSize constraint = CGSizeMake(CGRectGetWidth(self.txtExplation.frame), 20000.0f);
                CGSize size = [self.txtExplation sizeThatFits:constraint];
                frame.size.height = size.height;
                self.txtExplation.frame = frame;
                
     
                [self.imageWebview setHidden:YES];
                [self.btnExaplainationImage setEnabled:NO];
                }
            }
            else
            {
                [self.lblExplain setHidden:NO];
                [self.imageWebview setHidden:YES];
                [self.btnExaplainationImage setEnabled:YES];
                if([loginType isEqualToString:@"0"])
                {
                    [self.lblExplain setHidden:YES];
                    [self.txtExplation setHidden:YES];
                }
                else
                {
                //CGPoint bottomOffset = CGPointMake(0,self.queAnsView.frame.size.height+500);
                //[ScrollViev setContentOffset:bottomOffset animated:YES];
                NSArray* question_split = [Explantion componentsSeparatedByString: @"<img src="];
                NSString* question = [question_split objectAtIndex: 0];
                NSString* full_url = [question_split objectAtIndex: 1];
                NSArray* url_split = [full_url componentsSeparatedByString: @"\""];
                NSString* url = [url_split objectAtIndex: 1];
              
                    urlforZoomExaplanation=url;
                    
                    NSLog(@"%@",urlforZoomExaplanation);
                    
                    CGRect frame = self.txtExplation.frame;
                    float ExHeight=[self getHeightToExplanation:question :ExplanationHeight];
                    CGFloat screenWidth = frame.size.width-20;
                    
                    
                    self.txtExplation.frame=CGRectMake(0,self.lblExplain.frame.origin.y+self.lblExplain.frame.size.height, self.txtExplation.frame.size.width, ExHeight);
                    NSString *myDescriptionHTML;
//                    @"<html> \n"
//                    "<head> \n"
//                    "<meta http-equiv=Content-Type content=\"text/html\" charset=\"UTF-8\">"
//                    "<style type=\"text/css\"> \n"
//                    "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
//                    "p {margin:0px!important;}"
//                    "</style> \n"
//                    "</head> \n"
//                    "<body>%@</body> \n"
//                    "</html>"
                    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
                        myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                             "<head> \n"
                                             "<style type=\"text/css\"> \n"
                                             "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                             "img {width:%fpx!important; height:auto!important}"
                                             "p {margin:0px!important;}"
                                             "</style> \n"
                                             "</head> \n"
                                             "<body>%@</body> \n"
                                             "</html>",fontAns,screenWidth,Explantion];
                        
                    }else{
                        myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                             "<head> \n"
                                             "<style type=\"text/css\"> \n"
                                             "body {font-family: \"Eurostile LT\"; font-size:%f;}\n"
                                             "p {margin:0px!important;}"
                                             "</style> \n"
                                             "</head> \n"
                                             "<body>%@</body> \n"
                                             "</html>",fontAns,Explantion];
                    }
                    
                    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[myDescriptionHTML dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
                    
                    self.txtExplation.attributedText = attributedString;
                    
                    NSLog(@"%@",attributedString);
                    
                    
                    CGSize constraint = CGSizeMake(CGRectGetWidth(self.txtExplation.frame), self.lblExplain.frame.origin.y+self.lblExplain.frame.size.height);
                    CGSize size = [self.txtExplation sizeThatFits:constraint];
                    frame.size.height = size.height;
                    self.txtExplation.frame = frame;
     
                    self.SubViewExaplanationImage.frame=CGRectMake(0, self.txtExplation.frame.size.height+self.lblExplain.frame.origin.y+self.lblExplain.frame.size.height, self.SubViewExaplanationImage.frame.size.height, self.SubViewExaplanationImage.frame.size.height);
                    
       
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
            
            [self fitScrollContentsView];
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

-(void) fitScrollContentsView{
    CGFloat fixedWidth = _txtExplation.frame.size.width;
    CGSize newSize = [_txtExplation sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    newSize.height = ( newSize.height < 10 ) ? 30 : newSize.height;
    CGRect newFrame = _txtExplation.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height );
    
    CGRect subViewExplanationFrame = _SubviewExamplanation.frame;
    subViewExplanationFrame.size = CGSizeMake(subViewExplanationFrame.size.width, newFrame.origin.y + newFrame.size.height + 5);
    
    CGRect queAnsViewFrame = _queAnsView.frame;
    queAnsViewFrame.size = CGSizeMake(queAnsViewFrame.size.width, subViewExplanationFrame.origin.y + subViewExplanationFrame.size.height + 5);
    
    _queAnsView.frame = queAnsViewFrame;
    _SubviewExamplanation.frame = subViewExplanationFrame;
    _txtExplation.frame = newFrame;
    
    [ScrollViev setContentSize:CGSizeMake(queAnsViewFrame.size.width, queAnsViewFrame.origin.y + queAnsViewFrame.size.height)];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        ScrollViev.contentSize = CGSizeMake(queAnsViewFrame.size.width, queAnsViewFrame.origin.y + queAnsViewFrame.size.height + 760);
    }else{
        ScrollViev.contentSize = CGSizeMake(queAnsViewFrame.size.width, queAnsViewFrame.origin.y + queAnsViewFrame.size.height + 500);
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

//BRX
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
            //length =25;
        }
        else
        {
            length=(temp+2)*17;
            //length=(temp+2)*15;
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
        CGSize labelSize = [cellText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:NSLineBreakByWordWrapping];
        if(labelSize.height <40.0)
        {
            return 60.0;
        }
        else
        {
            float abc= labelSize.height+30;
            length=abc;
        }
        
        return length;
    }
 
}

- (void)textViewDidChange:(UITextView *)textView
{
    CGFloat fixedWidth = textView.frame.size.width;
    CGSize newSize = [textView sizeThatFits:CGSizeMake(fixedWidth, MAXFLOAT)];
    CGRect newFrame = textView.frame;
    newFrame.size = CGSizeMake(fmaxf(newSize.width, fixedWidth), newSize.height);
    textView.frame = newFrame;
    
}

- (NSString *)styledHTMLwithHTML:(NSString *)HTML {
    NSString *style = @"<meta http-equiv=Content-Type content=\"text/html\" charset=\"UTF-8\"><style> body { font-family: 'Eurostile LT'; font-size: 15px; } b {font-family: 'Eurostile LT'; }</style>";
    
    return [NSString stringWithFormat:@"%@%@", style, HTML];
}

- (NSAttributedString *)attributedStringWithHTML:(NSString *)HTML {
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType };
    return [[NSAttributedString alloc] initWithData:[HTML dataUsingEncoding:NSUTF8StringEncoding] options:options documentAttributes:NULL error:NULL];
}

-(NSString*)convertHtmlPlainText:(NSString*)HTMLString{
    
    NSData *HTMLData = [HTMLString dataUsingEncoding:NSUTF8StringEncoding];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithData:HTMLData options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType} documentAttributes:NULL error:NULL];
    NSString *plainString = attrString.string;
    return plainString;
}

// Encode a string to embed in an URL.
NSString* encodeToPercentEscapeString(NSString *string) {
    return (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                            (CFStringRef) string,
                                            NULL,
                                            (CFStringRef) @"!*'();:@&=+$,/?%#[]",
                                            kCFStringEncodingUTF8));
}

// Decode a percent escape encoded string.
NSString* decodeFromPercentEscapeString(NSString *string) {
    return (NSString *)
    CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL,
                                                            (CFStringRef) string,
                                                            CFSTR(""),
                                                            kCFStringEncodingUTF8));
}

-(NSString *)stringByStrippingHTML:(NSString*)str
{
    NSRange r;
    while ((r = [str rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location     != NSNotFound)
    {
        str = [str stringByReplacingCharactersInRange:r withString:@""];
    }
    return str;
}


@end
