
//  DisplayCorrectionViewController.m
//  contractorsintelligence
//
//  Created by IBL Infotech on 03/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "DisplayCorrectionViewController.h"
#import "MBProgressHUD.h"
#import "DocumentCorrectionTableViewCell.h"

@ interface DisplayCorrectionViewController ()
{
    NSString *fullPathOfDoc;
    MBProgressHUD *hud;
    NSMutableArray *arrDocumentCorrection;
    NSMutableDictionary *DicUpdated;
    NSString *sectionDemo;
    NSMutableArray *arrSection;
    NSMutableArray *arrsectionData;
    NSMutableArray *arrFinalview;
    int n;
    NSMutableArray *arrComments;
    
    
}
@end

@implementation DisplayCorrectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
;{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        // For iPhone
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    } else {
        // For iPad
        self = [super initWithNibName:@"DisplayCorrectionViewController~ipad" bundle:nibBundleOrNil];
    }
    
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    n=0;
    arrDocumentCorrection =[[NSMutableArray alloc]init];
    arrComments=[[NSMutableArray alloc]init];
    arrFinalview =[[NSMutableArray alloc]init];
    DicUpdated=[[NSMutableDictionary alloc]init];
    arrSection=[[NSMutableArray alloc]init];
    [self jsonCallforDocumentReview];
  
    NSLog(@"Doc Name : %@",self.idDocomentCorrection);
    fullPathOfDoc=[NSString stringWithFormat:@"http://www.contractorsintelligence.com/staff/review_document/%@",self.doc_name];

    NSURL *url = [NSURL URLWithString:fullPathOfDoc];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [self.webViewForDoc loadRequest:requestObj];
    self.webViewForDoc.scalesPageToFit=YES;
    
    UIPinchGestureRecognizer *pgr = [[UIPinchGestureRecognizer alloc]
                                     initWithTarget:self action:@selector(handlePinch:)];
    pgr.delegate = self;
    [self.webViewForDoc addGestureRecognizer:pgr];
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer
{
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)closeCurrentView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIWebViewDelegate methods

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
//    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud.labelText = @"Loading..";
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self.indicatorForPdfview stopAnimating];
    //[hud hide:YES];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [self.indicatorForPdfview stopAnimating];
    //[hud hide:YES];
}
#pragma mark -Document Correction methods
-(void)jsonCallforDocumentReview
{
    NSString *url=[NSString stringWithFormat:@"https://www.contractorsintelligence.com/Services/documentreview.php?id=%@",self.idDocomentCorrection];
//    MBProgressHUD *hud1=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
//    hud1.labelText=@"Loading.";
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:60];
        [request setHTTPMethod:@"GET"];
        NSData *returndata = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSError *er;
        NSMutableDictionary *dist1;
        
        if (returndata) {
            dist1 = [NSJSONSerialization JSONObjectWithData:returndata options:kNilOptions error:&er];
        }
        else
        {
            NSLog(@"Data not Found");
        }
                NSLog(@"%@",dist1);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.indicatorForTableview stopAnimating];
