
//  ApplicationTabViewController.m hh
//  contractorsintelligence
//  Created by IBL Infotech on 02/10/14 ojoo.
//  Copyright (c) 2014 IBL Infotech. All rights reserved.
//

#import "ApplicationTabViewController.h"
#import "ViewCorrectionCell.h"
#import "UploadApplicationCell.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "MBProgressHUD.h"
#import "Contact.h"
#import "DisplayCorrectionViewController.h"
#import "LoginViewController.h"
#import "UploadImageDisplayViewController.h"
#import "DashboardOneViewController.h"
#import "OpenVideoViewController.h"

#import "SimpleTableCell.h"

@interface ApplicationTabViewController ()
{
    UIImage *selectedImage;
    NSString *flageOpenUploadImage;
    NSString *btn_video_Image;
    NSString *btn_ImageUpload_image;
    NSString *btn_ViewCorrection_image;
    NSString *btn_Form_image;
    NSString *btn_video_Image_hover;
    NSString *btn_ImageUpload_image_hover;
    NSString *btn_ViewCorrection_image_hover;
    NSString *btn_Form_image_hover;
    NSArray *viewControllers;
    DashboardOneViewController *dashboard123;
    
    NSString *flagOpenVideo;
}
@end

@implementation ApplicationTabViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        // For iPhone
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    } else {
        // For iPad
        self = [super initWithNibName:@"ApplicationTabViewController~ipad" bundle:nibBundleOrNil];
    }
    
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    viewControllers=[self.navigationController viewControllers];
    dashboard123=nil;
    flageOpenUploadImage=@"0";
    flagOpenVideo=@"1";
    [self.indicatorUploadImage stopAnimating];
    self.tv_applicationUploaded.backgroundColor = [UIColor clearColor];
    self.tv_viewCorrections.backgroundColor = [UIColor clearColor];
    NSString *notifiacation=[[NSUserDefaults standardUserDefaults]objectForKey:@"Notification_handle"];
    if([notifiacation isEqualToString:@"1"])
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
        [self.btn_tab_viewForApp setImage:[UIImage imageNamed:@"btn_videos_forms_1@2x.png"] forState:UIControlStateNormal];
        [self.btn_tab_uploadApp setImage:[UIImage imageNamed:@"btn_upload_application1@2x.png"] forState:UIControlStateNormal];
        
        [self.btn_tab_downloadForm setImage:[UIImage imageNamed:@"btn_download_forms1@2x.png"] forState:UIControlStateNormal];
        [self.btn_tab_viewCorrection setImage:[UIImage imageNamed:@"btn_view_corrections_hover1@2x.png"] forState:UIControlStateNormal];
        }
        else
        {
            [self.btn_tab_viewForApp setImage:[UIImage imageNamed:@"btn_videos_forms_hoover1@2x.png"] forState:UIControlStateNormal];
            [self.btn_tab_uploadApp setImage:[UIImage imageNamed:@"btn_upload_application_iPad@2x.png"] forState:UIControlStateNormal];
            
            [self.btn_tab_downloadForm setImage:[UIImage imageNamed:@"btn_download_forms_iPad@2x.png"] forState:UIControlStateNormal];
            [self.btn_tab_viewCorrection setImage:[UIImage imageNamed:@"btn_view_corrections_hover_iPad@2x.png"] forState:UIControlStateNormal];
        }
        //[self setDefaultImageToTabs];
        [self removeAllViewFromCurrentView];
        [self.currentView addSubview:self.viewForCorrection];
        [self loadViewCorrections];
        
    }
    else
    {
    // Do any additional setup after loading the view from its nib.
    self.tv_applicationUploaded.backgroundColor = [UIColor clearColor];
    self.tv_viewCorrections.backgroundColor = [UIColor clearColor];
    
    [self.currentView addSubview:self.viewVideoForApp];
    [self loadVideo];
        
        
    }
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        
        [self.scrollviewForVideoShow setContentSize:CGSizeMake(320.0,800.0)];
        btn_video_Image=@"btn_videos_forms_1@2x.png";
        btn_ImageUpload_image=@"btn_upload_application1@2x.png";
        btn_ViewCorrection_image=@"btn_view_corrections1@2x.png";
        btn_Form_image=@"btn_download_forms1@2x.png";
        
        btn_video_Image_hover=@"btn_videos_forms_hoover1@2x.png";
        btn_ImageUpload_image_hover=@"btn_upload_application_hover1@2x.png";
        btn_ViewCorrection_image_hover=@"btn_view_corrections_hover1@2x.png";
        btn_Form_image_hover=@"btn_download_forms_hover1@2x.png";
        
        [self.lblHDocName setFont:[UIFont fontWithName:@"Eurostile LT" size:16.0]];
        [self.lblHReviewDate setFont:[UIFont fontWithName:@"Eurostile LT" size:16.0]];
        [self.lblHView setFont:[UIFont fontWithName:@"Eurostile LT" size:16.0]];
        [self.lblH1DocName setFont:[UIFont fontWithName:@"Eurostile LT" size:16.0]];
        [self.lblH1ReviewDate setFont:[UIFont fontWithName:@"Eurostile LT" size:16.0]];
        [self.lblH1View setFont:[UIFont fontWithName:@"Eurostile LT" size:16.0]];
        [self.lblSelectAFile setFont:[UIFont fontWithName:@"Eurostile LT" size:16.0]];
        [self.lblForm1 setFont:[UIFont fontWithName:@"Eurostile LT" size:18.0]];
        [self.lblForm2 setFont:[UIFont fontWithName:@"Eurostile LT" size:18.0]];
        [self.lblSubForm1 setFont:[UIFont fontWithName:@"Eurostile LT" size:12.0]];
        [self.lblSubForm2 setFont:[UIFont fontWithName:@"Eurostile LT" size:12.0]];
        [self.lblSubForm3 setFont:[UIFont fontWithName:@"Eurostile LT" size:12.0]];
        [self.lblSubForm4 setFont:[UIFont fontWithName:@"Eurostile LT" size:12.0]];
        [self.lblSubForm5 setFont:[UIFont fontWithName:@"Eurostile LT" size:12.0]];
        [self.lblSubForm6 setFont:[UIFont fontWithName:@"Eurostile LT" size:12.0]];
        [self.lblSubForm7 setFont:[UIFont fontWithName:@"Eurostile LT" size:12.0]];
        [self.lblSubForm8 setFont:[UIFont fontWithName:@"Eurostile LT" size:12.0]];
        [self.lblVideo1 setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
        [self.lblVideo2 setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
        [self.lblVideo3 setFont:[UIFont fontWithName:@"Eurostile LT" size:13.0]];
    }
    else
    {
        [self.scrollviewForVideoShow setContentSize:CGSizeMake(568,1400.0)];
        btn_video_Image=@"btn_ videos_for_application_iPad@2x.png";
        btn_ImageUpload_image=@"btn_upload_application_iPad@2x.png";
        btn_ViewCorrection_image=@"btn_view_corrections_iPad@2x .png";
        btn_Form_image=@"btn_ download_forms_iPad@2x.png";
        
        btn_video_Image_hover=@"btn_ videos_for_application_hover_iPad@2x.png";
        btn_ImageUpload_image_hover=@"btn_upload_application_hover_iPad@2x.png";
        btn_ViewCorrection_image_hover=@"btn_view_corrections_hover_iPad@2x.png";
        btn_Form_image_hover=@"btn_ download_forms_hover_iPad@2x.png";
        
        UIFont *fontiPad25=[UIFont fontWithName:@"Eurostile LT" size:25.0];
        UIFont *fontiPad20=[UIFont fontWithName:@"Eurostile LT" size:20.0];
        UIFont *fontiPad23=[UIFont fontWithName:@"Eurostile LT" size:23.0];
                
        [self.lblHDocName setFont:fontiPad23];
        [self.lblHReviewDate setFont:fontiPad23];
        [self.lblHView setFont:fontiPad23];
        [self.lblH1DocName setFont:fontiPad23];
        [self.lblH1ReviewDate setFont:fontiPad23];
        [self.lblSelectAFile setFont:fontiPad23];
        
        [self.lblH1View setFont:[UIFont fontWithName:@"Eurostile LT" size:16.0]];
        
        [self.lblForm1 setFont:fontiPad25];
        [self.lblForm2 setFont:fontiPad25];
        
        [self.lblSubForm1 setFont:fontiPad20];
        [self.lblSubForm2 setFont:fontiPad20];
        [self.lblSubForm3 setFont:fontiPad20];
        [self.lblSubForm4 setFont:fontiPad20];
        [self.lblSubForm5 setFont:fontiPad20];
        [self.lblSubForm6 setFont:fontiPad20];
        [self.lblSubForm7 setFont:fontiPad20];
        [self.lblSubForm8 setFont:fontiPad20];
        [self.lblVideo1 setFont:fontiPad20];
        [self.lblVideo2 setFont:fontiPad20];
        [self.lblVideo3 setFont:fontiPad20];
     
        
    }
    [self.btn_tab_viewForApp setImage:[UIImage imageNamed:btn_video_Image_hover] forState:UIControlStateNormal];
   
    self.arrViewCorrections=[[NSMutableArray alloc] init];
    
       self.arrVideo=[[NSMutableArray alloc] init];
    
    self.arrUploadedApp=[[NSMutableArray alloc] init];
    
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (BOOL)shouldAutorotate
{
    return NO;
}

-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

-(void)viewDidAppear:(BOOL)animated
{
   // [self shouldAutorotate];
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goToBack:(id)sender {
    
    for (int i=0; i<[viewControllers count]; i++)
    {
        UIViewController *tempVC=[viewControllers objectAtIndex:i];
        if([tempVC isKindOfClass:[DashboardOneViewController class]])
        {
            dashboard123=[viewControllers objectAtIndex:i];
            break;
        }
    }
    
    
    if(dashboard123)
        [self.navigationController popToViewController:dashboard123 animated:YES];
    
}
- (IBAction)openVideoForAppTab:(id)sender {
    flageOpenUploadImage=@"0";
    flagOpenVideo=@"1";
    [self setDefaultImageToTabs];
    [self removeAllViewFromCurrentView];
    
    [self.currentView addSubview:self.viewVideoForApp];
    UIImage *tempImg=[UIImage imageNamed:btn_video_Image_hover];
    [self.btn_tab_viewForApp setImage:tempImg forState:UIControlStateNormal];
    
}

- (IBAction)openViewCorrection:(id)sender {
    flageOpenUploadImage=@"0";
    flagOpenVideo=@"0";
    [self setDefaultImageToTabs];
    [self removeAllViewFromCurrentView];
    [self.currentView addSubview:self.viewForCorrection];
    [self.btn_tab_viewCorrection setImage:[UIImage imageNamed:btn_ViewCorrection_image_hover] forState:UIControlStateNormal];
    [self loadViewCorrections];
    
    
}

- (IBAction)openUploadApplication:(id)sender {
    
    flageOpenUploadImage=@"1";
    flagOpenVideo=@"0";
    [self setDefaultImageToTabs];
    [self removeAllViewFromCurrentView];
    [self.currentView addSubview:self.viewForUploadApplication];
    [self.btn_tab_uploadApp setImage:[UIImage imageNamed:btn_ImageUpload_image_hover] forState:UIControlStateNormal];
    [self loadUploadedApplication];
    
}

- (IBAction)openDownloadForm:(id)sender {
    flageOpenUploadImage=@"0";
    [self setDefaultImageToTabs];
    [self removeAllViewFromCurrentView];
    
    [self.currentView addSubview:self.viewForDownloadForm];
    [self.btn_tab_downloadForm setImage:[UIImage imageNamed:btn_Form_image_hover] forState:UIControlStateNormal];
}

-(void) setDefaultImageToTabs
{
    [self.btn_tab_viewForApp setImage:[UIImage imageNamed:btn_video_Image] forState:UIControlStateNormal];
    [self.btn_tab_uploadApp setImage:[UIImage imageNamed:btn_ImageUpload_image] forState:UIControlStateNormal];
    [self.btn_tab_viewCorrection setImage:[UIImage imageNamed:btn_ViewCorrection_image] forState:UIControlStateNormal];
    [self.btn_tab_downloadForm setImage:[UIImage imageNamed:btn_Form_image] forState:UIControlStateNormal];
    
}

-(void) removeAllViewFromCurrentView
{
    //    [self.btnChooseFile setTitle:@"Choose file" forState:UIControlStateNormal];
    
    [self.viewVideoForApp removeFromSuperview];
    [self.viewForUploadApplication removeFromSuperview];
    [self.viewForCorrection removeFromSuperview];
    [self.viewForDownloadForm removeFromSuperview];
}

#pragma mark - UITableViewDelegate methods
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView==self.tv_viewVideo)
    {
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {

        static NSString *simpleTableIdentifier = @"SimpleTableCell";
        
        SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
            
        if (cell == nil)
        {
            NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
            cell = [nib objectAtIndex:0];
        }
        
        NSMutableDictionary *singleRecord=[self.arrVideo objectAtIndex:indexPath.row];
        
        [cell.lblName setText:[singleRecord objectForKey:@"Name"]];
       
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSString *imgURL = [singleRecord objectForKey:@"ThumbnailURL"];
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
            //set your image on main thread.
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.thumbnailImageView.contentMode = UIViewContentModeScaleAspectFill;
                cell.thumbnailImageView.clipsToBounds = YES;
                [cell.thumbnailImageView setImage:[UIImage imageWithData:data]];
  
            });
        });
            
        return cell;
            
        }
        else
        {
           static NSString *simpleTableIdentifier = @"SimpleTableCell";
            
            SimpleTableCell *cell = (SimpleTableCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
            if (cell == nil)
            {
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell_ipad" owner:self options:nil];
                cell = [nib objectAtIndex:0];
            }
            
            NSMutableDictionary *singleRecord=[self.arrVideo objectAtIndex:indexPath.row];
            
            [cell.lblName setText:[singleRecord objectForKey:@"Name"]];

            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                NSString *imgURL = [singleRecord objectForKey:@"ThumbnailURL"];
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imgURL]];
                //set your image on main thread.
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.thumbnailImageView.contentMode = UIViewContentModeScaleAspectFill;
                    cell.thumbnailImageView.clipsToBounds = YES;
                    [cell.thumbnailImageView setImage:[UIImage imageWithData:data]];
                    
                });
            });
               return cell;
            
        }
       
    }
    
    if(tableView==self.tv_viewCorrections)
        
    {
        static NSString *CellIdentifier = @"SimpleTableCell";
        ViewCorrectionCell *viewCorrCell;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            viewCorrCell = (ViewCorrectionCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if(viewCorrCell==nil)
            {
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ViewCorrectionCell" owner:self options:nil];
                viewCorrCell = [nib objectAtIndex:0];
            }
            viewCorrCell.backgroundColor=[UIColor clearColor];
            NSMutableDictionary *singleRecord=[self.arrViewCorrections objectAtIndex:indexPath.row];
            
            [viewCorrCell.lblDocName setText:[singleRecord objectForKey:@"doc_name"]];
            [viewCorrCell.lblReviewDate setText:[singleRecord objectForKey:@"date"]];
            if([[singleRecord objectForKey:@"student_view"]isEqualToString:@"400"])
            {
                [viewCorrCell.btnViewCell setImage:[UIImage imageNamed:@"btn_view_old.png"] forState:UIControlStateNormal ];
            }
            else
            {
                [viewCorrCell.btnViewCell setImage:[UIImage imageNamed:@"btn_view_new.png"] forState:UIControlStateNormal];
            }
            
            [viewCorrCell.lblDocName setFont:[UIFont fontWithName:@"Eurostile LT" size:12.0]];
            [viewCorrCell.lblReviewDate setFont:[UIFont fontWithName:@"Eurostile LT" size:12.0]];
            
            [viewCorrCell.btnViewDoc setTag:indexPath.row];
            [viewCorrCell.btnViewDoc addTarget:self action:@selector(viewCorrectionDoc:) forControlEvents:UIControlEventTouchUpInside];
            
            if(indexPath.row==0)
            {
                [viewCorrCell.imgCellBG setImage:[UIImage imageNamed:@"table_view_main@2x.png"]];
            }
            else if(indexPath.row==[self.arrViewCorrections count]-1)
            {
                [viewCorrCell.imgCellBG setImage:[UIImage imageNamed:@"table_view_bottom@2x.png"]];
            }
            
            [viewCorrCell setBackgroundColor:[UIColor clearColor]];
        }
        else
        {
            viewCorrCell = (ViewCorrectionCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if(viewCorrCell==nil)
            {
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"ViewCorrectionCell_ipad" owner:self options:nil];
                viewCorrCell = [nib objectAtIndex:0];
            }
            viewCorrCell.backgroundColor=[UIColor clearColor];
            NSMutableDictionary *singleRecord=[self.arrViewCorrections objectAtIndex:indexPath.row];
            
            [viewCorrCell.lblDocName setText:[singleRecord objectForKey:@"doc_name"]];
            [viewCorrCell.lblReviewDate setText:[singleRecord objectForKey:@"date"]];
            [viewCorrCell.lblDocName setFont:[UIFont fontWithName:@"Agency FB" size:25.0]];
            [viewCorrCell.lblReviewDate setFont:[UIFont fontWithName:@"Agency FB" size:25.0]];
            if([[singleRecord objectForKey:@"student_view"]isEqualToString:@"400"])
            {
                [viewCorrCell.btnViewCell setImage:[UIImage imageNamed:@"btn_view_old_ipad.png"] forState:UIControlStateNormal ];
            }
            else
            {
                [viewCorrCell.btnViewCell setImage:[UIImage imageNamed:@"btn_view_new_ipad.png"] forState:UIControlStateNormal];
            }

            [viewCorrCell.btnViewDoc setTag:indexPath.row];
            [viewCorrCell.btnViewDoc addTarget:self action:@selector(viewCorrectionDoc:) forControlEvents:UIControlEventTouchUpInside];
            
            if(indexPath.row==0)
            {
                [viewCorrCell.imgCellBG setImage:[UIImage imageNamed:@"table_view_main@2x.png"]];
            }
            else if(indexPath.row==[self.arrViewCorrections count]-1)
            {
                [viewCorrCell.imgCellBG setImage:[UIImage imageNamed:@"table_view_bottom@2x.png"]];
            }
        }
        
        
        
        return viewCorrCell;
    }
    else
    {
        static NSString *CellIdentifier = @"SimpleTableCell";
        UploadApplicationCell *uploadAppCell;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            uploadAppCell = (UploadApplicationCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if(uploadAppCell==nil)
            {
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"UploadApplicationCell" owner:self options:nil];
                uploadAppCell = [nib objectAtIndex:0];
            }
            uploadAppCell.backgroundColor=[UIColor clearColor];
            NSMutableDictionary *singleRecord=[self.arrUploadedApp objectAtIndex:indexPath.row];
            
            [uploadAppCell.lblDocName setText:[singleRecord objectForKey:@"doc_name"]];
            [uploadAppCell.lblDate setText:[singleRecord objectForKey:@"date_time"]];
            
            if([[singleRecord objectForKey:@"review"] isEqualToString:@"0"])
            {
                [uploadAppCell.lblReviewStatus setText:@"Waiting for Review"];
            }
            else
            {
                [uploadAppCell.lblReviewStatus setText:@"Review"];
            }
            
            
            [uploadAppCell.lblDocName setFont:[UIFont fontWithName:@"Eurostile LT" size:10.0]];
            [uploadAppCell.lblDate setFont:[UIFont fontWithName:@"Eurostile LT" size:10.0]];
            [uploadAppCell.lblReviewStatus setFont:[UIFont fontWithName:@"Eurostile LT" size:10.0]];
            
            
            if(indexPath.row==0)
            {
                [uploadAppCell.imgCellBG setImage:[UIImage imageNamed:@"table_view_main@2x.png"]];
            }
            else if(indexPath.row==[self.arrUploadedApp count]-1)
            {
                [uploadAppCell.imgCellBG setImage:[UIImage imageNamed:@"table_view_bottom@2x.png"]];
            }
            
        }
        else
            
        {
            uploadAppCell = (UploadApplicationCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            if(uploadAppCell==nil)
            {
                NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"UploadApplicationCell_ipad" owner:self options:nil];
                uploadAppCell = [nib objectAtIndex:0];
            }
            uploadAppCell.backgroundColor=[UIColor clearColor];
            NSMutableDictionary *singleRecord=[self.arrUploadedApp objectAtIndex:indexPath.row];
            
            [uploadAppCell.lblDocName setText:[singleRecord objectForKey:@"doc_name"]];
            [uploadAppCell.lblDate setText:[singleRecord objectForKey:@"date_time"]];
            
            if([[singleRecord objectForKey:@"review"] isEqualToString:@"0"])
            {
                [uploadAppCell.lblReviewStatus setText:@"Waiting for Review"];
            }
            else
            {
                [uploadAppCell.lblReviewStatus setText:@"Review"];
            }
            
            
            [uploadAppCell.lblDocName setFont:[UIFont fontWithName:@"Agency FB" size:25.0]];
            [uploadAppCell.lblDate setFont:[UIFont fontWithName:@"Agency FB" size:25.0]];
            [uploadAppCell.lblReviewStatus setFont:[UIFont fontWithName:@"Agency FB" size:25.0]];
            
            
            if(indexPath.row==0)
            {
                [uploadAppCell.imgCellBG setImage:[UIImage imageNamed:@"table_view_main@2x.png"]];
            }
            else if(indexPath.row==[self.arrUploadedApp count]-1)
            {
                [uploadAppCell.imgCellBG setImage:[UIImage imageNamed:@"table_view_bottom@2x.png"]];
            }
            
        }
        return uploadAppCell;
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView==self.tv_viewCorrections)
    {
        return [self.arrViewCorrections count];
    }
    else if(tableView==self.tv_viewVideo)
    {
        return [self.arrVideo count];
    }
    else
    {
        return [self.arrUploadedApp count];
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([flageOpenUploadImage isEqualToString:@"1"])
    {
    UploadImageDisplayViewController *ImageView=[[UploadImageDisplayViewController alloc]initWithNibName:@"UploadImageDisplayViewController" bundle:nil];
    NSMutableDictionary *dicimageUpload=[self.arrUploadedApp objectAtIndex:indexPath.row];
        
    NSString *urlImage=[NSString stringWithFormat:@"http://www.contractorsischool.com/staff/review_document/%@",[dicimageUpload objectForKey:@"doc_name"]];
        
    ImageView.strImageview =urlImage;
        
    [self presentViewController:ImageView animated:YES completion:nil];
        
    }
    else
    {
        if([flagOpenVideo isEqualToString:@"1"])
        {
          
            NSMutableDictionary *video=[self.arrVideo objectAtIndex:indexPath.row];
            OpenVideoViewController *openVideo=[[OpenVideoViewController alloc]initWithNibName:@"OpenVideoViewController" bundle:nil];
            openVideo.VideoURL=[video objectForKey:@"iOSURL"];
            [self presentViewController:openVideo animated:YES completion:nil];
           
           // NSString *vidID;
          //  vidID=@"gtPstBviRWg";
          //  [self playVideoWithId:vidID];
            
        }
        
        return;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==self.tv_viewCorrections)
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            return 45;
        }
        else
        {
            return 60;
        }
    }
    else
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
        {
            return 80;
        }
        else
        {
            return 110;
        }
    }

  
}

