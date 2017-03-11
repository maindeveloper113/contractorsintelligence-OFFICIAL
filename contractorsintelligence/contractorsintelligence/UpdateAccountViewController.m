//
//  UpdateAccountViewController.m
//  contractorsintelligence
//
//  Created by IBL Infotech on 23/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "UpdateAccountViewController.h"
#import "MBProgressHUD.h"
#import "Contact.h"
#import "DashboardOneViewController.h"
#import "LoginViewController.h"

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3f;

@interface UpdateAccountViewController ()
{
    NSMutableArray *arrQuestions;
    NSMutableArray *name;
    NSArray *arrStates;
    MBProgressHUD * hud1;
    int rowX;
}

@end

@implementation UpdateAccountViewController
 @synthesize uemail,ufirstname,ulastname,uaddress,ucity,ustate,uzip,upassword,uclassification,txtAddress1,txtCity1,txtEmail1,txtFirstName1,txtLastName1,txtZipcode1,umobileno,txtPhone1,txtConfirmEmail1;
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
        self = [super initWithNibName:@"UpdateAccountViewController~ipad" bundle:nibBundleOrNil];
    }

    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrQuestions=[[NSMutableArray alloc] init];
    arrStates=[[NSMutableArray alloc] init];
    name =[[NSMutableArray alloc]init];
      [self getClassificationtextfield];
    // Do any additional setup after loading the view from its nib.
    // Userset= [[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
    uemail = [[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
    ufirstname = [[NSUserDefaults standardUserDefaults]objectForKey:@"firstname"];
    ulastname = [[NSUserDefaults standardUserDefaults]objectForKey:@"lastname"];
    uaddress = [[NSUserDefaults standardUserDefaults]objectForKey:@"address"];
    ucity=[[NSUserDefaults standardUserDefaults]objectForKey:@"city"];
    ustate = [[NSUserDefaults standardUserDefaults]objectForKey:@"state"];
    uzip = [[NSUserDefaults standardUserDefaults]objectForKey:@"zip"];
    umobileno = [[NSUserDefaults standardUserDefaults]objectForKey:@"mobilenum"];
    uclassification = [[NSUserDefaults standardUserDefaults]objectForKey:@"Classification"];
    [self setFont];
    [self loadArrayForPickerView];
    [self.scrollForm1 setContentSize:CGSizeMake(320.0, 400.0)];
    txtEmail1.text = uemail;
    txtConfirmEmail1.text = uemail;
    txtFirstName1.text = ufirstname;
    txtLastName1.text = ulastname;
    txtAddress1.text = uaddress;
    txtPhone1.text = umobileno;
    txtCity1.text = ucity;
    //txtPassword1.text = upassword;
    //txtConfirmPass1.text = upassword;
    txtZipcode1.text = uzip;
    self.lblState1.text = ustate;
    self.lblQuestion1.text = uclassification;
    
    [txtFirstName1 setDelegate:self];
    [txtLastName1 setDelegate:self];
    [txtEmail1 setDelegate:self];
    [txtConfirmEmail1 setDelegate:self];
    //[txtConfirmPass1 setDelegate:self];
    //[txtPassword1 setDelegate:self];
    [txtZipcode1 setDelegate:self];
    [txtCity1 setDelegate:self];
    [txtPhone1 setDelegate:self];
    [txtAddress1 setDelegate:self];

    
}


-(void)getClassificationtextfield
{

    NSURL *loginURL=[NSURL URLWithString:@"https://www.contractorsintelligence.com/Services/displaycategory.php"];
 
    
    //1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:loginURL];
        
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSError *er;
        
        NSMutableDictionary *dict ;
        
        if (returnData) {
            
            dict = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&er];
            
        }
        //4
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            
            @try {
                NSLog(@"returnData : %@",dict);
                
                if ([[dict objectForKey:@"category"] isEqual:nil]) {
                }else{
                    if([[dict objectForKey:@"ResponseCode"] isEqualToString:@"1"])
                    {
                       self.jsonQuote = [dict objectForKey:@"name"];
                      
                       name  = [dict objectForKey: @"category"];
                        int i;
                        NSMutableDictionary *temp;
                        temp=[[NSMutableDictionary alloc]init];
                        NSString *temp1;
                         NSString *temp2;
                        
                        for(i=0;i<[name count];i++)
                        {
                            temp=[name objectAtIndex:i];
                            temp1 =[temp objectForKey:@"name"];
                            temp2 = [temp objectForKey:@"id"];
                            [arrQuestions addObject:temp1];
                            if ([temp2 isEqualToString:uclassification]) {
                               self.lblQuestion1.text = temp1;
                                rowX= i;
                            }
                        }
                        NSLog(@"ArrayDataname : %@",arrQuestions);
                       // [self.tableView reloadData];
                    }
                    
                    else
                    {
                        NSLog(@"User Detail Not Available...");
                    }
                }
            }
            @catch (NSException *exception) {
                NSLog( @"Name: %@", exception.name);
                NSLog( @"Reason: %@", exception.reason );
                return;
            }
            @finally {
                //
            }
        });
        
    });

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) loadArrayForPickerView
{
    
    //arrQuestions=[NSArray arrayWithObjects:@"None or Not Sure.",@"A-General Engineering",@"B-General Building",@"C-2 Insulation and Acoustical",@"C-4 Boiler, Hot Water Heating and Steam Fitting",@"C-5 Framing and Rough Carpentry",@"C-6 Cabinet, Millwork and Finish Carpentry",@"C-7 Low Voltage Systems",@"C-8 Concrete",@"C-9 Drywall",@"C-10 Electrical",@"C-11 Elevator",@"C-12 Earthwork and Paving",@"C-13 Fencing",@"C-15 Flooring and Floor Covering",@"C-16 Fire Protection",@"C-17 Glazing",@"C-20 Warm-Air Heating, Ventilating and Air-Conditioning",@"C-21 Building Moving and Demolition",@"C-23 Ornamental Metal",@"C-27 Landscaping",@"C-28 Lock and Security Equipment",@"C-29 Masonry",@"C-31 Construction Zone Traffic Control",@"C-32 Parking and Highway Improvement",@"C-33 Painting and Decorating",@"C-34 Pipeline",@"C-35 Lathing and Plastering",@"C-36 Plumbing",@"C-38 Refrigeration",@"C-39 Roofing",@"C-42 Sanitation System",@"C-43 Sheet Metal",@"C-45 Electrical Sign",@"C-46 Solar",@"C-47 General Manufactured Housing",@"C-50 Reinforcing Steel",@"C-51 Structural Steel",@"C-53 Swimming Pool",@"C-54 Ceramic and Mosaic Tile",@"C-55 Water Conditioning",@"C-57 Water Well Drilling",@"C-60 Welding",@"C-61 Limited Speciality",@"ASB Asbestos Certification",@"HAZ Hazardous Substance Removal Certification",nil];
    
    arrStates=[NSArray arrayWithObjects:@"California",@"Alabama",@"Alaska",@"Arizona",@"Arkansas",@"Colorado",@"Connecticut",@"Delaware",@"District Of Columbia",@"Florida",@"Georgia",@"Guam",@"Hawaii",@"Idaho",@"Illinois",@"Indiana",@"Iowa",@"Kansas",@"Kentucky",@"Louisiana",@"Maine",@"Maryland",@"Massachusetts",@"Michigan",@"Minnesota",@"Mississippi",@"Missourioption",@"Montana",@"Nebraska",@"Nevada",@"New Hampshire",@"New Jersey",@"New Mexico",@"New York",@"North Dakota",@"Ohio",@"Oklahoma",@"Oregon",@"Pennsylvania",@"Puerto Rico",@"Rhode Island",@"South Dakota",@"Tennessee",@"Texas",@"Utah",@"Vermont",@"Virginia",@"Washington",@"West Virginia",@"Wisconsin",@"Wyoming", nil];
}

