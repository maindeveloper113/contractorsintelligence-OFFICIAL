//
//  AppDelegate.m
//  contractorsintelligence
//0
//  Created by IBL Infotech on 29/09/14.
//  Copyright (c) 2014 IBL Infotech. All0 rights reserved.
//

#import "AppDelegate.h"
#import "SplashViewController.h"
#import "ApplicationTabViewController.h"
#import "Crittercism.h"

@implementation AppDelegate
@synthesize nav;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    [Crittercism enableWithAppID:@"4ce2d43766d78766a1000013"];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    NSLog(@"Registering for push notifications...");
//    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
//     (UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
     (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound | UIRemoteNotificationTypeAlert)];
    
    SplashViewController *splashScreen=[[SplashViewController alloc] initWithNibName:@"SplashViewController" bundle:nil];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        // For iPhone
        splashScreen=[[SplashViewController alloc] initWithNibName:@"SplashViewController" bundle:nil];
        
    } else {
        // For iPad
        splashScreen=[[SplashViewController alloc] initWithNibName:@"SplashViewController~ipad" bundle:nil];
    }
    
    nav=[[UINavigationController alloc] initWithRootViewController:splashScreen];
    [nav setNavigationBarHidden:YES];
    [self.window setRootViewController:nav];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

-(void)application:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    
    @try {
        NSLog(@"pintu:%@",userInfo);
        NSString *pushText=[userInfo objectForKey:@"message_text"];
        [[NSUserDefaults standardUserDefaults]setObject:@"1" forKey:@"Notification_handle"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        ApplicationTabViewController *appViewController=[[ApplicationTabViewController alloc]initWithNibName:@"ApplicationTabViewController" bundle:nil];
        [self.nav pushViewController:appViewController animated:YES];
        
                
        
    }
    @catch (NSException *exception) {

        NSLog(@"%@",exception.reason);
//        UIAlertView *alertMessage=[[UIAlertView alloc]initWithTitle:@"Error" message:[exception reason] delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
//        [alertMessage show];
    }
    
}


- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *strTocken = [NSString stringWithFormat:@"Device Token=%@",deviceToken];
    strTocken=[[deviceToken description] stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"<>"]];
    strTocken = [strTocken stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSLog(@"%@", strTocken);
    
    [[NSUserDefaults standardUserDefaults] setObject:strTocken forKey:@"deviceToken"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
//                UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"UUID"
//                                                                       message:strTocken
//                                                                      delegate:self
//                                                             cancelButtonTitle:@"Ok"
//                                                             otherButtonTitles:nil,nil];
//    
//                [alertMessage show];
}


- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError *)err {
    
    NSString *str = [NSString stringWithFormat: @"Error: %@", err];
    NSLog(@"%@",str);
    
    //    UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"UUID"
    //                                                           message:str
    //                                                          delegate:self
    //                                                 cancelButtonTitle:@"Ok"
    //                                                 otherButtonTitles:nil,nil];
    //
    //    [alertMessage show];
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