-(IBAction)viewCorrectionDoc:(id)sender
{
    NSString *docName=[[self.arrViewCorrections objectAtIndex:[sender tag]] objectForKey:@"doc_name"];
     NSString *idDocumentCorrection=[[self.arrViewCorrections objectAtIndex:[sender tag]] objectForKey:@"id"];
    NSLog(@"Doc Name : %@",docName);
    
    DisplayCorrectionViewController *displayDocView=[[DisplayCorrectionViewController alloc] initWithNibName:@"DisplayCorrectionViewController" bundle:nil];
    displayDocView.doc_name=docName;
    displayDocView.idDocomentCorrection=idDocumentCorrection;
    [self presentViewController:displayDocView animated:YES completion:nil];
}

#pragma mark - UIActionViewDelegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
     
    if([alertView tag]==101)
    {
       
        self.arrUploadedApp=[[NSMutableArray alloc] init];
        [self.arrUploadedApp removeAllObjects];
        [self loadUploadedApplication];
    }
    if(alertView.tag==11)
    {
        if(buttonIndex ==0)
        {
            [self jsonCallforLogoutDeveceId];
            
        }
        else
        {
            
        }
    }

}



#pragma mark - Service Methods

-(void) loadVideo
{
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
    self.arrVideo=[[NSMutableArray alloc] init];
    [self.arrVideo removeAllObjects];
    
    NSString *requestURL=[NSString stringWithFormat:@"https://www.contractorsischool.com/mobile-services/getVideo.php"];
    
    // NSString *strUserEmail=[[[NSUserDefaults standardUserDefaults] objectForKey:@"userData"] objectForKey:@"email"];
    
    // NSString *requestURL=[NSString stringWithFormat:@"https://www.contractorsischool.com/mobile-services/dispalyapplicationreview.php?email=%@",strUserEmail];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading...";
    
    //1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //code executed in the background
        //2
        
        // Create the request.
    //    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestURL]];
        
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestURL]cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];

        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSError *er;
        NSMutableDictionary *dict ;
        
        if (returnData) {
            
            dict = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&er];
            
        }
        //4
        dispatch_async(dispatch_get_main_queue(), ^{
            //code executed on the main queue
            //5
            [hud hide:YES];
            NSLog(@"returnData : %@",dict);
            if([[dict objectForKey:@"Result"] isEqualToString:@"True"])
            {
                self.arrVideo=[dict objectForKey:@"videoApplication"];
                
                NSLog(@"arrVideo Count: %lu",(unsigned long)[self.arrVideo count]);
                
                [self.tv_viewVideo reloadData];
            }
            else
            {
                
            }
        });
    });
}

