//
//  EndTestViewController.m
//  contractorsintelligence
//
//  Created by IBL Infotech on 22/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "EndTestViewController.h"
#import "TestSubscriptionViewController.h"
#import "DashboardOneViewController.h"
#import "LoginViewController.h"
#import "HomeViewController.h"
#import "MBProgressHUD.h"
#import "Contact.h"

@interface EndTestViewController (){
    NSArray * correctedAnswer;
}

@end

@implementation EndTestViewController

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
        self = [super initWithNibName:@"EndTestViewController~ipad" bundle:nibBundleOrNil];
    }
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
   
    [super viewDidLoad];
    NSDictionary *attributes = @{NSForegroundColorAttributeName: [UIColor blackColor], NSBackgroundColorAttributeName: [UIColor clearColor], NSUnderlineStyleAttributeName: @1,NSUnderlineColorAttributeName:[UIColor blueColor]};
    
    NSAttributedString *myString = [[NSAttributedString alloc] initWithString:@" Dashboard" attributes:attributes];
    self.btnDash.titleLabel.attributedText=myString;
    // Do any additional setup after loading the view from its nib.
    [self setFont];
        
    

    
    self.lbltestName.text = self.TestTitle;
    self.lbltotalQues.text = self.TotalQues;
    self.lblPercentage.text = self.precentage;
    self.lblCorrect.text = self.correctans;
    self.lblAttempt.text = self.Attempt;
    self.lblCatagory.text = self.Catagory;
    self.lblCorrect.text = self.correctFill;
     self.lblInCorrect.text = self.incorrectFill;

    NSString * MyResult = self.Result;
    int value = [MyResult intValue];
    
    if (value >= 80) {
        
        self.lblResult.text = [NSString stringWithFormat:@"Pass"];
        self.lblResult.textColor  = [UIColor greenColor];
        
    }
        else{
            
            self.lblResult.text = [NSString stringWithFormat:@"Fail"];
        }
        
    }
    //self.lblResult.text = self.Result;
    
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(void)setFont
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        // For iPhone
        [self.lblResult setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lbltestName setFont:[UIFont fontWithName:@"Eurostile LT" size:12.0]];
        [self.lblCorrect setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblInCorrect setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblCatagory setFont:[UIFont fontWithName:@"Eurostile LT" size:12.0]];
        [self.lblAttempt setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lbltotalQues setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblPercentage setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblResult1 setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lbltestName1 setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblCorrect1 setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblInCorrect1 setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblCatagory1 setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblAttempt1 setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lbltotalQues1 setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        [self.lblPercentage1 setFont:[UIFont fontWithName:@"Eurostile LT" size:14.0]];
        self.btnDash.titleLabel.font =  [UIFont fontWithName:@"Eurostile LT" size:14];
    }
    else
    {
        // For iPad
        [self.lblResult setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lbltestName setFont:[UIFont fontWithName:@"Eurostile LT" size:18.0]];
        [self.lblCorrect setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblInCorrect setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblCatagory setFont:[UIFont fontWithName:@"Eurostile LT" size:18.0]];
        [self.lblAttempt setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lbltotalQues setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblPercentage setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblResult1 setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lbltestName1 setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblCorrect1 setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblInCorrect1 setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblCatagory1 setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblAttempt1 setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lbltotalQues1 setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        [self.lblPercentage1 setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
        self.btnDash.titleLabel.font =  [UIFont fontWithName:@"Eurostile LT" size:20.0];

    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)BackToDashboard:(id)sender {
    NSString *userType=[[NSUserDefaults standardUserDefaults]objectForKey:@"account_type"];
    if([userType isEqualToString:@"0"])
    {
        HomeViewController *home1=[[HomeViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
        [self.navigationController pushViewController:home1 animated:YES];
    }
    else
    {
        DashboardOneViewController * test = [[DashboardOneViewController alloc]initWithNibName:@"DashboardOneViewController" bundle:nil];
        [self.navigationController pushViewController:test animated:YES];
    }

    
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