-(void) setFont
{
    NSString *fontName=@"Eurostile LT";
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        // For iPhone
        [self.txtFirstName1 setFont:[UIFont fontWithName:fontName size:18.0]];
        [self.txtLastName1 setFont:[UIFont fontWithName:fontName size:18.0]];
        [self.txtPhone1 setFont:[UIFont fontWithName:fontName size:18.0]];
        [self.lblQuestion1 setFont:[UIFont fontWithName:fontName size:18.0]];
        [self.txtEmail1 setFont:[UIFont fontWithName:fontName size:18.0]];
        [self.txtEmail1 setFont:[UIFont fontWithName:fontName size:18.0]];
        [self.txtConfirmEmail1 setFont:[UIFont fontWithName:fontName size:18.0]];
        [self.txtAddress1 setFont:[UIFont fontWithName:fontName size:18.0]];
        [self.lblState1 setFont:[UIFont fontWithName:fontName size:18.0]];
        [self.txtCity1 setFont:[UIFont fontWithName:fontName size:18.0]];
        [self.txtZipcode1 setFont:[UIFont fontWithName:fontName size:18.0]];
        [self.txtPassword1 setFont:[UIFont fontWithName:fontName size:18.0]];
        [self.txtConfirmPass1 setFont:[UIFont fontWithName:fontName size:18.0]];
    }
    else
    {
        // For iPad
        [self.txtFirstName1 setFont:[UIFont fontWithName:fontName size:24.0]];
        [self.txtLastName1 setFont:[UIFont fontWithName:fontName size:24.0]];
        [self.txtPhone1 setFont:[UIFont fontWithName:fontName size:24.0]];
        [self.lblQuestion1 setFont:[UIFont fontWithName:fontName size:24.0]];
        [self.txtEmail1 setFont:[UIFont fontWithName:fontName size:24.0]];
        [self.txtEmail1 setFont:[UIFont fontWithName:fontName size:24.0]];
        [self.txtConfirmEmail1 setFont:[UIFont fontWithName:fontName size:24.0]];
        [self.txtAddress1 setFont:[UIFont fontWithName:fontName size:24.0]];
        [self.lblState1 setFont:[UIFont fontWithName:fontName size:24.0]];
        [self.txtCity1 setFont:[UIFont fontWithName:fontName size:24.0]];
        [self.txtZipcode1 setFont:[UIFont fontWithName:fontName size:24.0]];
        [self.txtPassword1 setFont:[UIFont fontWithName:fontName size:24.0]];
        [self.txtConfirmPass1 setFont:[UIFont fontWithName:fontName size:24.0]];
    }
}
    
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView==self.pickerQuestion1)
    {
        return [arrQuestions count];
    }
    else
    {
        return [arrStates count];
    }
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if(pickerView==self.pickerQuestion1)
    {
        return arrQuestions[row];
    }
    else
    {
        return arrStates[row];
    }
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if(pickerView==self.pickerQuestion1)
    {
        [self.lblQuestion1 setText:[arrQuestions objectAtIndex:row]];
    }
    else
    {
        [self.lblState1 setText:[arrStates objectAtIndex:row]];
    }
}