-(void) loadViewCorrections
{
    //    [self.arrViewCorrections removeAllObjects];
    self.arrViewCorrections=[[NSMutableArray alloc] init];
    [self.arrViewCorrections removeAllObjects];
    
    NSString *strUserEmail=[[[NSUserDefaults standardUserDefaults] objectForKey:@"userData"] objectForKey:@"email"];
   
    NSString *requestURL=[NSString stringWithFormat:@"https://www.contractorsischool.com/mobile-services/dispalyapplicationreview.php?email=%@",strUserEmail];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading..";
    
    //1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //code executed in the background
        //2
        
        // Create the request.
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestURL]];
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSError *er;
        NSMutableDictionary *dict ;
        
        if (returnData) {
            
            dict = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&er];
            
        }
        //4
        dispatch_async(dispatch_get_main_queue(), ^{
            //code executed on the main queue
            //5
            [hud hide:YES];
            NSLog(@"returnData : %@",dict);
            if([[dict objectForKey:@"Result"] isEqualToString:@"True"])
            {
                self.arrViewCorrections=[dict objectForKey:@"Applicationreview"];
                
                NSLog(@"%lu",(unsigned long)[self.arrViewCorrections count]);
                
                [self.tv_viewCorrections reloadData];
            }
            else
            {
                
            }
        });
    });
}

