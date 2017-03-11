//
//  OrderPracticeTestViewController.m
//  ExamPrep
//
//  Created by IBL Infotech on 03/11/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "OrderPracticeTestViewController.h"
#import "MBProgressHUD.h"
#import "NIDropDown.h"
#import "WebViewForOrderViewController.h"
#import "LoginViewController.h"
#import "Contact.h"

@interface OrderPracticeTestViewController ()
{
    NSMutableArray *classes;
    NSMutableArray *arrClassDescription;
}
@end

@implementation OrderPracticeTestViewController

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
        self = [super initWithNibName:@"OrderPracticeTestViewController~ipad" bundle:nibBundleOrNil];
    }

    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    classes=[[NSMutableArray alloc]init];
    arrClassDescription=[[NSMutableArray alloc]init];
    [self jsonCallforOrderPracticeTest];
    // Do any additional setup after loading the view from its nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)jsonCallforOrderPracticeTest
{
    NSURL *loginURL=[NSURL URLWithString:GETCLASSIFICATION];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading..";
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:loginURL];
        //NSData *requestdata = [jsonrequest dataUsingEncoding:NSUTF8StringEncoding];
        [req setHTTPMethod:@"POST"];
        [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        NSData *response = [NSURLConnection sendSynchronousRequest:req
                                                 returningResponse:nil error:nil];
        NSLog(@"returndata%@",response);
        NSError *error;
        NSMutableDictionary *dist1;
        if (response)
        {
            dist1 = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions
            error:&error];
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
            @try {
                if([[dist1 objectForKey:@"Result"]isEqualToString:@"true"])
                {
                    
                    classes=[dist1 objectForKey:@"Classes"];
                    if(classes.count ==0 ||[classes isEqual:[NSNull null]])
                    {
                        [classes addObject:@""];
                    }
                    else
                    {
                    [self MethodForGetClassDescription];
                    }
                }
            }
            @catch (NSException *exception) {
                UIAlertView *message1 = [[UIAlertView alloc] initWithTitle:@"Error Occur"                               message:exception.name
                                                                  delegate:self
                                                         cancelButtonTitle:@"Ok"
                                                         otherButtonTitles:nil];
                [message1 show];

            }
           
            
            
    });
    });
}
-(void)MethodForGetClassDescription
{
    int i;
    for (i=0; i<classes.count; i++)
    {
        NSMutableDictionary *dicClasses=[classes objectAtIndex:i];
        NSString *temp=[dicClasses objectForKey:@"classDescription"];
        [arrClassDescription addObject:temp];
    }
    NSLog(@"arr:%@",arrClassDescription);
}

- (IBAction)btnClassDescription:(id)sender {
   
    NSArray * arrImage = [[NSArray alloc] init];
    if(dropDown == nil) {
        CGFloat f = 370;
        dropDown = [[NIDropDown alloc]showDropDown:sender :&f :arrClassDescription :arrImage :@"down"];
        dropDown.delegate = self;
    }
    else {
        [dropDown hideDropDown:sender];
        [self rel];
    }
}
- (void) niDropDownDelegateMethod: (NIDropDown *) sender {
    [self rel];
}

-(void)rel{
    //    [dropDown release];
    dropDown = nil;
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


- (IBAction)btnSubscribe:(id)sender {
    WebViewForOrderViewController *webview1=[[WebViewForOrderViewController alloc]initWithNibName:@"WebViewForOrderViewController" bundle:nil];
    webview1.OrderTestName=self.btnClassDescription.titleLabel.text;
    [self.navigationController pushViewController:webview1 animated:YES];
    
}
@end