- (IBAction)cancelRegistration1:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}


-(BOOL) isFormValid
{
    NSString *strFirstName = [self.txtFirstName1 text];
    NSString *strLastName = [self.txtLastName1 text];
    NSString *strPhone = [self.txtPhone1 text];
    NSString *strEmail = [self.txtEmail1 text];
    NSString *strConfirmEmail = [self.txtConfirmEmail1 text];
    NSString *strAddress = [self.txtAddress1 text];
    NSString *strCity = [self.txtCity1 text];
    NSString *strZip = [self.txtZipcode1 text];
    NSString *strPassword = [self.txtPassword1 text];
    NSString *strConfirmPass = [self.txtConfirmPass1 text];
    
    strFirstName=[strFirstName stringByTrimmingCharactersInSet:
                  [NSCharacterSet whitespaceCharacterSet]];
    strLastName=[strLastName stringByTrimmingCharactersInSet:
                 [NSCharacterSet whitespaceCharacterSet]];
    strPhone=[strPhone stringByTrimmingCharactersInSet:
              [NSCharacterSet whitespaceCharacterSet]];
    strEmail=[strEmail stringByTrimmingCharactersInSet:
              [NSCharacterSet whitespaceCharacterSet]];
    strConfirmEmail=[strConfirmEmail stringByTrimmingCharactersInSet:
                     [NSCharacterSet whitespaceCharacterSet]];
    strAddress=[strAddress stringByTrimmingCharactersInSet:
                [NSCharacterSet whitespaceCharacterSet]];
    strCity=[strCity stringByTrimmingCharactersInSet:
             [NSCharacterSet whitespaceCharacterSet]];
    strZip=[strZip stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceCharacterSet]];
    strPassword=[strPassword stringByTrimmingCharactersInSet:
                 [NSCharacterSet whitespaceCharacterSet]];
    strConfirmPass=[strConfirmPass stringByTrimmingCharactersInSet:
                    [NSCharacterSet whitespaceCharacterSet]];
    
    if([strFirstName isEqualToString:@""])
    {
        return NO;
    }
    if([strLastName isEqualToString:@""])
    {
        return NO;
    }
    if([strPhone isEqualToString:@""])
    {
        return NO;
    }
    if([strEmail isEqualToString:@""])
    {
        return NO;
    }
    if([strConfirmEmail isEqualToString:@""])
    {
        return NO;
    }
    if([strAddress isEqualToString:@""])
    {
        return NO;
    }
    if([strCity isEqualToString:@""])
    {
        return NO;
    }
    if([strZip isEqualToString:@""])
    {
        return NO;
    }
    if([strPassword isEqualToString:@""])
    {
        return NO;
    }
    if([strConfirmPass isEqualToString:@""])
    {
        return NO;
    }
    if([[self.lblQuestion1 text] isEqualToString:@"Desired Trade Questions"])
    {
        return NO;
    }
    if([[self.lblState1 text] isEqualToString:@"State"])
    {
        return NO;
    }
    
    return YES;
}

