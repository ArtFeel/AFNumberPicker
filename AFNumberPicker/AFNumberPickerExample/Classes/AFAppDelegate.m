//
//  AFAppDelegate.m
//  AFNumberPicker
//
//  Created by Philip Vasilchenko on 03.05.13.
//  Copyright (c) 2013 CoreInvader. All rights reserved.
//

#import "AFAppDelegate.h"
#import "AFNumberPickerExampleViewController.h"


@implementation AFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    [self.window setRootViewController:[AFNumberPickerExampleViewController new]];
    [self.window makeKeyAndVisible];

    return YES;
}

@end
