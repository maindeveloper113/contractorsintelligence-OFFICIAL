//  LoginViewController.m
//  contractorsintelligence
//
//  Created by IBL Infotech on 29/09/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "LoginViewController.h"
#import "RegistrationViewController.h"
#import "MBProgressHUD.h"
#import "Contact.h"
#import "HomeViewController.h"
#import "ForgotPasswordViewController.h"
#import "DashboardOneViewController.h"
#import <AudioToolbox/AudioToolbox.h>


@interface LoginViewController ()
{
    int direction;
    int shakes;
    int directionY;
}

@end

@implementation LoginViewController

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
        self = [super initWithNibName:@"LoginViewController~ipad" bundle:nibBundleOrNil];
    }
    
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.txtEmail setFont:[UIFont fontWithName:@"Eurostile LT" size:18.0]];
    [self.txtPassword setFont:[UIFont fontWithName:@"Eurostile LT" size:18.0]];
   
    
    // Do any additional setup after loading the view from its nib.
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField==self.txtEmail)
    {
        [self.txtPassword becomeFirstResponder];
        return NO;
    }
    [self.txtPassword resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signUP:(id)sender {

    RegistrationViewController *regScreen=[[RegistrationViewController alloc] initWithNibName:@"RegistrationViewController" bundle:nil];
    
    [self presentViewController:regScreen animated:YES completion:nil];
}
- (IBAction)signIN:(id)sender {

    [self.txtEmail resignFirstResponder];
    [self.txtPassword resignFirstResponder];
    
    NSString *strEmail=[self.txtEmail text];
    NSString *strPassword=[self.txtPassword text];
    
    if([self validateForm])
    {
        [self serviceLogin:strEmail password:strPassword];
    }
    else
    {
        UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"Error"
                                                               message:@"Fields can't be empty.."
                                                              delegate:self
                                                     cancelButtonTitle:@"Ok"
                                                     otherButtonTitles:nil,nil];
        [alertMessage show];
    }
}

- (IBAction)forgotPassword:(id)sender {
    
    ForgotPasswordViewController *forgotPassView=[[ForgotPasswordViewController alloc] initWithNibName:@"ForgotPasswordViewController" bundle:nil];
    [self presentViewController:forgotPassView animated:YES completion:nil];
}

-(BOOL) validateForm
{
    NSString *strEmail=[self.txtEmail text];
    NSString *strPassword=[self.txtPassword text];
    
    strEmail=[strEmail stringByTrimmingCharactersInSet:
              [NSCharacterSet whitespaceCharacterSet]];
    
    strPassword=[strPassword stringByTrimmingCharactersInSet:
              [NSCharacterSet whitespaceCharacterSet]];
    
    if(!strEmail || !strPassword || [strEmail isEqualToString:@""] || [strPassword isEqualToString:@""])
    {
        return NO;
    }
    return YES;
}

