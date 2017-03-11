//
//  ImageZooming.m
//  contractorsintelligence
//
//  Created by IBL Infotech on 27/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "ImageZooming.h"
#import "OnlionTestStep3ViewController.h"

@interface ImageZooming ()

@end

@implementation ImageZooming

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
    NSLog(@"%@",self.urlForZoom);
    [self openImage];
    // Do any additional setup after loading the view from its nib.
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(void)openImage
{
    NSURL *url1 = [NSURL URLWithString:[self.urlForZoom stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"%@",url1);
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url1];
   [self.webViewForImage loadRequest:req];
    self.webViewForImage.scalesPageToFit=YES;
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.indicatorWebview stopAnimating];
    NSString *bodyStyleVertical = @"document.getElementsByTagName('body')[0].style.verticalAlign = 'middle';";
    NSString *bodyStyleHorizontal = @"document.getElementsByTagName('body')[0].style.textAlign = 'center';";
    [webView stringByEvaluatingJavaScriptFromString:bodyStyleVertical];
    [webView stringByEvaluatingJavaScriptFromString:bodyStyleHorizontal];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)BackTOTest:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
