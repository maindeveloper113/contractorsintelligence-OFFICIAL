//
//  DisplayCorrectionViewController.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 03/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayCorrectionViewController : UIViewController<UIWebViewDelegate,UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) NSString *doc_name;
@property (strong, nonatomic) NSString *idDocomentCorrection;

@property (weak, nonatomic) IBOutlet UIWebView *webViewForDoc;
- (IBAction)closeCurrentView:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *tableviewCorrection;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicatorForPdfview;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicatorForTableview;



@end