-(void) serviceLogin:(NSString *) strEmail password : (NSString *) strPassword
{
    NSArray *keys=[NSArray arrayWithObjects:@"email",@"password",nil];
    NSArray *values=[NSArray arrayWithObjects:strEmail,strPassword,nil];
    
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
        //code executed in the background
        //2
        
        // Create the request.
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:LOGIN]];
        
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
            UIAlertView *alertError=[[UIAlertView alloc] initWithTitle:@"Warning" message:@"Data not found." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alertError show];
        }
        
        //4
        dispatch_async(dispatch_get_main_queue(), ^{
            //code executed on the main queue
            //5
            [hud hide:YES];
            
            NSLog(@"returnData : %@",dict);
            
            if([[dict objectForKey:@"Result"] isEqualToString:@"True"] )
            {
                //[self loginSucceed];
                NSArray *tempArr=[dict objectForKey:@"userdetail"];
                if([tempArr isMemberOfClass:[NSNull class]])
                {
                UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"Login failed!"
                                              message:@"Data not Found.."
                                              delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil,nil];
                    [alertMessage show];
                }
                else
                {
                NSMutableDictionary *userDict=[tempArr objectAtIndex:0];
                NSLog(@"Before : %@",userDict);
                
                
                NSArray*userDictkeys=[userDict allKeys];
                
                NSMutableArray *userdataON = [dict objectForKey:@"userdetail"];
                NSDictionary *userinfoS = [userdataON objectAtIndex:0];
                NSUserDefaults *userDefaultS = [[NSUserDefaults standardUserDefaults]init];
                [userDefaultS setObject:[self.txtEmail text]forKey:@"email"];
                [userDefaultS setObject:[userinfoS objectForKey:@"name"]forKey:@"firstname"];
                [userDefaultS setObject:[userinfoS objectForKey:@"lname"]forKey:@"lastname"];
                [userDefaultS setObject:[userinfoS objectForKey:@"address"]forKey:@"address"];
                 [userDefaultS setObject:[userinfoS objectForKey:@"state"]forKey:@"state"];
                 [userDefaultS setObject:[userinfoS objectForKey:@"city"]forKey:@"city"];
                 [userDefaultS setObject:[userinfoS objectForKey:@"zip"]forKey:@"zip"];
                 [userDefaultS setObject:[userinfoS objectForKey:@"password"]forKey:@"password"];
                 [userDefaultS setObject:[userinfoS objectForKey:@"Classification"]forKey:@"Classification"];
                [userDefaultS setObject:[userinfoS objectForKey:@"mobilenum"]forKey:@"mobilenum"];
                [userDefaultS setObject:[userinfoS objectForKey:@"customerid"] forKey:@"customerid"];
                 [[NSUserDefaults standardUserDefaults] setObject:[userinfoS objectForKey:@"account_type"] forKey:@"account_type"];
                
                [userDefaultS synchronize];

                NSMutableDictionary *newUserData=[[NSMutableDictionary alloc] init];
                
                for(int i=0;i<[userDictkeys count];i++)
                {
                    if([userDict objectForKey:userDictkeys[i]]==[NSNull null])
                    {
                        NSLog(@"%@",userDictkeys[i]);
                    }
                    else
                    {
                        [newUserData setObject:[userDict objectForKey:userDictkeys[i]] forKey:userDictkeys[i]];
                    }
                }
                
                NSLog(@"After : %@",newUserData);
                
                [[NSUserDefaults standardUserDefaults] setObject:newUserData forKey:@"userData"];
                [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"isLogin"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                if([[userDict objectForKey:@"account_type"] isEqualToString:@"0"])
                {
                    NSLog(@"0 type user.");
                    NSString *account_Type=[userDict objectForKey:@"account_type"];
                    //[self jsonCallforDeviceToken:account_Type];
                    HomeViewController *homeView=[[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
                    [self.navigationController pushViewController:homeView animated:YES];
                }
                else
                {
                    NSLog(@"1 type user.");
                    NSString *account_Type=[userDict objectForKey:@"account_type"];
                    //[self jsonCallforDeviceToken:account_Type];
                    DashboardOneViewController *dashOneView=[[DashboardOneViewController alloc] initWithNibName:@"DashboardOneViewController" bundle:nil];
                    [self.navigationController pushViewController:dashOneView animated:YES];
                   
                }
            }
            }
            else
            {
                [self loginFailed];
            }
            
        });
        
    });
}

-(void)jsonCallforDeviceToken:(NSString *)account_type
{
    NSString *email=[[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
    NSString *deviceId=[[NSUserDefaults standardUserDefaults]objectForKey:@"deviceToken"];
    NSString *deviceOs=@"iPhone";
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
        //code executed in the background
        //2
        
        
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
                if([account_type isEqualToString:@"0"])
                {
                    HomeViewController *homeView=[[HomeViewController alloc] initWithNibName:@"HomeViewController" bundle:nil];
                    [self.navigationController pushViewController:homeView animated:YES];
                }
                else
                {
                    DashboardOneViewController *dashOneView=[[DashboardOneViewController alloc] initWithNibName:@"DashboardOneViewController" bundle:nil];
                    [self.navigationController pushViewController:dashOneView animated:YES];
                }

            }
            else
            {
                [self loginFailed];
            }
            
        });
        
    });

    
    
}

-(void) loginFailed
{
    direction = 1;
    directionY=1;
    shakes = 0;
    //[self shake:self.txtPassword];
    //[self shake:self.txtEmail];
    //[self shake:self.btnEmail];
    //[self shake:self.btnPassword];
   
    UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"Login failed!"
                                                           message:@"Wrong credentials.."
                                                          delegate:self
                                                 cancelButtonTitle:@"Ok"
                                                 otherButtonTitles:nil,nil];
    [alertMessage show];
}
-(void)shake:(UIView *)theOneYouWannaShake
{
    [UIView animateWithDuration:0.05 animations:^
     {
         theOneYouWannaShake.transform = CGAffineTransformMakeTranslation(10*direction, 3*directionY);
         
     }
                     completion:^(BOOL finished)
     {
         if(shakes >= 25)
         {
             theOneYouWannaShake.transform = CGAffineTransformIdentity;
             return;
         }
         shakes++;
         directionY=directionY * -1;
         direction = direction * -1;
         [self shake:theOneYouWannaShake];
     }];
}


-(void) loginSucceed
{
    UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"Message"
                                                           message:@"Login successfully."
                                                          delegate:self
                                                 cancelButtonTitle:@"Ok"
                                                 otherButtonTitles:nil,nil];
    [alertMessage show];
}

@end