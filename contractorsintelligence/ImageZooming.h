//
//  ImageZooming.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 27/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageZooming : UIViewController<UIScrollViewDelegate,UIGestureRecognizerDelegate,UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *ZoomingImage;
@property (weak, nonatomic) UIImage *imageOfStep3;
- (IBAction)BackTOTest:(id)sender;
@property (strong, nonatomic) IBOutlet UIWebView *webViewForImage;
@property (strong,nonatomic) NSString *urlForZoom;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicatorWebview;


@end