//            [hud1 setHidden:YES];
            @try {
                    if ([[dist1 objectForKey:@"Result"]isEqualToString:@"True"]) {
                        
                        arrDocumentCorrection=[dist1 objectForKey:@"Applicationreview"];
                        arrFinalview =[dist1 objectForKey:@"finalview"];
                        arrComments=[dist1 objectForKey:@"comments"];
                        NSLog(@"%@",arrFinalview);
                        NSLog(@"%@",arrDocumentCorrection);
                        NSMutableDictionary *temp=[arrFinalview objectAtIndex:0];
                        NSLog(@"%@",[arrFinalview objectAtIndex:0]);
                            NSString *id1=[temp objectForKey:@"id"];
                            if([id1 isEqualToString:@"1"])
                            {
                                NSMutableDictionary *temp=[arrFinalview objectAtIndex:0];
                                NSMutableArray *arrtemp;
                                arrtemp=[[NSMutableArray alloc]init];
                                [arrtemp addObject:temp];
                                NSLog(@"%@",arrtemp);
                                [arrSection addObject:@"Final_Review2"];
                                [DicUpdated setObject:arrtemp forKey:@"Final_Review2"];
                                n++;
                                NSLog(@"%@",DicUpdated);
                                if(arrDocumentCorrection.count==0 ||[arrDocumentCorrection isEqual:[NSNull null]])
                                {
                                    
                                }
                                else
                                {
                                    [self ArrSeparation:arrDocumentCorrection];
                                }
                            
                            }
                            else if ([id1 isEqualToString:@"3"])
                            {
                                NSMutableDictionary *temp=[arrFinalview objectAtIndex:1];
                                NSMutableArray *arrtemp;
                                arrtemp=[[NSMutableArray alloc]init];
                                [arrtemp addObject:temp];

                                [arrSection addObject:@"Final_Review1"];
                                [DicUpdated setObject:arrtemp forKey:@"Final_Review1"];
                                NSLog(@"%@",DicUpdated);
                                n++;
                                if(arrDocumentCorrection.count==0 ||[arrDocumentCorrection isEqual:[NSNull null]])
                                {
                                    
                                }
                                else
                                {
                                    [self ArrSeparation:arrDocumentCorrection];
                                }
                                
                                NSMutableDictionary *temp1=[arrFinalview objectAtIndex:0];
                                NSMutableArray *arrtemp1;
                                arrtemp1=[[NSMutableArray alloc]init];
                                [arrtemp1 addObject:temp1];

                                [arrSection addObject:@"Final_Review"];
                                [DicUpdated setObject:arrtemp1 forKey:@"Final_Review"];
                                NSLog(@"%@",DicUpdated);

                            }
                        else
                        {
                            [self ArrSeparation:arrDocumentCorrection];
                        }
                        NSLog(@"%@",DicUpdated);
                        NSLog(@"%@",arrSection);
                        [self.tableviewCorrection reloadData];

                    }
                    else
                    {
                        NSLog(@"Not Found");
                    }
            }
            @catch (NSException *exception) {
                NSLog(@"errrrrror%@",exception.name);
            }
    });
    });
    NSLog(@"Message: Json Request");
}
-(void)ArrSeparation:(NSMutableArray *)array1
{
    
    int i;
   
    NSMutableArray *arr2;
    arr2=[[NSMutableArray alloc]init];
    NSString *sec;
    sec=[[array1 objectAtIndex:0] objectForKey:@"section"];
    
    for(i=0;i<array1.count;i++)
    {
        NSMutableDictionary *dic1=[array1 objectAtIndex:i];
        NSLog(@"dictoinary is:%@",dic1);
        NSString *section1=[dic1 objectForKey:@"section"];
        if([section1 isEqualToString:sec])
        {
            [arr2 addObject:dic1];
            NSLog(@"dictoinary is:%@",arr2);
        }
        else
        {
            [arrSection addObject:sec];
            NSLog(@"dic is:%@",[arrSection objectAtIndex:n]);
            [DicUpdated setObject:arr2 forKey:[arrSection objectAtIndex:n]];
            n++;
            arr2=[[NSMutableArray alloc]init];
            
            sec=section1;
            
            [arr2 addObject:dic1];
        }
    }
    [arrSection addObject:sec];
    [DicUpdated setObject:arr2 forKey:[arrSection objectAtIndex:n]];
    NSLog(@"array is:%@",arrSection);
    NSLog(@"dictoinary is:%@",DicUpdated);
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        static NSString *CellIdentifier = @"DocumentCorrectionTable";
    
    DocumentCorrectionTableViewCell *documentCorrectionCell = (DocumentCorrectionTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(documentCorrectionCell==nil)
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DocumentCorrectionTableViewCell" owner:self options:nil];
        documentCorrectionCell = [nib objectAtIndex:0];
            [documentCorrectionCell.txtTextCorrection setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
            [documentCorrectionCell.lblNumber setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
        }
        else
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"DocumentCorrectionTableViewCell~ipad" owner:self options:nil];
            documentCorrectionCell = [nib objectAtIndex:0];
            [documentCorrectionCell.txtTextCorrection setFont:[UIFont fontWithName:@"Eurostile LT" size:19.0]];
            [documentCorrectionCell.lblNumber setFont:[UIFont fontWithName:@"Eurostile LT" size:19.0]];
        }
    }
    [documentCorrectionCell.lblNumber setHidden:NO];
        [documentCorrectionCell.imageSelect setHidden:NO];
    
    [documentCorrectionCell.txtTextCorrection setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
    [documentCorrectionCell.lblNumber setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
    
    NSString *sectionTitle = [arrSection objectAtIndex:indexPath.section];
    arrsectionData = [DicUpdated objectForKey:sectionTitle];
     NSLog(@"arry:%@",arrsectionData);
    NSMutableDictionary *dicCorrectData = [arrsectionData objectAtIndex:indexPath.row];
     NSLog(@"dic:%@",dicCorrectData);
    
    if([sectionTitle isEqualToString:@"Final_Review"]||[sectionTitle isEqualToString:@"Final_Review2"])
    {
        [documentCorrectionCell.lblNumber setHidden:YES];
        [documentCorrectionCell.imageSelect setHidden:YES];
        
        if([[dicCorrectData objectForKey:@"id"]isEqualToString:@"1"])
        {
            
            NSString *text=[dicCorrectData objectForKey:@"text"];
        [documentCorrectionCell.txtTextCorrection setText:text];
        }
        
        if([[dicCorrectData objectForKey:@"id"]isEqualToString:@"3"])
        {
            NSString *heading =[dicCorrectData objectForKey:@"heading"];
            NSString *email=[dicCorrectData objectForKey:@"email"];
            NSString *text=[NSString stringWithFormat:@"\n%@\n\n%@",heading,email];
            NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                           "<head> \n"
                                           "<style type=\"text/css\"> \n"
                                           "body {font-family:Eurostile LT \"\"; font-size:13.0;}\n"
                                           "</style> \n"
                                           "</head> \n"
                                           "<body>%@</body> \n"
                                           "</html>",text];
            NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[myDescriptionHTML dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];
            //self.txtQues.attributedText = attributedString;
            documentCorrectionCell.txtTextCorrection.attributedText=attributedString;
        }
    }
    else if ([sectionTitle isEqualToString:@"Final_Review1"])
    {
        [documentCorrectionCell.lblNumber setHidden:YES];
                [documentCorrectionCell.imageSelect setHidden:YES];
        if([[dicCorrectData objectForKey:@"id"]isEqualToString:@"4"])
        {
            NSString *text =[dicCorrectData objectForKey:@"heading"];
            [documentCorrectionCell.txtTextCorrection setText:text];
        }
    }
    else
    {
        NSString *indexNo=[dicCorrectData objectForKey:@"number"];
        NSString *text=[dicCorrectData objectForKey:@"text"];
        
       
        if([text isEqualToString:@""])
        {
            NSMutableDictionary *temp=[arrComments objectAtIndex:0];
            NSLog(@"%@",temp);
            if([indexNo isEqualToString:@"14.4"])
            {
                text=[temp objectForKey:@"comment_14_4"];
            }
            else if ([indexNo isEqualToString:@"16.3"])
            {
                 text=[temp objectForKey:@"comment_16_3"];
            }
            else if ([indexNo isEqualToString:@"1.6"])
            {
                 text=[temp objectForKey:@"comment_1_6"];
            }
            else if ([indexNo isEqualToString:@"2.1"])
            {
                text=[temp objectForKey:@"comment_2_1"];
            }
            else if ([indexNo isEqualToString:@"9.4"])
            {
                 text=[temp objectForKey:@"comment_9_4"];
            }
            else if ([indexNo isEqualToString:@"C5.3"])
            {
                text=[temp objectForKey:@"comment_C5_3"];
            }
            else if ([indexNo isEqualToString:@"C6.1"])
            {
                 text=[temp objectForKey:@"comment_C6_1"];
            }
            else if ([indexNo isEqualToString:@"C8"])
            {
                text=[temp objectForKey:@"comment_C8"];
            }
            else if ([indexNo isEqualToString:@"C4.1"])
            {
                text=[temp objectForKey:@"comment_C4_1"];
            }
            
        }
        [documentCorrectionCell.lblNumber setText:indexNo];
        [documentCorrectionCell.txtTextCorrection setText:text];
    }
    return documentCorrectionCell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString *sectionTitle = [arrSection objectAtIndex:section];
    NSArray *sectionAnimals = [DicUpdated objectForKey:sectionTitle];
    NSLog(@"section is:%@",DicUpdated);
    NSLog(@"section is:%@",sectionAnimals);
    NSLog(@"section is:%lu",(unsigned long)[sectionAnimals count]);
    return [sectionAnimals count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    NSLog(@"section is:%lu",(unsigned long)[arrSection count]);
    return [arrSection count];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(arrSection.count ==0)
        {
            return @"null";
        }
    else
    {
        NSString *sectionName =[arrSection objectAtIndex:section];
        if([sectionName isEqualToString:@"Final_Review1"])
        {
            NSString *firstname=[[NSUserDefaults standardUserDefaults]  objectForKey:@"firstname"];
            NSString *lastname=[[NSUserDefaults standardUserDefaults]  objectForKey:@"lastname"];
            NSString *text=[NSString stringWithFormat:@"Dear %@ %@",firstname,lastname];
            return text;
        }
        else if ([sectionName isEqualToString:@"Final_Review"])
        {
            return @"";
        }
        else if ([sectionName isEqualToString:@"Final_Review2"])
        {
            return @"Final Review";
        }
        
        return [arrSection objectAtIndex:section];
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *myLabel = [[UILabel alloc] init];
    myLabel.frame = CGRectMake(0, 0, 320, 25);
    myLabel.font = [UIFont fontWithName:@"Eurostile LT Bold" size:15.0];
    myLabel.textAlignment=UITextAlignmentCenter;
    myLabel.text = [self tableView:tableView titleForHeaderInSection:section];
    UIView *headerView = [[UIView alloc] init];
    [headerView addSubview:myLabel];
    return headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *sectionTitle = [arrSection objectAtIndex:indexPath.section];
    arrsectionData = [DicUpdated objectForKey:sectionTitle];
    NSLog(@"arry:%@",arrsectionData);
    NSMutableDictionary *dicCorrectData = [arrsectionData objectAtIndex:indexPath.row];
    NSString *message1;
    if([sectionTitle isEqualToString:@"Final_Review"]||[sectionTitle isEqualToString:@"Final_Review2"]||[sectionTitle isEqualToString:@"Final_Review1"])
    {
        if([[dicCorrectData objectForKey:@"id"]isEqualToString:@"1"
            ])
        {
            NSString *text=[dicCorrectData objectForKey:@"text"];
            message1=text;
            
        }
        if([[dicCorrectData objectForKey:@"id"]isEqualToString:@"4"])
        {
            NSString *text =[dicCorrectData objectForKey:@"heading"];
            NSLog(@"%@",text);
            NSLog(@"%lu",(unsigned long)text.length);
            message1=text;
            
        }
        if([[dicCorrectData objectForKey:@"id"]isEqualToString:@"3"])
        {
            NSString *heading =[dicCorrectData objectForKey:@"heading"];
            NSString *email=[dicCorrectData objectForKey:@"email"];
            NSString *text=[NSString stringWithFormat:@"%@\n%@",heading,email];
            message1=text;
           
        }
    }
    else
    {
         message1 = [dicCorrectData objectForKey:@"text"];
    }
    float height;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        height=[self getHeightfromString:message1 :45];
    }
    else
    {
        height=[self getHeightfromString:message1 :90];
    }
    return height;
}


-(float)getHeightfromString:(NSString *)message:(int)strLength
{
    float length;
    int temp=[message length]/strLength;
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        if(temp==0)
        {
            length =30;
        }
        else
        {
            length=(temp+2)*17;
        }
        NSLog(@"%f",length);
    }
    else
    {
        NSString *cellText = message;
        UIFont *cellFont = [UIFont fontWithName:@"Eurostile LT" size:19.0];
        CGSize constraintSize = CGSizeMake(670.0f, MAXFLOAT);
        CGSize labelSize = [cellText sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        if(labelSize.height <50.0)
        {
            return 50.0;
        }
        else
        {
            float abc= labelSize.height+10;
            length=abc;
        }
            NSLog(@"%f",length);
    }
    return length;
}


@end
