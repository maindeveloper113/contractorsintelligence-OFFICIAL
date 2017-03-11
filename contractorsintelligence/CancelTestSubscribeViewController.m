//
//  CancelTestSubscribeViewController.m
//  ExamPrep
//
//  Created by IBL Infotech on 04/11/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "CancelTestSubscribeViewController.h"
#import "MBProgressHUD.h"
#import "Contact.h"
#import "LoginViewController.h"

@interface CancelTestSubscribeViewController ()
{
    NSString *accesLevel1;
    NSString *accesLevel2;
    NSString *accesLevel3;
    NSString *accesLevel4;
    NSString *accesLevel5;
    NSString *access1;
    NSString *access2;
    NSString *access3;
    NSString *access4;
    NSString *access5;
    NSString *selAccess1;
    NSString *selAccess2;
    NSString *selAccess3;
    NSString *selAccess4;
    NSString *selAccess5;
    NSString *Canceled_accesslev1;
    NSString *Canceled_accesslev2;
    NSString *Canceled_accesslev3;
    NSString *Canceled_accesslev4;
    NSString *Canceled_accesslev5;
    NSString *date1;
    NSString *date2;
    NSString *date3;
    NSString *date4;
    NSString *date5;
    int fontSize;
    int lblLenght1;
    NSString *CheckImage;
    NSString *UncheckImage;
    NSString *flageCancelButton1;
    NSString *flageCancelButton2;
    NSString *flageCancelButton3;
    NSString *flageCancelButton4;
    NSString *flageCancelButton5;
    MBProgressHUD *hud;
    
}

@end