-(void) loadUploadedApplication
{
    
    self.arrUploadedApp=[[NSMutableArray alloc] init];
    //[self.arrUploadedApp removeAllObjects];
    
    NSString *strUserEmail=[[[NSUserDefaults standardUserDefaults] objectForKey:@"userData"] objectForKey:@"email"];
   
    NSLog(@"USER EMAIL :%@",strUserEmail);
    
    NSString *requestURL=[NSString stringWithFormat:@"http://www.contractorsischool.com/mobile-services/dispalyapplicationupload.php?email=%@",strUserEmail];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading...";
    
    //1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //code executed in the background
        //2
        
        // Create the request.
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:requestURL]cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0];
        
        
       // SURLRequest *request = [NSURLRequest
      //                          requestWithURL:[NSURL URLWithString:urlString]
       //                         cachePolicy:NSURLRequestReloadIgnoringCacheData
      //                          timeoutInterval:5.0];
        
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil ];
       
        
        //NSData *conn = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        
        NSError *er=nil;
      
        NSMutableDictionary *dict=nil;

        if (returnData) {
            
            dict = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&er];
            
            //dict = [NSJSONSerialization JSONObjectWithData:returnData options:NSJSONReadingMutableContainers error:&er];
        
        }
        
                       
        //4
        dispatch_async(dispatch_get_main_queue(), ^{
            //code executed on the main queue
            //5
            [hud hide:YES];
            NSLog(@"returnData : %@",dict);
            if([[dict objectForKey:@"Result"] isEqualToString:@"True"])
            {
                self.arrUploadedApp=[dict objectForKey:@"Applicationreupload"];
                NSLog(@"arrUploadedApp COUNT %lu",(unsigned long)[self.arrUploadedApp count]);
                [self.tv_applicationUploaded reloadData];
            }
            else
            {
                
            }
            
        });
        
    });
}


