//
//  webViewForOpenPdfViewController.m
//  ExamPrep
//
//  Created by IBL Infotech on 04/11/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "webViewForOpenPdfViewController.h"

@interface webViewForOpenPdfViewController ()

@end

@implementation webViewForOpenPdfViewController

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
    // Do any additional setup after loading the view from its nib.
    [self openPdf];
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (IBAction)btnBack:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)openPdf
{

        NSURL *url1 = [NSURL URLWithString:[self.urlforpdf stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        NSLog(@"%@",url1);
        NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url1];
       
        [self.webview loadRequest:req];
        self.webview.scalesPageToFit=YES;

}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    
    [self.indicatorWebview startAnimating];
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.indicatorWebview stopAnimating];
}

@end
