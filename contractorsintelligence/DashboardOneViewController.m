//
//  DashboardOneViewController.m
//  contractorsintelligence
//
//  Created by IBL Infotech on 02/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "DashboardOneViewController.h"
#import "ApplicationTabViewController.h"
#import "TestSubscriptionViewController.h"
#import "MyAccountViewController.h"
#import "LoginViewController.h"
#import "OrderPracticeTestViewController.h"
#import "Contact.h"
#import "MBProgressHUD.h"
#import "AgreementViewController.h"
#import "Queries.h"


@interface DashboardOneViewController ()
{
    
     NSMutableData *responseData;
    
}

@end

@implementation DashboardOneViewController
@synthesize txtConfirmPassword,txtNewPassword;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 //   [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(Logout123:)
//                                                 name:@"logout123"
//                                               object:nil];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        // For iPhone
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    } else {
        // For iPad
        self = [super initWithNibName:@"DashboardOneViewController~ipad" bundle:nibBundleOrNil];
    }
    
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
    [self jsonCallforApplicationView];
   
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // getting an NSString
    NSString *myString = [prefs stringForKey:@"keyToLookupString"];
    
    
    if([myString isEqual:@"TextToSave"])
    {
        NSLog(@"IM HERE");

        [self UpadatePassword];
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        
        // saving an NSString
        [prefs setObject:@"TextToSave1" forKey:@"keyToLookupString"];
        
        // This is suggested to synch prefs, but is not needed (I didn't put it in my tut)
        [prefs synchronize];
        
    }
    else
    {
        
        
    }
 
        responseData = [[NSMutableData alloc]init];
        
        NSString *strUserEmail=[[[NSUserDefaults standardUserDefaults] objectForKey:@"userData"] objectForKey:@"email"];
        
        NSLog(@"requestURL : %@",strUserEmail);
        
        NSString *requestURL=[NSString stringWithFormat:@"https://www.contractorsischool.com/mobile-services/getFirsttimedb.php?Customer_email=%@",strUserEmail];
        
        NSURL *url = [[NSURL alloc] initWithString:requestURL];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        (void)[NSURLConnection connectionWithRequest:request delegate:self];
    

}

-(void) UpadatePassword {
    self.txtNewPassword.text=@"";
    self.txtConfirmPassword.text=@"";
    self.txtConfirmPassword.placeholder=@"Confirm Password";
    self.txtNewPassword.placeholder=@"New Password";
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Update Password" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.SubviewUpdatePassword.frame.size.width, self.SubviewUpdatePassword.frame.size.height)];
    v.backgroundColor = [UIColor clearColor];
    [alert setValue:v forKey:@"accessoryView"];
    [v addSubview:self.SubviewUpdatePassword];
    
    [alert show];
    
}

-(void)jsonCallforUpdatePassword
{
    
    NSString *newpass=[txtNewPassword text];
    NSString *conpass=[txtConfirmPassword text];
    if([newpass isEqual:@""]||[conpass isEqual:@""])
        
    {
        UIAlertView *errorAlert=[[UIAlertView alloc] initWithTitle:@"Warning" message:@"All fields are required." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [errorAlert show];
    }
    else if(![newpass isEqualToString:conpass])
    {
        UIAlertView *errorAlert=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Password field is not Mathching With ConfirmPassword field.!." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [errorAlert show];
    }
    
    /*else if (![[[NSUserDefaults standardUserDefaults]objectForKey:@"password"] isEqualToString:oldpass])
    {
        UIAlertView *errorAlert=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Old Password field is not Mathching With your Password.!." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [errorAlert show];
    }*/
    else
    {
        
        if(true)
        {
            NSString *strEmail=[[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
            
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.contractorsischool.com/mobile-services/changepassword.php"]];
            
            //NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://192.168.0.12/ExamPrep/Services/changepassword.php"]];
            
            NSArray *varName=[[NSArray alloc] initWithObjects:@"email",@"new_password",nil];
            NSArray *varValue=[[NSArray alloc] initWithObjects:strEmail,newpass, nil];
            
            
            NSDictionary *jsonDict=[NSDictionary dictionaryWithObjects:varValue forKeys:varName];
            
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
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                
                // Create the request.
                NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
                
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
                
     
                //4
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    
                    NSLog(@"returnData : %@",dict);
                    
                    if([[dict objectForKey:@"Result"] isEqualToString:@"True"])
                    {
                        NSLog(@"password change.");
                        
                        
                        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                                          message:@"Password successfully changed."
                                                                         delegate:self
                                                                cancelButtonTitle:@"ok"
                                                                otherButtonTitles:nil];
                        
                        [message show];
                        [message setTag:101];
                      
                        
                    }
                    
                    
                    LoginViewController *login1=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
                    [self.navigationController pushViewController:login1 animated:YES];
                });
            });
        }
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

