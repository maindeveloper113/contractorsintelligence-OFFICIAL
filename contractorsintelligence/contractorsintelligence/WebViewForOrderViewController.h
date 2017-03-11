//
//  WebViewForOrderViewController.h
//  ExamPrep
//
//  Created by IBL Infotech on 03/11/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebViewForOrderViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webview;

@property (strong, nonatomic) NSString *OrderTestName;
- (IBAction)btnBack:(id)sender;
- (IBAction)btnLogout:(id)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicatorWebview;



@end
