//
//  SplashViewController.m
//  contractorsintelligence
//
//  Created by IBL Infotech on 29/09/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "SplashViewController.h"
#import "LoginViewController.h"
#import "HomeViewController.h"
#import "DashboardOneViewController.h"

@interface SplashViewController ()

@end

@implementation SplashViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        // For iPhone
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        
    } else {
        // For iPad
        self = [super initWithNibName:@"SplashViewController-iPad" bundle:nibBundleOrNil];
    }
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(goToLoginScreen) userInfo:nil repeats:NO];

}

-(void) goToLoginScreen
{
    NSString *email=[[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
    NSString *password=[[NSUserDefaults standardUserDefaults]objectForKey:@"password"];
    NSString *accountType=[[NSUserDefaults standardUserDefaults]objectForKey:@"account_type"];
    if([email isEqualToString:@""]||[email isEqualToString:nil]||[email length]==0||[password isEqualToString:@""]||[password isEqualToString:nil]||password.length==0)
    {
        LoginViewController *loginView=[[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        [self.navigationController pushViewController:loginView animated:YES];
    }
    else
    {
        if([accountType isEqualToString:@"0"])
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
    
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
