//
//  WebViewForOrderViewController.m
//  ExamPrep
//
//  Created by IBL Infotech on 03/11/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "WebViewForOrderViewController.h"
#import "MBProgressHUD.h"
#import "LoginViewController.h"
#import "Contact.h"

@interface WebViewForOrderViewController ()

@end

@implementation WebViewForOrderViewController

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
        self = [super initWithNibName:@"WebViewForOrderViewController~ipad" bundle:nibBundleOrNil];
    }

    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self JsonCallforOrderTest];
    [self.indicatorWebview stopAnimating];
        // Do any additional setup after loading the view from its nib.
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //[self.indicatorWebview stopAnimating];
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)JsonCallforOrderTest
{
    NSString *orderData=self.OrderTestName;
    NSString *userEmail=[[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
    NSString *url=[NSString stringWithFormat:@"https://www.contractorsintelligence.com/mobile/checkoutpage.php?emailtemp=%@&&order_test_name=%@",userEmail,orderData];
    //MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
   /// hud.labelText = @"Loading..";
    //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *url1 = [NSURL URLWithString:[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"%@",url1);
        NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url1];
        //dispatch_async(dispatch_get_main_queue(), ^{
           // [hud hide:YES];
            [self.webview loadRequest:req];
    
       // });
    //});

}
- (IBAction)btnBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)btnLogout:(id)sender {
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
