//
//  DocumentCorrectionTableViewCell.h
//  ExamPrep
//
//  Created by IBL Infotech on 01/11/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DocumentCorrectionTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblNumber;
@property (strong, nonatomic) IBOutlet UITextView *txtTextCorrection;

@property (strong, nonatomic) IBOutlet UIImageView *imageSelect;




@end
