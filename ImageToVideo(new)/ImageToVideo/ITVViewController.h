//
//  ITVViewController.h
//  ImageToVideo
//
//  Created by Aatish Molasi on 12/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "ImageToVideo.h"

@interface ITVViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, ImageToVideoDelegate>
{
    UIView *mDisplayView;
    UITableView *mLeftSelectionView;
    NSMutableArray *mImageArray;
}

@property (nonatomic, retain) NSMutableArray *imageArray;

@property (nonatomic, retain) IBOutlet UIView *displayView;
@property (nonatomic, retain) IBOutlet UITableView *leftSelectionView;

- (IBAction)pickImages:(id)sender;
- (IBAction)generateVideo:(id)sender;

@end
