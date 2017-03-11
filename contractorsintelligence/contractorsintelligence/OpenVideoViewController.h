//
//  OpenVideoViewController.h
//  ExamPrep
//
//  Created by IBL Infotech on 24/11/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface OpenVideoViewController : UIViewController
@property (strong, nonatomic) MPMoviePlayerController *controller;
@property (strong, nonatomic) NSString *VideoURL;
@end
