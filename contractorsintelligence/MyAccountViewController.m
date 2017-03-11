//
//  MyAccountViewController.m
//  contractorsintelligence
//
//  Created by IBL Infotech on 23/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "MyAccountViewController.h"
#import "UpdateAccountViewController.h"
#import "DashboardOneViewController.h"
#import "CancelTestSubscribeViewController.h"

@interface MyAccountViewController ()
{
    UITextField *oldPasswordField;
    UITextField *newPasswordField;
    UITextField *confirmPasswordField;
    ;}
@end

@implementation MyAccountViewController
@synthesize txtConfirmPassword,txtNewPassword,txtOldPassword;

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
        self = [super initWithNibName:@"MyAccountViewController~ipad" bundle:nibBundleOrNil];
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

- (IBAction)UpdateAccount:(id)sender {
    UpdateAccountViewController * update = [[UpdateAccountViewController alloc]initWithNibName:@"UpdateAccountViewController" bundle:nil];
    [self.navigationController pushViewController:update animated:YES];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==1)
    {
        [self jsonCallforUpdatePassword];
        
    }
    else if (buttonIndex==0)
    {
        self.txtConfirmPassword.placeholder=@"Confirm Password";
        self.txtOldPassword.placeholder=@"Old Password";
        self.txtNewPassword.placeholder=@"New Password";
    }
}
-(void)jsonCallforUpdatePassword
{
    NSString *oldpass=[txtOldPassword text];
    NSString *newpass=[txtNewPassword text];
    NSString *conpass=[txtConfirmPassword text];
    if([oldpass isEqual: @""]||[newpass isEqual:@""]||[conpass isEqual:@""])
        
    {
        UIAlertView *errorAlert=[[UIAlertView alloc] initWithTitle:@"Warning" message:@"All fields are required." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [errorAlert show];
    }
    else if(![newpass isEqualToString:conpass])
    {
        UIAlertView *errorAlert=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Password field is not Mathching With ConfirmPassword field.!." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [errorAlert show];
    }
    else if (![[[NSUserDefaults standardUserDefaults]objectForKey:@"password"] isEqualToString:oldpass])
    {
        UIAlertView *errorAlert=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Old Password field is not Mathching With your Password.!." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [errorAlert show];
    }
    else
    {
        
        if(true)
        {
            NSString *strEmail=[[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
            
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.contractorsischool.com/mobile-services/changepassword.php"]];
            
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
                                                                          message:@"Password Successfully change. . "
                                                                         delegate:self
                                                                cancelButtonTitle:@"ok"
                                                                otherButtonTitles:nil];
                        
                        [message show];
                        [message setTag:101];
                    }
                });
            });
        }
    }
}
- (IBAction)UpadatePassword:(id)sender {
    self.txtNewPassword.text=@"";
    self.txtOldPassword.text=@"";
    self.txtConfirmPassword.text=@"";
    self.txtConfirmPassword.placeholder=@"Confirm Password";
    self.txtOldPassword.placeholder=@"Old Password";
    self.txtNewPassword.placeholder=@"New Password";

    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Update Password" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.SubviewUpdatePassword.frame.size.width, self.SubviewUpdatePassword.frame.size.height)];
    v.backgroundColor = [UIColor clearColor];
    [alert setValue:v forKey:@"accessoryView"];
    [v addSubview:self.SubviewUpdatePassword];
   
    [alert show];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    
        if(textField==txtOldPassword)
        {
            [textField setUserInteractionEnabled:YES];
            [txtNewPassword becomeFirstResponder];;
            
        }
        else if(textField==txtNewPassword)
        {
            [textField setUserInteractionEnabled:YES];
            [txtConfirmPassword becomeFirstResponder];
            
        }
        else if(textField==txtConfirmPassword)
        {
            [textField setUserInteractionEnabled:YES];
            [textField resignFirstResponder];
            
        }

    
       return YES;
}


- (IBAction)BackToDash:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnCancelTest:(id)sender {
    CancelTestSubscribeViewController *cancelTest1=[[CancelTestSubscribeViewController alloc]initWithNibName:@"CancelTestSubscribeViewController" bundle:nil];
    [self.navigationController pushViewController:cancelTest1 animated:YES];
    
}
@end
