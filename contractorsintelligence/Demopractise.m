//
//  Demopractise.m
//  contractorsintelligence
//
//  Created by IBL Infotech on 30/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "Demopractise.h"
#import "MBProgressHUD.h"
#import "OnlionTestCell.h"
#import "OnlinTestStep2ViewController.h"
#import "LoginViewController.h"
#import "OnlinTestStep2ViewController.h"
#import "Contact.h"
#import "logoutController.h"

@interface Demopractise (){
    
    //MBProgressHUD *hud;
    
}

@end

@implementation Demopractise


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
        self = [super initWithNibName:@"DemoPractise~iPad" bundle:nibBundleOrNil];
    }

    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.lowandbus setHidden:NO];
    [self.lowandbus setEnabled:YES];
    [self.lockandsec setHidden:NO];
    [self.lockandsec setEnabled:YES];
    [self.lblgeneratengg setHidden:NO];
   self.flageForAccZeroEnableExplnation=@"1";
    // Do any additional setup after loading the view from its nib.
    //self.lockandsec.titleLabel.text=@"A | General Engineering Contractor(Demo Practice Test)";
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        // For iPhone
        self.lowandbus.titleLabel.font =  [UIFont fontWithName:@"Eurostile LT" size:13];
        self.lockandsec.titleLabel.font =  [UIFont fontWithName:@"Eurostile LT" size:13];
        [self.lblgeneratengg setFont:[UIFont fontWithName:@"Eurostile LT" size:13]];
    }
    else
    {
        // For iPad
        self.lowandbus.titleLabel.font =  [UIFont fontWithName:@"Eurostile LT" size:20];
        self.lockandsec.titleLabel.font =  [UIFont fontWithName:@"Eurostile LT" size:20];
        [self.lblgeneratengg setFont:[UIFont fontWithName:@"Eurostile LT" size:20]];
    }

    
    [self jsonCallforTest_id];
}
-(void)viewWillAppear:(BOOL)animated
{
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
- (IBAction)LowAndBuss:(id)sender {
     OnlinTestStep2ViewController *test2 =[[OnlinTestStep2ViewController alloc]initWithNibName:@"OnlinTestStep2ViewController" bundle:nil];
    NSMutableDictionary *diclow=[self.lowAndBussiness objectAtIndex:0];
    test2.test_id1=[diclow objectForKey:@"id"];
//    NSString *strTemp=[diclow objectForKey:@"tital"];
//    strTemp = [strTemp substringToIndex:[strTemp length] - 1];
    
    test2.labelHeading=@"Law and Business(Demo Practice Test)";
    test2.flageForAccZeroEnableExplnation=self.flageForAccZeroEnableExplnation;
    test2.Catagori=@"Law and Business";
    [self.navigationController pushViewController:test2 animated:YES];
    }

- (IBAction)LockAnSec:(id)sender {
    OnlinTestStep2ViewController *test2 =[[OnlinTestStep2ViewController alloc]initWithNibName:@"OnlinTestStep2ViewController" bundle:nil];
    NSMutableDictionary *diclow=[self.generalEngineering objectAtIndex:0];
    test2.test_id1=[diclow objectForKey:@"id"];
    test2.labelHeading=[diclow objectForKey:@"tital"];
    test2.flageForAccZeroEnableExplnation=self.flageForAccZeroEnableExplnation;
    NSString *temp=[diclow objectForKey:@"tital"];
    temp = [temp substringToIndex:[temp length] - 1];
    test2.Catagori=temp;
    [self.navigationController pushViewController:test2 animated:YES];
}

- (IBAction)btnCancel:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)jsonCallforTest_id
{
    NSString *testID=[[NSUserDefaults standardUserDefaults]objectForKey:@"customerid"];
    NSString *strUrl=[NSString stringWithFormat:LEVEL0_DEMOTEST];
    NSURL *loginURL=[NSURL URLWithString:strUrl];
    NSArray *key = [NSArray arrayWithObjects:@"customerid",nil];
    NSArray *values = [NSArray arrayWithObjects:testID,nil];
    NSDictionary *dist = [NSDictionary dictionaryWithObjects:values forKeys:key];
    NSError *er;
    NSData *jsondata = [NSJSONSerialization dataWithJSONObject:dist options:NSJSONWritingPrettyPrinted error:&er];
    NSString *jsonrequest = @"";
    if (! jsondata)
    {
        NSLog(@"Got an error: %@", er);
    }
    else
    {
        jsonrequest = [[NSString alloc]initWithData:jsondata  encoding:NSUTF8StringEncoding];
    }
    NSLog(@"jsonrequest:%@",jsonrequest);
    //Loading symbol method call......................................
    //....................................................................
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading..";
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:loginURL];
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
        if (returndata)
        {
            dist1 = [NSJSONSerialization JSONObjectWithData:returndata options:kNilOptions error:&error];
        }
        else
        {
            NSLog(@"Data not found");
            UIAlertView *message1 = [[UIAlertView alloc] initWithTitle:@"Error"
                                                               message:@"Internet is slow..!!"
                                                              delegate:self
                                                     cancelButtonTitle:@"Ok"
                                                     otherButtonTitles:nil];
            [message1 show];
        }
        NSLog(@"%@",dist1);
        dispatch_async(dispatch_get_main_queue(), ^{
            [hud hide:YES];
            NSLog(@"returnData : %@",dist1);
            if([[dist1 objectForKey:@"Result"]isEqualToString:@"True"])
            {
                self.lowAndBussiness=[dist1 objectForKey:@"DemoTest"];
                self.generalEngineering=[dist1 objectForKey:@"Test_tital"];
                self.generalEngineeringClassification=[dist1 objectForKey:@"classification"];
                NSLog(@"%@",self.generalEngineering);
                NSLog(@"%@",self.lowAndBussiness);
               
                @try {
                    if(self.lowAndBussiness.count==0)
                    {
                        [self.lowandbus setHidden:YES];
                        [self.lowandbus setEnabled:NO];
                    }
                    else
                    {
                        [self.lowandbus setTitle:@"Law and Business(Demo Practice Test)" forState:UIControlStateNormal];
                    }
                    if(self.generalEngineering.count==0)
                    {
                        [self.lockandsec setHidden:YES];
                        [self.lockandsec setEnabled:NO];
                        [self.lblgeneratengg setHidden:YES];
                    }
                    else
                    {
                        [self ButtonSetting];
                    }
                    
                }
                @catch (NSException *exception) {
                    NSLog(@"Error%@",exception);
                    UIAlertView *message1 = [[UIAlertView alloc] initWithTitle:@"Error Occur"
                                                                       message:exception.name
                                                                      delegate:self
                                                             cancelButtonTitle:@"Ok"
                                                             otherButtonTitles:nil];
                    [message1 show];
                }
                
                }
            else
            {
                NSLog(@"ERROR");
            }
        });
    });
}
-(void)ButtonSetting
{
    NSMutableDictionary *temp=[self.generalEngineeringClassification objectAtIndex:0];
    NSString *label2=[NSString stringWithFormat:@"%@ (Demo Practice Test)",[temp objectForKey:@"name"]];
    [self.lblgeneratengg setText:label2];
    
}
                      
@end
