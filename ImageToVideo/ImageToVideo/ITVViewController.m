//
//  ITVViewController.m
//  ImageToVideo
//
//  Created by Aatish Molasi on 12/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ITVViewController.h"

#import <MediaPlayer/MediaPlayer.h>

@interface ITVViewController ()

@end

@implementation ITVViewController

@synthesize imageArray = mImageArray;

@synthesize displayView = mDisplayView;
@synthesize leftSelectionView = mLeftSelectionView;

- (void) dealloc
{
    [mDisplayView release];
    [mImageArray release];
    
    [super dealloc];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.leftSelectionView.delegate = self;
    self.leftSelectionView.dataSource = self;
    
    self.displayView.layer.borderWidth = 1;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        NSMutableArray *tempImageArray = [[NSMutableArray alloc] init];
        self.imageArray = tempImageArray;
        [tempImageArray release];
    }
    return self;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark - Action Methods

- (IBAction)pickImages:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = self;
    UIPopoverController *popoverController=[[UIPopoverController alloc] initWithContentViewController:imagePicker];
    //popoverController.delegate=self;
    [popoverController presentPopoverFromRect:((UIButton *)sender).bounds inView:sender permittedArrowDirections:UIPopoverArrowDirectionDown animated:YES];
    [imagePicker release];
}

- (IBAction)generateVideo:(id)sender
{
    NSLog(@"This is where im suppse to be generating the video");
    ImageToVideo *videoGenerator = [[ImageToVideo alloc] init];
    videoGenerator.delegate = self;
    if (self.imageArray.count < 2)
    {
        UIAlertView *notEnoughImagesAlert = [[UIAlertView alloc] initWithTitle:@"Not Enough Images" message:@"Please add more images to generate a video" delegate:self cancelButtonTitle:@"okay ..okay ..!" otherButtonTitles:nil, nil];
        [notEnoughImagesAlert show];
    }
    else
    {
        [videoGenerator prepareVideo:@"Video01.mov" withImages:self.imageArray andAudio:nil];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [self dismissModalViewControllerAnimated:YES];
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.displayView.frame.size.width, self.displayView.frame.size.height)];
    tempImageView.contentMode = UIViewContentModeScaleAspectFit;
    tempImageView.image = image;
    //[self.displayView addSubview:tempImageView];
    [self.imageArray addObject:image];
    [self.leftSelectionView reloadData];
    //do stuff with image
}

#pragma mark - Table View

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 200;
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.imageArray.count;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        //UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width,150)];
        //imageView.contentMode = UIViewContentModeScaleAspectFit;
        //[cell.contentView addSubview:imageView];
        //imageView.tag = 1111;
    }
    
    //[(UIImageView *)[cell viewWithTag:1111] setImage:[self.imageArray objectAtIndex:indexPath.row]];
    cell.imageView.image = [self.imageArray objectAtIndex:indexPath.row];
    
    //cell.textLabel.text = @"This is some text";
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Selecting row at index path");
}

#pragma mark - ImageToVideo Delegate methods

- (void)didProgressVideoGenereation:(float)progress
{
    NSLog(@"This is the progress %f",progress);
}

- (void)didFinishPreparingVideoWithUrl:(NSString *)url
{
    NSLog(@"The video is ready now at %@",url);
    NSURL *videoUrl = [[NSURL alloc] initFileURLWithPath:url isDirectory:NO];
    MPMoviePlayerViewController *theMovie = [[MPMoviePlayerViewController alloc] initWithContentURL:videoUrl]; 
    [self presentMoviePlayerViewControllerAnimated:theMovie];
    theMovie.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    [theMovie.moviePlayer play];
}

@end