- (IBAction)openApplicationTab:(id)sender {
    
    ApplicationTabViewController *appTabView=[[ApplicationTabViewController alloc] initWithNibName:@"ApplicationTabViewController" bundle:nil];
    [self.navigationController pushViewController:appTabView animated:YES];
}

- (IBAction)openYourTestSubscriptionTab:(id)sender {
    
    TestSubscriptionViewController * test = [[TestSubscriptionViewController alloc]initWithNibName:@"TestSubscriptionViewController" bundle:nil];
    [self.navigationController pushViewController:test animated:YES];
}

- (IBAction)openOrderOnlineTests:(id)sender {
    OrderPracticeTestViewController *orderpractice1=[[OrderPracticeTestViewController alloc]initWithNibName:@"OrderPracticeTestViewController" bundle:nil];
    [self.navigationController pushViewController:orderpractice1 animated:YES];
}

- (IBAction)openSettingsTab:(id)sender {
    MyAccountViewController * account = [[MyAccountViewController alloc]initWithNibName:@"MyAccountViewController" bundle:nil];
    [self.navigationController pushViewController:account animated:YES];
    
}
-(void)jsonCallforApplicationView
{
    NSString *strEmail=[[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
    NSString *url=[NSString stringWithFormat:@"%@countapplicationview.php?email=%@",SERVICEPATH,strEmail];
    [self.indicatorForTag startAnimating];
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
            
            [self.indicatorForTag stopAnimating];
            @try {
                if ([[dist1 objectForKey:@"Result"]isEqualToString:@"True"]) {
                    NSArray *test123=[dist1 objectForKey:@"applicationview"];
                    if(test123.count==0 || [test123 isEqual:[NSNull null]])
                    {
                        [self.lblApplication setText:@"(0)"];
                        
                        
                   
                    }
                    else
                    {
                    NSMutableDictionary *temp=[test123 objectAtIndex:0];
                                   
                    NSString *test=[temp objectForKey:@"application_view"];
                    NSString *test1=[NSString stringWithFormat:@"(%@)",test];
                    [self.lblApplication setText:test1];
                        
                        UILocalNotification *localNotification = [[UILocalNotification alloc] init]; //Create the localNotification object
                       // [localNotification setFireDate:[NSDate dateWithTimeIntervalSinceNow:[datePicker countDownDuration]]]; //Set the date when the alert will be launched using the date adding the time the user selected on the timer
                        [localNotification setAlertAction:@"Launch"]; //The button's text that launches the application and is shown in the alert
                        [localNotification setAlertBody:@"Hello"]; //Set the message in the notification from the textField's text
                        [localNotification setHasAction: YES]; //Set that pushing the button will launch the application
                        [localNotification setApplicationIconBadgeNumber:[[UIApplication sharedApplication] applicationIconBadgeNumber]]; //Set the Application Icon Badge Number of the application's icon to the current Application Icon Badge Number plus 1
                        
                        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification]; //Schedule the notification with the system
                         //[localNotification release];
                 
                        [NSNotificationCenter defaultCenter];
                        
                        
                    }
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
    
    if(buttonIndex==1)
    {
        [self jsonCallforUpdatePassword];
        
    }
    else if (buttonIndex==0)
    {
        self.txtConfirmPassword.placeholder=@"Confirm Password";
        self.txtNewPassword.placeholder=@"New Password";
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


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error  {
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response   {
    [responseData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data  {
    [responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection    {
    

    
    NSString *responseString = [[NSString alloc]initWithData:responseData encoding:NSUTF8StringEncoding];
    
    // NSLog(@"%@",responseString);
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData //1
                          
                          options:kNilOptions
                          error:&error];
    
    NSArray* firsttime = [json objectForKey:@"Firsttime_value_of_student_value"]; //2
    
    //NSArray* agreement = [json objectForKey:@"Agreement_body"]; //2
    
    NSLog(@"firsttime: %@", firsttime); //3
  //  NSLog(@"Agreement_body: %@", agreement); //3
   
    NSString *isFirsttime = [json objectForKey:@"Firsttime_value_of_student_value"];

    if(![isFirsttime isEqualToString:@"0"])
    {
        NSLog(@"IM HERE");
        
         AgreementViewController *agreementView=[[AgreementViewController alloc] initWithNibName:@"AgreementViewController" bundle:nil];
         [self.navigationController pushViewController:agreementView animated:YES];
        
        // [self UpadatePassword];
        
        
    }
    else
    {
       
        
    }
}

@end
