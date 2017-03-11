//  RegistrationViewController.m
//  contractorsintelligence.
//
//  Created by IBL Infotech on 29/09/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "RegistrationViewController.h"
#import "Contact.h"
#import "MBProgressHUD.h"
#import "LoginViewController.h"

static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3f;

@interface RegistrationViewController ()
{
    NSArray *arrQuestions,*arrStates;
}
@end

@implementation RegistrationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        // For iPhone
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    } else {
        // For iPad
        self = [super initWithNibName:@"RegistrationViewController~ipad" bundle:nibBundleOrNil];
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
    
    arrQuestions=[[NSArray alloc] init];
    arrStates=[[NSArray alloc] init];
    
    //if(!ISIPHONE5)
    {
        [self.scrollForm setContentSize:CGSizeMake(320.0, 650.0)];
    }
    
    [self setFont];
    [self loadArrayForPickerView];
}

-(void) loadArrayForPickerView
{
    arrQuestions=[NSArray arrayWithObjects:@"None or Not Sure.",@"A-General Engineering",@"B-General Building",@"C-2 Insulation and Acoustical",@"C-4 Boiler, Hot Water Heating and Steam Fitting",@"C-5 Framing and Rough Carpentry",@"C-6 Cabinet, Millwork and Finish Carpentry",@"C-7 Low Voltage Systems",@"C-8 Concrete",@"C-9 Drywall",@"C-10 Electrical",@"C-11 Elevator",@"C-12 Earthwork and Paving",@"C-13 Fencing",@"C-15 Flooring and Floor Covering",@"C-16 Fire Protection",@"C-17 Glazing",@"C-20 Warm-Air Heating, Ventilating and Air-Conditioning",@"C-21 Building Moving and Demolition",@"C-23 Ornamental Metal",@"C-27 Landscaping",@"C-28 Lock and Security Equipment",@"C-29 Masonry",@"C-31 Construction Zone Traffic Control",@"C-32 Parking and Highway Improvement",@"C-33 Painting and Decorating",@"C-34 Pipeline",@"C-35 Lathing and Plastering",@"C-36 Plumbing",@"C-38 Refrigeration",@"C-39 Roofing",@"C-42 Sanitation System",@"C-43 Sheet Metal",@"C-45 Electrical Sign",@"C-46 Solar",@"C-47 General Manufactured Housing",@"C-50 Reinforcing Steel",@"C-51 Structural Steel",@"C-53 Swimming Pool",@"C-54 Ceramic and Mosaic Tile",@"C-55 Water Conditioning",@"C-57 Water Well Drilling",@"C-60 Welding",@"C-61 Limited Speciality",@"ASB Asbestos Certification",@"HAZ Hazardous Substance Removal Certification",nil];
    
    arrStates=[NSArray arrayWithObjects:@"California",@"Alabama",@"Alaska",@"Arizona",@"Arkansas",@"Colorado",@"Connecticut",@"Delaware",@"District Of Columbia",@"Florida",@"Georgia",@"Guam",@"Hawaii",@"Idaho",@"Illinois",@"Indiana",@"Iowa",@"Kansas",@"Kentucky",@"Louisiana",@"Maine",@"Maryland",@"Massachusetts",@"Michigan",@"Minnesota",@"Mississippi",@"Missourioption",@"Montana",@"Nebraska",@"Nevada",@"New Hampshire",@"New Jersey",@"New Mexico",@"New York",@"North Dakota",@"Ohio",@"Oklahoma",@"Oregon",@"Pennsylvania",@"Puerto Rico",@"Rhode Island",@"South Dakota",@"Tennessee",@"Texas",@"Utah",@"Vermont",@"Virginia",@"Washington",@"West Virginia",@"Wisconsin",@"Wyoming", nil];
}

