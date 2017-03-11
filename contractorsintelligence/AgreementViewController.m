//
//  AgreementViewController.m
//  ExamPrep
//
//  Created by Brian Roy A. Villanueva on 1/9/15.
//  Copyright (c) 2015 IBL Infotech. All rights reserved.
//

#import "AgreementViewController.h"
#import "Queries.h"
#import "DashboardOneViewController.h"
#import "MBProgressHUD.h"

@interface AgreementViewController (){

    NSMutableArray *myObject;
    // A dictionary object
    NSDictionary *dictionary;
    // Define keys
    NSString *title;
    NSString *thumbnail;
    NSString *author;
    
    NSMutableData *responseData;
}

@end

@implementation AgreementViewController
@synthesize buttonOk;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        // For iPhone
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    } else {
        // For iPad
        self = [super initWithNibName:@"AgreementViewController~ipad" bundle:nibBundleOrNil];
    }
    
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   //  [self loadWebView];
    //[self loadAgreement];
    
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
-(IBAction)agreeTerms:(id)sender{
    [buttonOk setImage:[Queries imageContentFile:@"checkbox"] forState:UIControlStateNormal];
    [Queries setDefault:@"1" objectKey:@"TermsAgreement"];
    //[self dismissViewControllerAnimated:YES completion:nil];

    
}

-(IBAction)btnAccept:(id)sender{
    
     //[self jsonCallforUpdatePassword];

    // [self jsonCallforUpdateFirsttime];
    
    responseData = [[NSMutableData alloc]init];
    
    NSString *strUserEmail=[[[NSUserDefaults standardUserDefaults] objectForKey:@"userData"] objectForKey:@"email"];
    
    NSLog(@"requestURL : %@",strUserEmail);
    
    NSString *requestURL=[NSString stringWithFormat:@"https://www.contractorsischool.com/mobile-services/updateFirsttime.php?Customer_email=%@",strUserEmail];
    
    NSURL *url = [[NSURL alloc] initWithString:requestURL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    (void)[NSURLConnection connectionWithRequest:request delegate:self];
    
  
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // saving an NSString
    [prefs setObject:@"TextToSave" forKey:@"keyToLookupString"];
    
    // This is suggested to synch prefs, but is not needed (I didn't put it in my tut)
    [prefs synchronize];
    
    
    DashboardOneViewController *dashboardView=[[DashboardOneViewController alloc] initWithNibName:@"DashboardOneViewController" bundle:nil];
    [self.navigationController pushViewController:dashboardView animated:YES];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadWebView {
    // Remember that bundle resources do *not* have directories so all filenames must be unique.
    NSBundle *mainBundle = [NSBundle mainBundle];
    NSURL *homeIndexUrl = [mainBundle URLForResource:@"agreement" withExtension:@"html"];
    
    // The magic is loading a request, *not* using loadHTMLString:baseURL:
    NSURLRequest *urlReq = [NSURLRequest requestWithURL:homeIndexUrl];
    [_viewWeb loadRequest:urlReq];
}

-(void)jsonCallforUpdatePassword
{
        if(true)
        {
            NSString *strEmail=[[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
            
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://www.contractorsischool.com/mobile-services/getFirsttimeIOS.php"]];
        
            NSArray *varName=[[NSArray alloc] initWithObjects:@"email",nil];
            NSArray *varValue=[[NSArray alloc] initWithObjects:strEmail, nil];
            
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
                                                                          message:@"QUERY SUCCESS "
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - NSURLConnection Delegates

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
    
    NSLog(@"%@",responseString);
    
    NSError* error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:responseData //1
                          
                          options:kNilOptions
                          error:&error];
    
    NSArray* agreement = [json objectForKey:@"Agreement_body"]; //2
    
    NSLog(@"Agreement_body: %@", agreement); //3
    
    NSString *agrementString = [json objectForKey:@"Agreement_body"];

    NSString *myDescriptionHTML = [NSString stringWithFormat:@"<html> \n"
                                   "<head> \n"
                                   "<meta http-equiv=Content-Type content=\"text/html\" charset=\"UTF-8\">"
                                   "<style type=\"text/css\"> \n"
                                   "body {font-family: \"Eurostile LT\"; font-size:12;}\n"
                                   "</style> \n"
                                   "</head> \n"
                                   "<body>%@</body> \n"
                                   "</html>",agrementString];
  
    _viewWeb.backgroundColor = [UIColor clearColor];
    
    [_viewWeb loadHTMLString: myDescriptionHTML baseURL: nil];
    
    
}

-(void) jsonCallforUpdateFirsttime
{

    
}

@end