#pragma mark - Upload image

- (IBAction)chooseFileForUpload:(id)sender {
    
    NSString *actionSheetTitle = @"Select sourse"; //Action Sheet Title
    NSString *other1 = @"Camera";
    NSString *other2 = @"Gallery";
    NSString *cancelTitle = @"Cancel";
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:actionSheetTitle
                                  delegate:self
                                  cancelButtonTitle:cancelTitle
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:other1, other2,  nil];
    
    [actionSheet showInView:self.view];
}

- (IBAction)uploadSelectedFile:(id)sender
{
    if(!selectedImage)
    {
        UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"Warning!"
                                                               message:@"Select any picture."
                                                              delegate:self
                                                     cancelButtonTitle:@"Ok"
                                                     otherButtonTitles:nil,nil];
        [alertMessage show];
    }
    else
    {
        [self.indicatorUploadImage startAnimating];
        UIImage *PortraitImage = [[UIImage alloc] initWithCGImage: selectedImage.CGImage
                                                             scale: 1.0
                                                       orientation: UIImageOrientationLeft];
        
        NSString *strUserEmail=[[[NSUserDefaults standardUserDefaults] objectForKey:@"userData"] objectForKey:@"email"];
        
        NSLog(@"%lu",(unsigned long)[strUserEmail length]);
        
        NSData *imageData=UIImageJPEGRepresentation(selectedImage, 0.5);
        
        NSLog(@"URL for registration : %@",UPLOAD_APPLICATION);
        
        // setting up the request object now
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:UPLOAD_APPLICATION]];
        [request setHTTPMethod:@"POST"];
        
        NSMutableData *body = [NSMutableData data];
        
        NSString *boundary = @"---------------------------14737809831466499882746641449";
        NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",boundary];
        [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
        
        
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", @"email"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"%@", strUserEmail] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"profile_pic\"; filename=\"abc.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        
        //COMMENTED OUT KO ORIG NAKA COMMENTTED OUT
        //[body appendData:[@"Content-Type: image/jpg \r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        
        [body appendData:[NSData dataWithData:imageData]];
        
        [body appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",boundary] dataUsingEncoding:NSUTF8StringEncoding]];
        
        [request setHTTPBody:body];
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        hud.labelText = @"Updating...";
    
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
            
            NSError *er;
            
            NSMutableDictionary *dict ;
            
            if (returnData) {
                
                NSLog(@"Data >>>> : %@",[NSString stringWithUTF8String:[returnData bytes]]);
                dict = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&er];
            }
            else{
                
            }
            //4
            dispatch_async(dispatch_get_main_queue(), ^{
                //code executed on the main queue
                //5
                [hud hide:YES];
                NSLog(@"Answer >>>> : %@",dict);
                if([[dict objectForKey:@"Result"] isEqualToString:@"true"])
                {
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                        
                        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[dict objectForKey:@"ImageName"]]];
                        UIImage *imgQue=[UIImage imageWithData:data];
                        
                        dispatch_async(dispatch_get_main_queue(), ^{
                            [self.indicatorUploadImage stopAnimating];
                            [self.imgviewApp setImage:imgQue];
                        });
                    });

                   
                    [self showSuccess];
                   
                }
            });
            
        });
    }
   
    [self.imgviewApp setImage:nil];
    selectedImage=nil;
}

