//
//  TestSubscriptionViewController.m
//  contractorsintelligence
//
//  Created by IBL Infotech on 18/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "TestSubscriptionViewController.h"
#import "TestSubscriptionCell.h"
#import "OnlionTestViewController.h"
#import "MBProgressHUD.h"
#import "EndTestViewController.h"
#import "ApplicationTabViewController.h"
#import "LoginViewController.h"
#import "logoutController.h"
#import "Contact.h"

@interface TestSubscriptionViewController (){
    
    MBProgressHUD * Hud;
}

@end

@implementation TestSubscriptionViewController

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
        self = [super initWithNibName:@"TestSubscriptionViewController~ipad" bundle:nibBundleOrNil];
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
    [self TestSubscription];
    self.tableForTest.backgroundColor = [UIColor clearColor];
    

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
-(void)TestSubscription{
    
    NSString *strUserEmail=[[[NSUserDefaults standardUserDefaults] objectForKey:@"userData"] objectForKey:@"email"];
    NSString *requestURL=[NSString stringWithFormat:@"https://www.contractorsischool.com/mobile-services/get_test_subscription.php?email=%@",strUserEmail];
    
    NSArray *key = [NSArray arrayWithObjects:@"email",nil];
    
    NSArray *values = [NSArray arrayWithObjects:strUserEmail,nil];
    
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
            
            self.TestSubArray = [dist1 objectForKey:@"Tests"];
            if(self.TestSubArray.count == 0 || [self.TestSubArray isEqual:[NSNull null]])
            {
                [self.TestSubArray addObject:@""];
                [self.tableForTest reloadData];
            }
            else
            {
                [self.tableForTest reloadData];
            }
        });
        
    });
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"SimpleTableCell";
	
    TestSubscriptionCell*Cell = (TestSubscriptionCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        // For iPhone
        if(Cell==nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TestSubscriptionCell" owner:self options:nil];
            Cell= [nib objectAtIndex:0];
        }
        [Cell.lblCatagory setFont:[UIFont fontWithName:@"Eurostile LT" size:15.0]];
    }
    else
    {
        // For iPad
        if(Cell==nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TestSubscriptionCell~ipad" owner:self options:nil];
            Cell= [nib objectAtIndex:0];
        }
        
        [Cell.lblCatagory setFont:[UIFont fontWithName:@"Eurostile LT" size:20.0]];
    }
    Cell.backgroundColor=[UIColor clearColor];
    NSMutableDictionary * temp = [self.TestSubArray objectAtIndex:indexPath.row];
    NSString *ClassDec = [NSString stringWithFormat:@"%@",[temp objectForKey:@"classDescription"]];
   NSRange range = [ClassDec rangeOfString:@"("];
    NSString *toBracket = [NSString stringWithString :[ClassDec substringToIndex:range.location] ];
    NSLog(@"toBracket: %@", toBracket);
    Cell.lblCatagory.text =toBracket;
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName: [UIColor blackColor], NSBackgroundColorAttributeName: [UIColor clearColor], NSUnderlineStyleAttributeName: @1,NSUnderlineColorAttributeName:[UIColor blueColor]};

   NSAttributedString *myString = [[NSAttributedString alloc] initWithString:toBracket attributes:attributes];
    
   Cell.lblCatagory.attributedText = myString;
    
      return Cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.TestSubArray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    OnlionTestViewController * onlinTest = [[OnlionTestViewController alloc]initWithNibName:@"OnlionTestViewController" bundle:nil];
    NSMutableDictionary * temp = [self.TestSubArray objectAtIndex:indexPath.row];
    onlinTest.strGotTest = [temp objectForKey:@"test_category_id"];
    NSString *ClassDec = [NSString stringWithFormat:@"%@",[temp objectForKey:@"classDescription"]];
    NSRange range = [ClassDec rangeOfString:@"("];
    NSString *toBracket = [NSString stringWithString :[ClassDec substringToIndex:range.location] ];
    onlinTest.CTname =toBracket;
    [self.navigationController pushViewController:onlinTest animated:YES];
}

- (IBAction)btnBackToTab:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
    
    
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
