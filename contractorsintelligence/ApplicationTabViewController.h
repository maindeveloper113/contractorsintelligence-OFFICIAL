//
//  ApplicationTabViewController.h
//  contractorsintelligence
//
//  Created by IBL Infotech on 02/10/14.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PECropViewController.h"

@interface ApplicationTabViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,PECropViewControllerDelegate,UIAlertViewDelegate,UINavigationControllerDelegate,UIWebViewDelegate>

- (IBAction)goToBack:(id)sender;

//Tab menu
@property (weak, nonatomic) IBOutlet UIButton *btn_tab_viewForApp;
@property (weak, nonatomic) IBOutlet UIButton *btn_tab_viewCorrection;
@property (weak, nonatomic) IBOutlet UIButton *btn_tab_uploadApp;
@property (weak, nonatomic) IBOutlet UIButton *btn_tab_downloadForm;

- (IBAction)openVideoForAppTab:(id)sender;
- (IBAction)openViewCorrection:(id)sender;
- (IBAction)openUploadApplication:(id)sender;
- (IBAction)openDownloadForm:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *currentView;


//Video for Application
@property (strong, nonatomic) IBOutlet UIView *viewVideoForApp;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollviewForVideoShow;
- (IBAction)btnVideo1:(id)sender;
- (IBAction)btnVideo2:(id)sender;
- (IBAction)btnVideo3:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnVideo1outlet;
@property (strong, nonatomic) IBOutlet UIButton *btnVideo2outlet;
@property (strong, nonatomic) IBOutlet UIButton *btnVideo3outlet;


@property (strong, nonatomic) IBOutlet UILabel *lblVideo1;
@property (strong, nonatomic) IBOutlet UILabel *lblVideo2;
@property (strong, nonatomic) IBOutlet UILabel *lblVideo3;
@property (strong, nonatomic) NSMutableArray *arrVideo;
@property (weak, nonatomic) IBOutlet UITableView *tv_viewVideo;


//View for Correction
@property (strong, nonatomic) IBOutlet UIView *viewForCorrection;
@property (strong, nonatomic) NSMutableArray *arrViewCorrections;
@property (weak, nonatomic) IBOutlet UILabel *lblHDocName;
@property (weak, nonatomic) IBOutlet UILabel *lblHReviewDate;
@property (weak, nonatomic) IBOutlet UILabel *lblHView;
@property (weak, nonatomic) IBOutlet UITableView *tv_viewCorrections;



//upload Application
@property (strong, nonatomic) IBOutlet UIView *viewForUploadApplication;
@property (strong, nonatomic) NSMutableArray *arrUploadedApp;
@property (weak, nonatomic) IBOutlet UITableView *tv_applicationUploaded;
@property (weak, nonatomic) IBOutlet UILabel *lblH1DocName;
@property (weak, nonatomic) IBOutlet UILabel *lblH1ReviewDate;
@property (weak, nonatomic) IBOutlet UILabel *lblH1View;

@property (weak, nonatomic) IBOutlet UIButton *btnChooseFile;
@property (weak, nonatomic) IBOutlet UILabel *lblSelectAFile;
- (IBAction)chooseFileForUpload:(id)sender;
- (IBAction)uploadSelectedFile:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imgviewApp;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *indicatorUploadImage;
//Image view for uploading image
@property (strong, nonatomic) IBOutlet UIView *SubviewForUploadImage;
@property (strong, nonatomic) IBOutlet UIImageView *ImageviewUploadimage;



//Download form
@property (strong, nonatomic) IBOutlet UIView *viewForDownloadForm;
@property (weak, nonatomic) IBOutlet UILabel *lblForm1;
@property (weak, nonatomic) IBOutlet UILabel *lblForm2;
@property (weak, nonatomic) IBOutlet UILabel *lblSubForm1;
@property (weak, nonatomic) IBOutlet UILabel *lblSubForm2;
@property (weak, nonatomic) IBOutlet UILabel *lblSubForm3;
@property (weak, nonatomic) IBOutlet UILabel *lblSubForm4;
@property (weak, nonatomic) IBOutlet UILabel *lblSubForm5;
@property (weak, nonatomic) IBOutlet UILabel *lblSubForm6;
@property (weak, nonatomic) IBOutlet UILabel *lblSubForm7;
@property (weak, nonatomic) IBOutlet UILabel *lblSubForm8;
- (IBAction)downloadForm1:(id)sender;
- (IBAction)downloadForm2:(id)sender;
- (IBAction)downloadForm3:(id)sender;
- (IBAction)downloadForm4:(id)sender;
- (IBAction)downloadForm5:(id)sender;
- (IBAction)downloadForm6:(id)sender;
- (IBAction)downloadForm7:(id)sender;
- (IBAction)downloadForm8:(id)sender;
// LogOut
- (IBAction)LogOut:(id)sender;


@end