-(void) showSuccess
{
    UIAlertView *alertMessage = [[UIAlertView alloc] initWithTitle:@"Message"
                                                           message:@"Image has been successfully uploaded"
                                                          delegate:self
                                                 cancelButtonTitle:@"Ok"
                                                 otherButtonTitles:nil,nil];
    [alertMessage setDelegate:self];
    [alertMessage setTag:101];
    [alertMessage show];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0)
    {
        NSLog(@"Camera");
        [self takePhoto];
    }
    else if(buttonIndex==1)
    {
        NSLog(@"Gallery");
        [self libraryPicture];
    }
    else if(buttonIndex==2)
    {
        NSLog(@"Cancel");
    }
}

-(IBAction)libraryPicture
{
    if (self.presentedViewController) {
        [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    }

    if([UIImagePickerController isSourceTypeAvailable:
        UIImagePickerControllerSourceTypePhotoLibrary])
    {
        UIImagePickerController *picker= [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.mediaTypes=[[NSArray alloc] initWithObjects:(NSString *) kUTTypeImage, nil];
        [self presentViewController:picker animated:YES completion:nil];
        //        [picker release];
    }
}

- (IBAction)takePhoto
{
    
    if (self.presentedViewController) {
        [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
    }
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera."
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    else
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:picker animated:YES completion:NULL];
        
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker
      didFinishPickingImage : (UIImage *)image
                 editingInfo:(NSDictionary *)editingInfo
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [picker dismissModalViewControllerAnimated:YES];
   if(image.size.height >2000 || image.size.width>2000)
   {
       CGSize destinationSize = CGSizeMake(1700,2000);
       UIGraphicsBeginImageContext(destinationSize);
       [image drawInRect:CGRectMake(0,0,destinationSize.width,destinationSize.height)];
       UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
       UIGraphicsEndImageContext();
       
       selectedImage=newImage;
   }
   else
   {
    selectedImage=image;
   }
    
    [self.imgviewApp setImage:selectedImage];
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *) picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}

#pragma mark - Crop Image

- (IBAction)openEditor:(id)sender
{
    PECropViewController *controller = [[PECropViewController alloc] init];
    controller.delegate = self;
    controller.image = selectedImage;
    
    UIImage *image = selectedImage;
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    CGFloat length = MIN(width, height);
    controller.imageCropRect = CGRectMake((width - length) / 2,
                                          (height - length) / 2,
                                          length,
                                          length);
    
    UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        navigationController.modalPresentationStyle = UIModalPresentationFormSheet;
    }
    
    [self presentViewController:navigationController animated:YES completion:NULL];
}