-(void) setFont
{
    [self.txtFirstName setFont:[UIFont fontWithName:@"Agency FB" size:18.0]];
    [self.txtLastName setFont:[UIFont fontWithName:@"Agency FB" size:18.0]];
    [self.txtPhone setFont:[UIFont fontWithName:@"Agency FB" size:18.0]];
    [self.lblQuestion setFont:[UIFont fontWithName:@"Agency FB" size:18.0]];
    [self.txtEmail setFont:[UIFont fontWithName:@"Agency FB" size:18.0]];
    [self.txtEmail setFont:[UIFont fontWithName:@"Agency FB" size:18.0]];
    [self.txtConfirmEmail setFont:[UIFont fontWithName:@"Agency FB" size:18.0]];
    [self.txtAddress setFont:[UIFont fontWithName:@"Agency FB" size:18.0]];
    [self.lblState setFont:[UIFont fontWithName:@"Agency FB" size:18.0]];
    [self.txtCity setFont:[UIFont fontWithName:@"Agency FB" size:18.0]];
    [self.txtZipcode setFont:[UIFont fontWithName:@"Agency FB" size:18.0]];
    [self.txtPassword setFont:[UIFont fontWithName:@"Agency FB" size:18.0]];
    [self.txtConfirmPass setFont:[UIFont fontWithName:@"Agency FB" size:18.0]];
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


- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if(pickerView==self.pickerQuestion)
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
    if(pickerView==self.pickerQuestion)
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
    if(pickerView==self.pickerQuestion)
    {
        [self.lblQuestion setText:[arrQuestions objectAtIndex:row]];
    }
    else
    {
        [self.lblState setText:[arrStates objectAtIndex:row]];
    }
}

- (IBAction)cancelRegistration:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(BOOL) isFormValid
{
    NSString *strFirstName = [self.txtFirstName text];
    NSString *strLastName = [self.txtLastName text];
    NSString *strPhone = [self.txtPhone text];
    NSString *strEmail = [self.txtEmail text];
    NSString *strConfirmEmail = [self.txtConfirmEmail text];
    NSString *strAddress = [self.txtAddress text];
    NSString *strCity = [self.txtCity text];
    NSString *strZip = [self.txtZipcode text];
    NSString *strPassword = [self.txtPassword text];
    NSString *strConfirmPass = [self.txtConfirmPass text];
    
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
    if([[self.lblQuestion text] isEqualToString:@"Desired Trade Questions"])
    {
        return NO;
    }
    if([[self.lblState text] isEqualToString:@"State"])
    {
        return NO;
    }
    
    return YES;
}

-(BOOL) isEmailAndPasswordConfirm
{
    
    NSString *strEmail = [self.txtEmail text];
    NSString *strConfirmEmail = [self.txtConfirmEmail text];
   
    NSString *strPassword = [self.txtPassword text];
    NSString *strConfirmPass = [self.txtConfirmPass text];
    
    if (![strEmail isEqualToString:strConfirmEmail]) {
        return NO;
    }
    
    if (![strPassword isEqualToString:strConfirmPass]) {
        return NO;
    }
    return YES;
}

- (IBAction)doRegister:(id)sender {
    
    if([self isFormValid])
    {
        if([self isEmailAndPasswordConfirm])
        {
            NSString *strFirstName = [self.txtFirstName text];
            NSString *strLastName = [self.txtLastName text];
            NSString *strPhone = [self.txtPhone text];
            NSString *strEmail = [self.txtEmail text];
            NSString *strAddress = [self.txtAddress text];
            NSString *strCity = [self.txtCity text];
            NSString *strZip = [self.txtZipcode text];
            NSString *strPassword = [self.txtPassword text];
            NSString *strQuestion= [self.lblQuestion text];
            NSString *strState=[self.lblState text];
            
            [self serviceRegistration:strFirstName lastName:strLastName phoneNo:strPhone question:strQuestion email:strEmail addressLine:strAddress state:strState city:strCity zipCode:strZip password:strPassword];
        }
        else
        {
            UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"Error"
                                                                   message:@"Email confirmation & Password confimration must be correct!"
                                                                  delegate:self
                                                         cancelButtonTitle:@"Ok"
                                                         otherButtonTitles:nil,nil];
            [alertMessage show];
        }
        
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
    if(textField==self.txtFirstName)
    {
        [self.txtLastName becomeFirstResponder];
        
    }
    else if(textField==self.txtLastName)
    {
        [self.txtPhone becomeFirstResponder];
        
    }
    else if(textField==self.txtPhone)
    {
        [self.txtEmail becomeFirstResponder];
    }
    else if(textField==self.txtEmail)
    {
        [self.txtConfirmEmail becomeFirstResponder];
        
    }
    else if(textField==self.txtConfirmEmail)
    {
        [self.txtAddress becomeFirstResponder];
        
    }
    else if(textField==self.txtAddress)
    {
        [self.txtCity becomeFirstResponder];
        
    }
    else if(textField==self.txtCity)
    {
        [self.txtZipcode becomeFirstResponder];
       
    }
    else if(textField==self.txtZipcode)
    {
        [self.txtPassword becomeFirstResponder];
        
    }
    else if(textField==self.txtPassword)
    {
        [self.txtConfirmPass becomeFirstResponder];
       
    }
    else
    {
        [textField resignFirstResponder];
        
    }
    return YES;
}

