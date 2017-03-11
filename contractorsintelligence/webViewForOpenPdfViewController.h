//
//  webViewForOpenPdfViewController.h
//  ExamPrep
//
//  Created by IBL Infotech on 04/11/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewForOpenPdfViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property (strong, nonatomic) NSString *urlforpdf;
- (IBAction)btnBack:(id)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicatorWebview;


@end