@implementation CancelTestSubscribeViewController

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
        self = [super initWithNibName:@"CancelTestSubscribeViewController~ipad" bundle:nibBundleOrNil];
    }

    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    access1=@"1";
    access2=@"1";
    access3=@"1";
    access4=@"1";
    access5=@"1";
    selAccess5=@"";
    selAccess4=@"";
    selAccess3=@"";
    selAccess2=@"";
    selAccess1=@"";
    flageCancelButton1=@"1";
    flageCancelButton2=@"1";
    flageCancelButton3=@"1";
    flageCancelButton4=@"1";
    flageCancelButton5=@"1";
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        // For iPhone
        lblLenght1=18;
        fontSize=17.0;
        CheckImage=@"chk_check.png";
        UncheckImage =@"chk_uncheck.png";
    }
    else
    {
        // For iPad
        lblLenght1=60;
        fontSize=22.0;
        CheckImage=@"chk_check_iPad.png";
        UncheckImage =@"chk_uncheck_iPad.png";
    }
    [self.lblAccessLevel1 setFont:[UIFont fontWithName:@"Eurostile LT" size:fontSize]];
    [self.lblAccessLevel2 setFont:[UIFont fontWithName:@"Eurostile LT" size:fontSize]];
    [self.lblAccessLevel3 setFont:[UIFont fontWithName:@"Eurostile LT" size:fontSize]];
    [self.lblAccessLevel4 setFont:[UIFont fontWithName:@"Eurostile LT" size:fontSize]];
    [self.lblAccessLevel5 setFont:[UIFont fontWithName:@"Eurostile LT" size:fontSize]];
    
    [self.expAccessLevel1 setFont:[UIFont fontWithName:@"Eurostile LT" size:fontSize]];
    [self.expAccessLevel2 setFont:[UIFont fontWithName:@"Eurostile LT" size:fontSize]];
    [self.expAccessLevel3 setFont:[UIFont fontWithName:@"Eurostile LT" size:fontSize]];
    [self.expAccessLevel4 setFont:[UIFont fontWithName:@"Eurostile LT" size:fontSize]];
    [self.expAccessLevel5 setFont:[UIFont fontWithName:@"Eurostile LT" size:fontSize]];
    
    [self CheckButtonDisable];
    [self jsonCallforTestSubscibe];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)jsonCallforTestSubscibe
{
    NSString *email=[[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
    NSString *url=[NSString stringWithFormat:@"https://www.contractorsischool.com/mobile-services/displayexpireinfo.php?email=%@",email];
        MBProgressHUD *hud1=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud1.labelText=@"Loading.";
        [hud setHidden:YES];
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
        [hud1 setHidden:YES];
            @try {
                if ([[dist1 objectForKey:@"Result"]isEqualToString:@"True"]) {
                    NSMutableArray *temp=[dist1 objectForKey:@"Acceslevel"];
                    NSMutableDictionary *dicTemp=[temp objectAtIndex:0];
                    accesLevel1=[dicTemp objectForKey:@"accessLev"];
                    accesLevel2=[dicTemp objectForKey:@"accessLev2"];
                    accesLevel3=[dicTemp objectForKey:@"accessLev3"];
                    accesLevel4=[dicTemp objectForKey:@"accessLev4"];
                    accesLevel5=[dicTemp objectForKey:@"accessLev5"];
                    Canceled_accesslev1=[dicTemp objectForKey:@"Canceled_accesslev1"];
                    Canceled_accesslev2=[dicTemp objectForKey:@"Canceled_accesslev2"];
                    Canceled_accesslev3=[dicTemp objectForKey:@"Canceled_accesslev3"];
                    Canceled_accesslev4=[dicTemp objectForKey:@"Canceled_accesslev4"];
                    Canceled_accesslev5=[dicTemp objectForKey:@"Canceled_accesslev5"];
                    date1=[dicTemp objectForKey:@"Purge_date_accesslev1"];
                    date2=[dicTemp objectForKey:@"Purge_date_accesslev2"];
                    date3=[dicTemp objectForKey:@"Purge_date_accesslev3"];
                    date4=[dicTemp objectForKey:@"Purge_date_accesslev4"];
                    date5=[dicTemp objectForKey:@"Purge_date_accesslev5"];
                    
                    [self displayAccessLevelOnScreen];
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

-(void)displayAccessLevelOnScreen
{
    if(![accesLevel1 isEqual:[NSNull null]]&&![accesLevel1 length]==0)
    {
        if([Canceled_accesslev1 isEqualToString:@"1"])
        {
            flageCancelButton1=@"1";
            [self.btnAccessLevel1 setHidden:YES];
            [self.btnAccessLevel1 setEnabled:NO];
            [self.lblAccessLevel1 setFrame:CGRectMake(lblLenght1,self.lblAccessLevel1.frame.origin.y,self.lblAccessLevel1.frame.size.width,self.lblAccessLevel1.frame.size.height)];
            self.lblAccessLevel1.text=accesLevel1;
            NSString *temp=[NSString stringWithFormat:@"expires %@",date1];
            [self.expAccessLevel1 setText:temp];
        }
        else
        {
            flageCancelButton1=@"0";
        [self.btnAccessLevel1 setHidden:NO];
        [self.btnAccessLevel1 setEnabled:YES];
        self.lblAccessLevel1.text=accesLevel1;
        }
    }
 
    if(![accesLevel2 isEqual:[NSNull null]]&&![accesLevel2 length]==0)
    {
        if([Canceled_accesslev2 isEqualToString:@"1"])
        {
            flageCancelButton2=@"1";
            [self.btnAccessLevel2 setHidden:YES];
            [self.btnAccessLevel2 setEnabled:NO];
            [self.lblAccessLevel2 setFrame:CGRectMake(lblLenght1,self.lblAccessLevel2.frame.origin.y,self.lblAccessLevel2.frame.size.width,self.lblAccessLevel2.frame.size.height)];
            self.lblAccessLevel2.text=accesLevel2;
            NSString *temp=[NSString stringWithFormat:@"expires %@",date2];
            [self.expAccessLevel2 setText:temp];

        }
        else
        {
             flageCancelButton2=@"0";
        [self.btnAccessLevel2 setHidden:NO];
        [self.btnAccessLevel2 setEnabled:YES];
        self.lblAccessLevel2.text=accesLevel2;
        }
    }
   


    if(![accesLevel3 isEqual:[NSNull null]]&&![accesLevel3 length]==0)
    {
        if ([Canceled_accesslev3 isEqualToString:@"1"]) {
            flageCancelButton3=@"1";
            [self.btnAccessLevel3 setHidden:YES];
            [self.btnAccessLevel3 setEnabled:NO];
            [self.lblAccessLevel3 setFrame:CGRectMake(lblLenght1,self.lblAccessLevel3.frame.origin.y,self.lblAccessLevel3.frame.size.width,self.lblAccessLevel3.frame.size.height)];
             self.lblAccessLevel3.text=accesLevel3;
            NSString *temp=[NSString stringWithFormat:@"expires %@",date3];
            [self.expAccessLevel3 setText:temp];

        }
        else
        {
             flageCancelButton3=@"0";
        [self.btnAccessLevel3 setHidden:NO];
        [self.btnAccessLevel3 setEnabled:YES];
        self.lblAccessLevel3.text=accesLevel3;
        }
    }
  
    //![accesLevel4 length]==0 &&
    if( ![accesLevel4 isEqual:[NSNull null]]&&![accesLevel4 length]==0)
    {
        if ([Canceled_accesslev4 isEqualToString:@"1"]) {
            flageCancelButton4=@"1";
            [self.btnAccessLevel4 setHidden:YES];
          [self.btnAccessLevel4 setEnabled:NO];
            [self.lblAccessLevel4 setFrame:CGRectMake(lblLenght1,self.lblAccessLevel4.frame.origin.y,self.lblAccessLevel4.frame.size.width,self.lblAccessLevel4.frame.size.height)];
             self.lblAccessLevel4.text=accesLevel4;
            NSString *temp=[NSString stringWithFormat:@"expires %@",date4];
            [self.expAccessLevel1 setText:temp];

        }
        else
        {
             flageCancelButton4=@"0";
        [self.btnAccessLevel4 setHidden:NO];
        [self.btnAccessLevel4 setEnabled:YES];
        self.lblAccessLevel4.text=accesLevel4;
        }
    }
    
    //![accesLevel5 length]==0 &&
    if(![accesLevel5 isEqual:[NSNull null]]&&![accesLevel5 length]==0)
    {
        if ([Canceled_accesslev5 isEqualToString:@"1"]) {
            flageCancelButton5=@"1";
            [self.btnAccessLevel5 setHidden:YES];
            [self.btnAccessLevel5 setEnabled:NO];
            [self.lblAccessLevel5 setFrame:CGRectMake(lblLenght1,self.lblAccessLevel5.frame.origin.y,self.lblAccessLevel5.frame.size.width,self.lblAccessLevel5.frame.size.height)];
            self.lblAccessLevel5.text=accesLevel5;
            NSString *temp=[NSString stringWithFormat:@"expires %@",date5];
            [self.expAccessLevel5 setText:temp];
        }
        else
        {
             flageCancelButton5=@"0";
        [self.btnAccessLevel5 setHidden:NO];
        [self.btnAccessLevel5 setEnabled:YES];
        self.lblAccessLevel5.text=accesLevel5;
        }
    }
    if([flageCancelButton1 isEqualToString:@"1"]&&[flageCancelButton2 isEqualToString:@"1"]&&[flageCancelButton3 isEqualToString:@"1"]&&[flageCancelButton4 isEqualToString:@"1"]&&[flageCancelButton5 isEqualToString:@"1"])
    {
        [self.btnCancelSubscribtion setHidden:YES];
        [self.btnCancelSubscribtion setEnabled:NO];
    }
    else
    {
        [self.btnCancelSubscribtion setHidden:NO];
        [self.btnCancelSubscribtion setEnabled:YES];
    }
    
}
-(void)CheckButtonDisable
{
    [self.btnAccessLevel1 setHidden:YES];
    [self.btnAccessLevel2 setHidden:YES];
    [self.btnAccessLevel3 setHidden:YES];
    [self.btnAccessLevel4 setHidden:YES];
    [self.btnAccessLevel5 setHidden:YES];
        [self.btnAccessLevel1 setEnabled:NO];
        [self.btnAccessLevel2 setEnabled:NO];
        [self.btnAccessLevel3 setEnabled:NO];
        [self.btnAccessLevel4 setEnabled:NO];
        [self.btnAccessLevel5 setEnabled:NO];
}

- (IBAction)btnAccessLevel1:(id)sender {
    if([access1 isEqualToString:@"1"])
    {
        access1=@"0";
    [self.btnAccessLevel1 setImage:[UIImage imageNamed:CheckImage] forState:UIControlStateNormal];
        selAccess1=accesLevel1;
    }
    else
    {
        access1=@"1";
        [self.btnAccessLevel1 setImage:[UIImage imageNamed:UncheckImage] forState:UIControlStateNormal];
        selAccess1=@"";
    }
}
- (IBAction)btnAccessLevel2:(id)sender {
    if([access2 isEqualToString:@"1"])
    {
        access2=@"0";
        [self.btnAccessLevel2 setImage:[UIImage imageNamed:CheckImage] forState:UIControlStateNormal];
        selAccess2=accesLevel2;

    }
    else
    {
        access2=@"1";
        [self.btnAccessLevel2 setImage:[UIImage imageNamed:UncheckImage] forState:UIControlStateNormal];
        selAccess2=@"";
    }

}
- (IBAction)btnAccessLevel3:(id)sender {
    if([access3 isEqualToString:@"1"])
    {
        access3=@"0";
        [self.btnAccessLevel3 setImage:[UIImage imageNamed:CheckImage] forState:UIControlStateNormal];
        selAccess3=accesLevel3;
    }
    else
    {
        access3=@"1";
        [self.btnAccessLevel3 setImage:[UIImage imageNamed:UncheckImage] forState:UIControlStateNormal];
        selAccess3=@"";
    }

}
- (IBAction)btnAccessLevel4:(id)sender {
    if([access4 isEqualToString:@"1"])
    {
        access4=@"0";
        [self.btnAccessLevel4 setImage:[UIImage imageNamed:CheckImage] forState:UIControlStateNormal];
        selAccess4=accesLevel4;
    }
    else
    {
        access4=@"1";
        [self.btnAccessLevel4 setImage:[UIImage imageNamed:UncheckImage] forState:UIControlStateNormal];
        selAccess4=@"";
    }

}
- (IBAction)btnAccessLevel5:(id)sender {
    if([access5 isEqualToString:@"1"])
    {
        access5=@"0";
        [self.btnAccessLevel5 setImage:[UIImage imageNamed:CheckImage] forState:UIControlStateNormal];
        selAccess5=accesLevel5;
    }
    else
    {
        access5=@"1";
        [self.btnAccessLevel5 setImage:[UIImage imageNamed:UncheckImage] forState:UIControlStateNormal];
        selAccess5=@"";
    }

}
- (IBAction)btnCancelSubscribtion:(id)sender
{
   if([selAccess1 isEqualToString:@""]&&[selAccess2 isEqualToString:@""]&&[selAccess3 isEqualToString:@""]&&[selAccess4 isEqualToString:@""]&&[selAccess5 isEqualToString:@""])
   {
       UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                         message:@"There is no Test For Subscibe.."
                                                        delegate:self
                                               cancelButtonTitle:@"Ok"
                                               otherButtonTitles:nil];
       message.tag=102;
       [message show];

   }
   else
   {
       [self jsonCallforCancelTestSubsciber];
   }
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


-(void)jsonCallforCancelTestSubsciber
{
    NSString *email=[[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
    NSArray *values=[[NSArray alloc]initWithObjects:email,selAccess1,selAccess2,selAccess3,selAccess4,selAccess5, nil];
    NSArray *key=[[NSArray alloc]initWithObjects:@"email",@"accessLev",@"accessLev2",@"accessLev3",@"accessLev4",@"accessLev5", nil];
    
    NSDictionary *jsonData=[NSDictionary dictionaryWithObjects:values forKeys:key];
    NSError *error;
    NSData *jsonData1 = [NSJSONSerialization dataWithJSONObject:jsonData
                                                        options:NSJSONWritingPrettyPrinted
                                                          error:&error];
    NSString* jsonRequest = [[NSString alloc] initWithData:jsonData1 encoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.contractorsischool.com/mobile-services/cancel_subsciption.php"]];
    
    //Start activityindicator
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading";
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                               cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
        NSData *requestData = [jsonRequest dataUsingEncoding:NSUTF8StringEncoding];
        
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody: requestData];
        
        NSData *returndata = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        
        NSLog(@"%@",returndata);
        NSError *err;
        NSMutableDictionary *dist1;
        
        if (returndata) {
            dist1 = [NSJSONSerialization JSONObjectWithData:returndata options:kNilOptions error:&err];
            NSLog(@"friendreturndata:%@",dist1);
        }
        else{
            NSLog(@"Data not found");
            UIAlertView *ale =[[UIAlertView alloc]initWithTitle:@"Internet Connection slow!!" message:@"Data can not access" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [ale show];
        }
        NSLog(@"returnData : %@",dist1);
        dispatch_async(dispatch_get_main_queue(), ^{
         //[hud hide:YES];
            if([[dist1 objectForKey:@"ResponseCode"] isEqualToString:@"1"])
            {
                NSLog(@"Hello");
                [self jsonCallforTestSubscibe];
            }
            else
            {
                NSLog(@"Login failed...");
            }
        });
    });
}

@end