#pragma mark - PECropViewControllerDelegate methods

- (void)cropViewController:(PECropViewController *)controller didFinishCroppingImage:(UIImage *)croppedImage transform:(CGAffineTransform)transform cropRect:(CGRect)cropRect
{
    [controller dismissViewControllerAnimated:YES completion:NULL];
    selectedImage = croppedImage;
    [self.imgviewApp setImage:selectedImage];
    //    [self.btnChooseFile setTitle:@"File is selected" forState:UIControlStateNormal];
    NSLog(@"Cropped Image Size : %lu",(unsigned long)[UIImageJPEGRepresentation(selectedImage, 1.0) length]);
}

- (void)cropViewControllerDidCancel:(PECropViewController *)controller
{
    [controller dismissViewControllerAnimated:YES completion:NULL];
    [self.imgviewApp setImage:selectedImage];
    //    [self.btnChooseFile setTitle:@"File is selected" forState:UIControlStateNormal];
}

- (IBAction)downloadForm1:(id)sender {
 
    [self downloadAndStoreForms:@"ApplicationForOriginalContractorsLicense.pdf"];
    NSMutableAttributedString *yourString = [[NSMutableAttributedString alloc] initWithString:@"ApplicationForOriginalContractorsLicense.pdf"];
    [yourString addAttribute:NSUnderlineStyleAttributeName
                       value:[NSNumber numberWithInt:1]
                       range:(NSRange){0,25}];
    
    self.lblSubForm1.attributedText = [yourString copy];
}
- (IBAction)downloadForm2:(id)sender {
    [self downloadAndStoreForms:@"DisclosureStatementRegardingCriminalPleaConviction.pdf"];
    
    NSMutableAttributedString *commentString = [[NSMutableAttributedString alloc] initWithString:@"DisclosureStatementRegardingCriminalPleaConviction.pdf"];
    
    [commentString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, [commentString length])];
    
    // Or for adding Colored text use----------
    UIColor* textColor = [UIColor blueColor];
    [commentString setAttributes:@{NSForegroundColorAttributeName:textColor,NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]} range:NSMakeRange(0,[commentString length])];
    
    
  
}
- (IBAction)downloadForm3:(id)sender {
    [self downloadAndStoreForms:@"CertificationOfWorkExperience.pdf"];
    }
- (IBAction)downloadForm4:(id)sender {
    [self downloadAndStoreForms:@"ApplicationForOriginalContractorsLicenseLLC.pdf"];
}
- (IBAction)downloadForm5:(id)sender {
    [self downloadAndStoreForms:@"ApplicationForAdditionalClassification.pdf"];
}
- (IBAction)downloadForm6:(id)sender {
    [self downloadAndStoreForms:@"ApplicationForReplacingTheQualifyingIndividual.pdf"];
}
- (IBAction)downloadForm7:(id)sender {
    [self downloadAndStoreForms:@"ApplicationForAsbestosCertification.pdf"];
}
- (IBAction)downloadForm8:(id)sender {
    [self downloadAndStoreForms:@"ApplicationForHazardousSubstanceRemovalCertification.pdf"];
}

