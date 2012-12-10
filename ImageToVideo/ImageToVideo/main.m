//
//  main.m
//  ImageToVideo
//
//  Created by Aatish Molasi on 12/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ITVAppDelegate.h"

int main(int argc, char *argv[])
{
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([ITVAppDelegate class]));
    [pool release];
    return retVal;
//    @autoreleasepool {
//        return UIApplicationMain(argc, argv, nil, NSStringFromClass([ITVAppDelegate class]));
//    }
}
