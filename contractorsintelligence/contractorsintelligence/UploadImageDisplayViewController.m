//
//  UploadImageDisplayViewController.m
//  ExamPrep
//
//  Created by IBL Infotech on 03/11/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "UploadImageDisplayViewController.h"

@interface UploadImageDisplayViewController ()

@end

@implementation UploadImageDisplayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    NSURL *url = [NSURL URLWithString:self.strImageview];
    NSData *dataUploadImage = [[NSData alloc]initWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.indicator stopAnimating];
    [self.imageUploadImageDisplay setImage:[UIImage imageWithData:dataUploadImage]];
        });
    });
            
    // Do any additional setup after loading the view from its nib.
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

- (IBAction)btnCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
