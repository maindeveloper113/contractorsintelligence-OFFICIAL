//
//  UploadImageDisplayViewController.h
//  ExamPrep
//
//  Created by IBL Infotech on 03/11/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UploadImageDisplayViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageUploadImageDisplay;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (strong, nonatomic) NSString *strImageview;
@property (strong, nonatomic) IBOutlet UIButton *btnCancel;
- (IBAction)btnCancel:(id)sender;

@end
