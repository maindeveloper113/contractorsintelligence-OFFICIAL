//
//  OpenVideoViewController.m
//  ExamPrep
//
//  Created by IBL Infotech on 24/11/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "OpenVideoViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>
#import "ApplicationTabViewController.h"
@interface OpenVideoViewController ()

@end

@implementation OpenVideoViewController
@synthesize controller;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        // For iPhone
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    } else {
        // For iPad
        self = [super initWithNibName:@"OpenVideoViewController~ipad" bundle:nibBundleOrNil];
    }

    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    controller=[[MPMoviePlayerController alloc]init];
    // enable textview autoresizing
    //[controller.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth];

    [self openVideoformUrl];
    // Do any additional setup after loading the view from its nib.
}
//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return (UIInterfaceOrientationLandscapeLeft);
//}
//- (BOOL)shouldAutorotate
//{
//    return YES;
//}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft;
}
-(BOOL)shouldAutorotate
{
    return NO;
}
//-(NSUInteger)supportedInterfaceOrientations
//{
//    return UIInterfaceOrientationLandscapeLeft;
//}
//- (void)willAnimateRotationToInterfaceOrientation:
//(UIInterfaceOrientation)toInterfaceOrientation
//                                         duration:(NSTimeInterval)duration
//{
//    if (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft)
//    {
//        NSLog(@"in Landscape");
//        
//        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
//            
//            // For iPhone
//            [controller.view setFrame:CGRectMake(0, 0, 568, 320)];
//        } else {
//            // For iPad
//            [controller.view setFrame:CGRectMake(0, 0, 960, 540)];
//        }
//    }
//    else
//    {
//        NSLog(@"not in Landscape");
//    }
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(void)openVideoformUrl
{
    controller=[[MPMoviePlayerController alloc]init];
    
    NSURL * url=[NSURL URLWithString:self.VideoURL];
    
    controller=[[MPMoviePlayerController alloc]initWithContentURL:url];
        
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(movieIsFinished1:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    controller.controlStyle=MPMovieControlStyleFullscreen;
    
    [controller.view setFrame:self.view.frame];
    [controller.view setCenter:self.view.center];
    [self.view addSubview:controller.view];
    NSError *_error = nil;
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayback error: &_error];
    
    [controller play];
}
-(IBAction)movieIsFinished1:(id)sender
{
    //ApplicationTabViewController *Application1=[[ApplicationTabViewController alloc]initWithNibName:@"ApplicationTabViewController" bundle:nil];
    
    [controller stop];
    [controller.view removeFromSuperview];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
     [self dismissViewControllerAnimated:YES completion:nil];
    //[self.navigationController pushViewController:Application1 animated:YES];
    
}

@end