- (IBAction)doRegister1:(id)sender {
    
    if([self isFormValid])
    {
        
        
            NSString *strFirstName = [self.txtFirstName1 text];
            NSString *strLastName = [self.txtLastName1 text];
            NSString *strPhone = [self.txtPhone1 text];
            NSString *strEmail = [self.txtEmail1 text];
            NSString *strAddress = [self.txtAddress1 text];
            NSString *strCity = [self.txtCity1 text];
            NSString *strZip = [self.txtZipcode1 text];
            //NSString *strPassword = [self.txtPassword1 text];
            NSString *strState=[self.lblState1 text];
            NSString *strQuestion1= [self.lblQuestion1 text];
        NSString *strQuestion;
        int i;
        for(i=0;i<name.count;i++)
        {
            NSMutableDictionary *temp=[name objectAtIndex:i];
            NSString *name123=[temp objectForKey:@"name"];
            if([strQuestion1 isEqualToString:name123])
            {
                strQuestion=[temp objectForKey:@"id"];
            }
        }
        
        //NSLog(@"%@",strQuestion);
        
            [self serviceRegistration:strFirstName lastName:strLastName phoneNo:strPhone question:strQuestion email:strEmail addressLine:strAddress state:strState city:strCity zipCode:strZip];
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


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField setUserInteractionEnabled:YES];
    [textField resignFirstResponder];
    
    if(textField== txtFirstName1)
    {
        [textField setUserInteractionEnabled:YES];
        [txtLastName1 becomeFirstResponder];;
        
    }
    else if(textField==self.txtLastName1)
    {
        [textField setUserInteractionEnabled:YES];
        [self.txtPhone1 becomeFirstResponder];
        
    }
    else if(textField==self.txtPhone1)
    {
        [textField setUserInteractionEnabled:YES];
        [self.txtEmail1 becomeFirstResponder];
       
    }
    else if(textField==self.txtEmail1)
    {
        [textField setUserInteractionEnabled:YES];
        [self.txtAddress1 becomeFirstResponder];
        
    }
    else if(textField==self.txtAddress1)
    {
        [textField setUserInteractionEnabled:YES];
        [self.txtCity1 becomeFirstResponder];
       
    }
    else if(textField==self.txtCity1)
    {
        [textField setUserInteractionEnabled:YES];
        [self.txtZipcode1 becomeFirstResponder];
       
    }
    else if(textField==self.txtZipcode1)
    {
        [textField setUserInteractionEnabled:YES];
        [textField resignFirstResponder];

    }
        return YES;
}

-(void) hideKeyboard
{
    [self.txtFirstName1 resignFirstResponder];
    [self.txtLastName1 resignFirstResponder];
    [self.txtPhone1 resignFirstResponder];
    [self.txtEmail1 resignFirstResponder];
    [self.txtConfirmEmail1 resignFirstResponder];
    [self.txtAddress1 resignFirstResponder];
    [self.txtCity1 resignFirstResponder];
    [self.txtZipcode1 resignFirstResponder];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    [self hideAllPickerViews];
    
    if(ISIPHONE5)
    {
        if(textField==self.txtCity1)
        {
            [self animateForToNewYPosition:-20];
        }
        else if(textField==self.txtZipcode1)
        {
            [self animateForToNewYPosition:-15];
        }
        }
    
    
    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if(ISIPHONE5)
    {
        if(textField==self.txtZipcode1)
        {
           //[self animateForToNewYPosition:0];
            self.scrollForm1.frame = CGRectMake(0, 60, self.scrollForm1.frame.size.width, self.scrollForm1.frame.size.height);
        }
    }
    else
    {
        if(textField==self.txtZipcode1)
        {
            //[self animateForToNewYPosition:0];
            self.scrollForm1.frame = CGRectMake(50, 128, self.scrollForm1.frame.size.width, self.scrollForm1.frame.size.height);
        }
 
    }
    return YES;
}