-(void) downloadAndStoreForms : (NSString *) formName
{
    NSString *fullURL=[NSString stringWithFormat:@"http://www.cslb.ca.gov/Resources/FormsAndApplications/%@",formName];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:fullURL]];
}


- (IBAction)LogOut:(id)sender {
    UIAlertView *message1 = [[UIAlertView alloc] initWithTitle:@""
                                                       message:@"Are you sure you want to log out?"
                                                      delegate:self
                                             cancelButtonTitle:@"Yes"
                                             otherButtonTitles:@"No",nil];
    message1.tag=11;
    [message1 show];
}

- (void)resetDefaults {
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        if(![key isEqualToString:@"deviceToken"])
        {
            [defs removeObjectForKey:key];
        }
    }
    [defs synchronize];
    
}
-(void)jsonCallforLogoutDeveceId
{
    NSString *email=[[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
    NSString *deviceId=@"0";
    NSString *deviceOs=@"0";
    NSArray *keys=[NSArray arrayWithObjects:@"email",@"device_id",@"device_os",nil];
    
    NSArray *values=[NSArray arrayWithObjects:email,deviceId,deviceOs, nil];
    
    NSDictionary *jsonDict=[NSDictionary dictionaryWithObjects:values forKeys:keys];
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict
                                                       options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                         error:&error];
    NSString *jsonRequest=@"";
    
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonRequest = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSLog(@"%@",jsonRequest);
    
    //1
    
    //code executed in the background
    //2
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Loading...";
    
    //1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        // Create the request.
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:REGISTER_DEVICE_TOKEN]];
        
        // Convert your data and set your request's HTTPBody property
        NSData *requestData = [jsonRequest dataUsingEncoding:NSUTF8StringEncoding];
        
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody: requestData];
        
        
        NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
        NSError *er;
        
        NSMutableDictionary *dict ;
        
        if (returnData) {
            
            dict = [NSJSONSerialization JSONObjectWithData:returnData options:kNilOptions error:&er];
            
        }
        else{
            UIAlertView *alertError=[[UIAlertView alloc] initWithTitle:@"Warning" message:@"Data was not found." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alertError show];
            
        }
        
        //4
        
        dispatch_async(dispatch_get_main_queue(), ^{
            //code executed on the main queue
            //5
            
            [hud hide:YES];
            
            NSLog(@"returnData : %@",dict);
            
            if([[dict objectForKey:@"Result"] isEqualToString:@"True"])
            {
                @try {
                    [self resetDefaults];
                    LoginViewController *login1=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
                    [self.navigationController pushViewController:login1 animated:YES];
                    
                }
                @catch (NSException *exception) {
                    NSLog(@"%@",exception.name);
                    UIAlertView *alertError=[[UIAlertView alloc] initWithTitle:@"Error..!!" message:exception.name delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                    [alertError show];
                }
                
                
            }
            else
            {
                
            }
        });
    });
}

#pragma mark Video Subview


- (IBAction)btnVideo1:(id)sender {
  
    OpenVideoViewController *openVideo=[[OpenVideoViewController alloc]initWithNibName:@"OpenVideoViewController" bundle:nil];
        openVideo.VideoURL=[NSString stringWithFormat:@"https://www.contractorsischool.com/videos/ipad/application-video-1iPad.mp4"];
   
    [self presentViewController:openVideo animated:YES completion:nil];
   //[self.navigationController pushViewController:openVideo animated:YES];
    
}

- (IBAction)btnVideo2:(id)sender {
    OpenVideoViewController *openVideo=[[OpenVideoViewController alloc]initWithNibName:@"OpenVideoViewController" bundle:nil];
       openVideo.VideoURL=[NSString stringWithFormat:@"https://www.contractorsischool.com/videos/ipad/application-video-2iPad.mp4"];
    [self presentViewController:openVideo animated:YES completion:nil];
    //[self.navigationController pushViewController:openVideo animated:YES];
    
}


- (IBAction)btnVideo3:(id)sender {
    
    OpenVideoViewController *openVideo=[[OpenVideoViewController alloc]initWithNibName:@"OpenVideoViewController" bundle:nil];
    openVideo.VideoURL=[NSString stringWithFormat:@"https://www.contractorsischool.com/videos/ipad/application-video-3iPad.mp4"];
   [self presentViewController:openVideo animated:YES completion:nil];
    //[self.navigationController pushViewController:openVideo animated:YES];
   
}

- (void)playVideoWithId:(NSString *)videoId {
    
    NSString *youTubeVideoHTML = @"<html><head><style>body{margin:0px 0px 0px 0px;}</style></head> <body> <div id=\"player\"></div> <script> var tag = document.createElement('script'); tag.src = 'http://www.youtube.com/player_api'; var firstScriptTag = document.getElementsByTagName('script')[0]; firstScriptTag.parentNode.insertBefore(tag, firstScriptTag); var player; function onYouTubePlayerAPIReady() { player = new YT.Player('player', { width:'768', height:'1024', videoId:'%@', events: { 'onReady': onPlayerReady } }); } function onPlayerReady(event) { event.target.playVideo(); } </script> </body> </html>";
    
    NSString *html = [NSString stringWithFormat:youTubeVideoHTML, videoId];
    
    UIWebView *videoView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 300)];
    videoView.backgroundColor = [UIColor clearColor];
    videoView.opaque = NO;
    //videoView.delegate = self;
    [self.view addSubview:videoView];
    
    videoView.mediaPlaybackRequiresUserAction = NO;
    
    [videoView loadHTMLString:html baseURL:[[NSBundle mainBundle] resourceURL]];
}

@end