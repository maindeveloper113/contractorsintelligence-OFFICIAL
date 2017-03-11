//
//  ForgotPasswordViewController.m
//  contractorsintelligence
//
//  Created by IBL Infotech on 02/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "ForgotPasswordViewController.h"
#import "Contact.h"
#import "MBProgressHUD.h"

@interface ForgotPasswordViewController ()

@end

@implementation ForgotPasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        // For iPhone
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    } else {
        // For iPad
        self = [super initWithNibName:@"ForgotPasswordViewController~ipad" bundle:nibBundleOrNil];
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
    
    [self.txtEmail setFont:[UIFont fontWithName:@"Agency FB" size:18.0]];
    [self.lblMessage setFont:[UIFont fontWithName:@"Agency FB" size:17.0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (IBAction)submitRequest:(id)sender {
    
    [self.txtEmail resignFirstResponder];
    
    NSString *strEmail=[self.txtEmail text];
    //strEmail = [strEmail lowercaseString];
    strEmail=[strEmail stringByTrimmingCharactersInSet:
             [NSCharacterSet whitespaceCharacterSet]];
    
    if([strEmail isEqualToString:@""])
    {
        UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"Error"
                                                               message:@"Email can't be empty.."
                                                              delegate:self
                                                     cancelButtonTitle:@"Ok"
                                                     otherButtonTitles:nil,nil];
        [alertMessage show];
    }
    else
    {
        [self sendPassword:strEmail];
    }    
    
}

- (IBAction)cancelRequestion:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) sendPassword : (NSString *) userEmail
{
    userEmail = [userEmail lowercaseString];

    NSArray *keys=[NSArray arrayWithObjects:@"email",nil];
    NSArray *values=[NSArray arrayWithObjects:userEmail,nil];
    
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
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:SEND_PASSWORD]];
        
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
            //code executed on the main queue
            //5
            
            [hud hide:YES];
            NSLog(@"returnData : %@",dict);
            if([[dict objectForKey:@"Result"] isEqualToString:@"true"])
            {
                [self sendPasswordSucceed];
            }
            else
            {
                [self sendPasswordFailed];
            }
            
        });
        
    });

}

-(void) sendPasswordFailed
{
    UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"Sending password failed!"
                                                           message:@"Email doesn't exists."
                                                          delegate:nil
                                                 cancelButtonTitle:@"Ok"
                                                 otherButtonTitles:nil,nil];
    [alertMessage show];
}

-(void) sendPasswordSucceed
{
    UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"Message"
                                                           message:@"Password is send successfully."
                                                          delegate:self
                                                 cancelButtonTitle:@"Ok"
                                                 otherButtonTitles:nil,nil];
    [alertMessage setTag:101];
    [alertMessage show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if([alertView tag]==101)
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
