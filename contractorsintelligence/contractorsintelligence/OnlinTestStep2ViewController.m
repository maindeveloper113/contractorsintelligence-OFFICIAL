//
//  OnlinTestStep2ViewController.m
//  contractorsintelligence
//
//  Created by IBL Infotech on 18/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "OnlinTestStep2ViewController.h"
#import "OnlionTestViewController.h"
#import "OnlionTestStep3ViewController.h"
#import "MBProgressHUD.h"
#import "LoginViewController.h"
#import "Contact.h"

@interface OnlinTestStep2ViewController ()
{
    NSArray *countQue;
    NSArray * passingscore;
    MBProgressHUD * hud;
}

@end

@implementation OnlinTestStep2ViewController

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
        self = [super initWithNibName:@"OnlinTestStep2ViewController~ipad" bundle:nibBundleOrNil];
    }

    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    countQue = [[NSArray alloc]init];
    // Do any additional setup after loading the view from its nib.
    [self setFont];
    NSLog(@"%@",self.test_id1);
    //NSString *userType=[[NSUserDefaults standardUserDefaults]objectForKey:@"account_type"];
    if([self.flageForAccZeroEnableExplnation isEqualToString:@"1"])
    {
       [self Test_ExamForDemo];
    }
    else
    {
         [self TestExam2];
    }
    self.lblTestName.text=self.labelHeading;
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
        // For iPhone
        [self.lblTestName setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
        [self.lblFullScore setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
        [self.lblScore setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
        [self.lbltotal setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
        [self.lblTotalQuestion setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
        [self.lbltimeLimit setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
        [self.lblPassingScore setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
        [self.lblPassing setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
        [self.lbl80 setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
        [self.lbl120 setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
        [self.lblLimit setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
    }
    else
    {
        // For iPad
        [self.lblTestName setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblFullScore setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblScore setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lbltotal setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblTotalQuestion setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lbltimeLimit setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblPassingScore setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblPassing setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lbl80 setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lbl120 setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblLimit setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
    }
}
-(void)Test_ExamForDemo
{
    NSString *requestURL=[NSString stringWithFormat:@"https://www.contractorsintelligence.com/Services/get_level0_testdetail.php"];
    NSLog(@"%@",self.test_id1);
    
    NSArray *key = [NSArray arrayWithObjects:@"test_title_id",nil];
    
    NSArray *values = [NSArray arrayWithObjects:self.test_id1,nil];
    
    NSDictionary *dist = [NSDictionary dictionaryWithObjects:values forKeys:key];
    
    NSError *er;
    NSData *jsondata = [NSJSONSerialization dataWithJSONObject:dist options:NSJSONWritingPrettyPrinted error:&er];
    
    NSString *jsonrequest = @"";
    
    
    if (! jsondata) {
        NSLog(@"Got an error: %@", er);
    } else {
        
        jsonrequest = [[NSString alloc]initWithData:jsondata  encoding:NSUTF8StringEncoding];
    }
    NSLog(@"jsonrequest:%@",jsonrequest);
    
    //Loading symbol method call......................................
    //....................................................................
    
    
    MBProgressHUD *hud1 = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud1.labelText = @"Loading..";
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
        
        NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestURL]];
        
        NSData *requestdata = [jsonrequest dataUsingEncoding:NSUTF8StringEncoding];
        
        [req setHTTPMethod:@"POST"];
        [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [req setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestdata length]] forHTTPHeaderField:@"Content-Length"];
        [req setHTTPBody: requestdata];
        
        
        NSData *returndata = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
        
        
        NSLog(@"returndata%@",returndata);
        NSError *error;
        NSMutableDictionary *dist1;
        
        if (returndata) {
            dist1 = [NSJSONSerialization JSONObjectWithData:returndata options:kNilOptions error:&error];
        }
        else{
            NSLog(@"Data not found");
        }
        NSLog(@"%@",dist1);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"returnData : %@",dist1);
            [hud1 hide:YES];
            
            self.TestArray2 = [dist1 objectForKey:@"question"];
            NSNumber *someNumber =@(self.TestArray2.count);
            NSString *someString = [someNumber stringValue];
            self.lblTotalQuestion.text = someString;
            self.TestArray2 = [dist1 objectForKey:@"question"];
            NSNumber *someNumber1 =@(self.TestArray2.count);
            NSString *someString1 = [someNumber1 stringValue];
            self.lbl120.text = someString1;
            
            
            NSInteger arrCount=[self.TestArray2 count];
            //NSLog(@"score %d",arrCount);
            NSInteger passScore= ((80 *arrCount)/100);
            
            NSNumber *stringNuber1 =@(passScore);
            NSString *string1=[stringNuber1 stringValue];
            self.lblPassingScore.text =string1;
            [self.TblStep2 reloadData];
        });
        
    });

}

-(void)TestExam2 {

    NSString *requestURL=[NSString stringWithFormat:@"http://www.contractorsintelligence.com/Services/get_test_subtests_details.php"];
    
    NSArray *key = [NSArray arrayWithObjects:@"test_id",nil];
    
    NSArray *values = [NSArray arrayWithObjects:self.test_id1,nil];
    
    NSDictionary *dist = [NSDictionary dictionaryWithObjects:values forKeys:key];
    
    NSError *er;
    NSData *jsondata = [NSJSONSerialization dataWithJSONObject:dist options:NSJSONWritingPrettyPrinted error:&er];
    
    NSString *jsonrequest = @"";
    
    
    if (! jsondata) {
        NSLog(@"Got an error: %@", er);
    } else {
        
        jsonrequest = [[NSString alloc]initWithData:jsondata  encoding:NSUTF8StringEncoding];
    }
    NSLog(@"jsonrequest:%@",jsonrequest);
    
    //Loading symbol method call......................................
    //....................................................................
    
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading..";
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
        
        NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestURL]];
        
        NSData *requestdata = [jsonrequest dataUsingEncoding:NSUTF8StringEncoding];
        
        [req setHTTPMethod:@"POST"];
        [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [req setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestdata length]] forHTTPHeaderField:@"Content-Length"];
        [req setHTTPBody: requestdata];
        
        
        NSData *returndata = [NSURLConnection sendSynchronousRequest:req returningResponse:nil error:nil];
        
        
        NSLog(@"returndata%@",returndata);
        NSError *error;
        NSMutableDictionary *dist1;
        
        if (returndata) {
            dist1 = [NSJSONSerialization JSONObjectWithData:returndata options:kNilOptions error:&error];
        }
        else{
            NSLog(@"Data not found");
        }
        NSLog(@"%@",dist1);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSLog(@"returnData : %@",dist1);
             [hud hide:YES];
            
            self.TestArray2 = [dist1 objectForKey:@"Examsdetails"];
            NSNumber *someNumber =@(self.TestArray2.count);
            NSString *someString = [someNumber stringValue];
            self.lblTotalQuestion.text = someString;
            self.TestArray2 = [dist1 objectForKey:@"Examsdetails"];
            NSNumber *someNumber1 =@(self.TestArray2.count);
            NSString *someString1 = [someNumber1 stringValue];
            self.lbl120.text = someString1;

            
            NSInteger arrCount=[self.TestArray2 count];
            //NSLog(@"score %d",arrCount);
            NSInteger passScore= ((80 *arrCount)/100);
            
            NSNumber *stringNuber1 =@(passScore);
            NSString *string1=[stringNuber1 stringValue];
            self.lblPassingScore.text =string1;
            [self.TblStep2 reloadData];
        });
        
    });

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.TestArray2.count;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (IBAction)btnBackToStep1:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (IBAction)btnStartEXam:(id)sender {
    OnlionTestStep3ViewController *step3 = [[OnlionTestStep3ViewController alloc]initWithNibName:@"OnlionTestStep3ViewController" bundle:nil];
    step3.lblheading = self.lblTestName.text;
    step3.TestArray3 = self.TestArray2;
    step3.MainCatagary = self.Catagori;
    NSLog(@"hellloo%@",step3.TestArray3);
    step3.flageForAccZeroEnableExplnation=self.flageForAccZeroEnableExplnation;
    [self.navigationController pushViewController:step3 animated:YES];
    
    
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

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
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
    
    NSLog(@"%@",jsonRequest);
    
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


@end