- (void) animateForToNewYPosition:(int)newYPosition
{
    //start animation
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
    
    //move it
    self.scrollForm1.frame=CGRectMake(self.scrollForm1.frame.origin.x, self.scrollForm1.frame.origin.y+newYPosition, self.scrollForm1.frame.size.width, self.scrollForm1.frame.size.height);
    
    [UIView commitAnimations];
}

- (IBAction)doneWithQuestionPicker1:(id)sender {
    
    [self.viewQuestion1 removeFromSuperview];
}

- (IBAction)doneWithStatePicker1:(id)sender {
                                
    [self animateForToNewYPosition:10];
    [self.viewState1 removeFromSuperview];
}
- (IBAction)selectDesiredQuestion:(id)sender {
    
    [self hideKeyboard];
    [self.viewState1 removeFromSuperview];
    
    [self.view addSubview:self.viewQuestion1];
    self.viewQuestion1.frame=CGRectMake(0, self.view.frame.size.height-self.viewQuestion1.frame.size.height, self.viewQuestion1.frame.size.width, self.viewQuestion1.frame.size.height);
}

- (IBAction)selectState1:(id)sender {
    
    [self hideKeyboard];
    [self.viewQuestion1 removeFromSuperview];
    
    [self animateForToNewYPosition:-10];
    
    [self.view addSubview:self.viewState1];
    self.viewState1.frame=CGRectMake(0, self.view.frame.size.height-self.viewState1.frame.size.height, self.viewState1.frame.size.width, self.viewState1.frame.size.height);
}

-(void) hideAllPickerViews
{
    [self.viewQuestion1 removeFromSuperview];
    [self.viewState1 removeFromSuperview];
}

-(void) serviceRegistration : (NSString *) firstName lastName : (NSString *) lastName phoneNo : (NSString *) phoneNo question : (NSString *) question email : (NSString *) email addressLine : (NSString *) addressLine state : (NSString *) state city : (NSString *) city zipCode : (NSString *) zipCode
{
    NSArray *keys=[NSArray arrayWithObjects:@"firstname",@"lastname",@"phone_no",@"email",@"address",@"state",@"city",@"zip",@"Classification",nil];
    
    NSArray *values=[NSArray arrayWithObjects:firstName,lastName,phoneNo,email,addressLine,state,city,zipCode,question, nil];
    
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
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:UPDATE_ACCOUNT]];
        
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
            [hud hide:YES];
            NSLog(@"returnData : %@",dict);
            
            if([[dict objectForKey:@"Result"] isEqualToString:@"True"])
            {
                NSUserDefaults *userDefaultS = [[NSUserDefaults standardUserDefaults]init];
                [userDefaultS setObject:[self.txtEmail1 text]forKey:@"email"];
                [userDefaultS setObject:[self.txtFirstName1 text]forKey:@"firstname"];
                [userDefaultS setObject:[self.txtLastName1 text]forKey:@"lastname"];
                [userDefaultS setObject:[self.txtAddress1 text]forKey:@"address"];
                [userDefaultS setObject:[self.lblState1 text]forKey:@"state"];
                [userDefaultS setObject:[self.txtCity1 text]forKey:@"city"];
                [userDefaultS setObject:[self.txtZipcode1 text]forKey:@"zip"];
                [userDefaultS setObject:[self.lblQuestion1 text]forKey:@"Classification"];
                 [userDefaultS setObject:[self.txtPhone1 text]forKey:@"mobilenum"];
                [userDefaultS synchronize];
                [self registrationSucceed];
            }
            else
            {
                [self registrationFailed];
            }
        });
    });
}

-(void) registrationFailed
{
    UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"Registration failed!"
                                                           message:@"Something goes wrong!"
                                                          delegate:nil
                                                 cancelButtonTitle:@"Ok"
                                                 otherButtonTitles:nil,nil];
    [alertMessage show];
}

-(void) registrationSucceed
{
    UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"Message"
                                                           message:@"Information Successfully Updated."
                                                          delegate:self
                                                 cancelButtonTitle:@"Ok"
                                                 otherButtonTitles:nil,nil];
    [alertMessage setDelegate:self];
    [alertMessage setTag:101];
    [alertMessage show];
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if([alertView tag]==101)
    {
        [self jsonCallforLogoutDeveceId];
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