-(void) hideKeyboard
{
    [self.txtFirstName resignFirstResponder];
    [self.txtLastName resignFirstResponder];
    [self.txtPhone resignFirstResponder];
    [self.txtEmail resignFirstResponder];
    [self.txtConfirmEmail resignFirstResponder];
    [self.txtAddress resignFirstResponder];
    [self.txtCity resignFirstResponder];
    [self.txtZipcode resignFirstResponder];
    [self.txtPassword resignFirstResponder];
    [self.txtConfirmPass resignFirstResponder];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    [self hideAllPickerViews];
    
    if(ISIPHONE5)
    {
        if(textField==self.txtCity)
        {
            [self animateForToNewYPosition:-50];
        }
        else if(textField==self.txtZipcode)
        {
            [self animateForToNewYPosition:-30];
        }
        else if(textField==self.txtPassword)
        {
            [self animateForToNewYPosition:-30];
        }
        else if(textField==self.txtConfirmPass)
        {
            [self animateForToNewYPosition:-30];
        }
    }
    else
    {
        if(textField==self.txtConfirmEmail)
        {
            [self animateForToNewYPosition:-50];
        }
        else if(textField==self.txtAddress)
        {
            [self animateForToNewYPosition:-30];
        }
        else if(textField==self.txtCity)
        {
            [self animateForToNewYPosition:-30];
        }
        else if(textField==self.txtZipcode)
        {
            [self animateForToNewYPosition:-50];
        }
        else if(textField==self.txtPassword)
        {
            [self animateForToNewYPosition:-50];
        }
        else if(textField==self.txtConfirmPass)
        {
            [self animateForToNewYPosition:-50];
        }
    }

    return YES;
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if(textField==self.txtConfirmPass)
    {
    self.scrollForm.frame = CGRectMake(0, 56, self.scrollForm.frame.size.width, self.scrollForm.frame.size.height);
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
    self.scrollForm.frame=CGRectMake(self.scrollForm.frame.origin.x, self.scrollForm.frame.origin.y+newYPosition, self.scrollForm.frame.size.width, self.scrollForm.frame.size.height);
    
    [UIView commitAnimations];
}

- (IBAction)doneWithQuestionPicker:(id)sender {

    [self.viewQuestion removeFromSuperview];
}

- (IBAction)doneWithStatePicker:(id)sender {
    
    [self animateForToNewYPosition:10];
    [self.viewState removeFromSuperview];
}
- (IBAction)selectDesiredQuestion:(id)sender {
    
    [self hideKeyboard];
    [self.viewState removeFromSuperview];
    
    [self.view addSubview:self.viewQuestion];
    self.viewQuestion.frame=CGRectMake(0, self.view.frame.size.height-self.viewQuestion.frame.size.height, self.viewQuestion.frame.size.width, self.viewQuestion.frame.size.height);
}

- (IBAction)selectState:(id)sender {
    
    [self hideKeyboard];
    [self.viewQuestion removeFromSuperview];
    
    [self animateForToNewYPosition:-10];
    
    [self.view addSubview:self.viewState];
    self.viewState.frame=CGRectMake(0, self.view.frame.size.height-self.viewState.frame.size.height, self.viewState.frame.size.width, self.viewState.frame.size.height);
}

-(void) hideAllPickerViews
{
    [self.viewQuestion removeFromSuperview];
    [self.viewState removeFromSuperview];
}

-(void) serviceRegistration : (NSString *) firstName lastName : (NSString *) lastName phoneNo : (NSString *) phoneNo question : (NSString *) question email : (NSString *) email addressLine : (NSString *) addressLine state : (NSString *) state city : (NSString *) city zipCode : (NSString *) zipCode password : (NSString *) password
{
    NSArray *keys=[NSArray arrayWithObjects:@"firstname",@"lastname",@"phone_no",@"desiredquestion",@"email",@"address_Line",@"state",@"city",@"zip_code",@"password",nil];
    
    NSArray *values=[NSArray arrayWithObjects:firstName,lastName,phoneNo,question,email,addressLine,state,city,zipCode,password, nil];
    
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
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:REGISTRATION]];
        
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
            
            if([[dict objectForKey:@"Result"] isEqualToString:@"true"])
            {
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
                                                           message:@"Registration successfully."
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
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end