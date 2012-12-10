//
//  ImageToVideo.h
//  ImageToVideo
//
//  Created by Aatish Molasi on 12/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <AVFoundation/AVComposition.h>
#import <AVFoundation/AVCompositionTrack.h>
#import <CoreMedia/CoreMedia.h>
#import <CoreVideo/CoreVideo.h>
#import <AVFoundation/AVFoundation.h>

#import "UIImage+ImageFromView.h"

//Video settings
#define kVideoWidth 640
#define kVideoHeight 480

typedef enum
{
    low =0,
    medium,
    high,
    custom
}eTransitionSmoothness;

typedef enum
{
    scaleAspectFit,
    scaleToFill,
    scaleAspectFill
}eContentMode;

typedef enum
{
    eNone=0,
    eShrink,
    eDissolve,
    eWipe,
    eCrush,
}eTransitionEffect;

@protocol ImageToVideoDelegate <NSObject>

- (void)didProgressVideoGenereation:(float)progress;
- (void)didFinishPreparingVideoWithUrl:(NSString *)url;

@end

@interface ImageToVideo : NSObject
{
    float mFadeInTime;
    float mFadeOutTime;
    float mTimePerImage;
    float mAnimationDuration;
    
    BOOL mIsAudio;
    BOOL mRepeat;
    
    int mCustomTransitionSmoothness;
    
    eTransitionEffect mTransitionEffect;
    eTransitionSmoothness mTransitionSmoothness;
    eContentMode mContentmode;
    CVPixelBufferRef mBuffer;
    
    BOOL mCancel;
    
    id <ImageToVideoDelegate>mDelegate;
    
    NSURL *mAudioUrl;
    NSMutableString *mVideoUrl;
    AVAssetExportSession *mExportSession;
    UIColor *mBackgroundColor;
}

@property (nonatomic) float fadeInTime;
@property (nonatomic) float fadeOutTime;
@property (nonatomic) float timePerImage;
@property (nonatomic) float animationDuration;

@property (nonatomic) BOOL isAudio;
@property (nonatomic) BOOL repeat;

@property (nonatomic) int customTransitionSmoothness;

@property (nonatomic) eTransitionEffect transitionEffect;
@property (nonatomic) eTransitionSmoothness transitionSmoothness;
@property (nonatomic) eContentMode contentmode;
@property (nonatomic) CVPixelBufferRef buffer;

@property (nonatomic) BOOL cancel;
@property (nonatomic, assign) id <ImageToVideoDelegate>delegate;

@property (nonatomic, retain) NSURL *audioUrl;
@property (nonatomic, retain) NSMutableString *videoUrl;
@property (nonatomic, retain) AVAssetExportSession *exportSession;
@property (nonatomic, retain) UIColor *backgroundColor;

- (void)prepareVideo:(NSString *)name withImages:(NSMutableArray *)images andAudio:(NSURL *)audio;
- (void)cancelVideoGeneration;

@end
