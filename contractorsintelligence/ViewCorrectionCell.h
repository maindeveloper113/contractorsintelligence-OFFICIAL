//
//  ViewCorrectionCell.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 03/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewCorrectionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblDocName;
@property (weak, nonatomic) IBOutlet UILabel *lblReviewDate;
@property (weak, nonatomic) IBOutlet UIButton *btnViewDoc;
@property (weak, nonatomic) IBOutlet UIImageView *imgCellBG;
@property (strong, nonatomic) IBOutlet UIButton *btnViewCell;


@end
