//
//  AppDelegate.m
//  iPhoneWrapperTest
//
//  Created by Adrian on 11/18/08.
//  Copyright netinfluence 2008. All rights reserved.
//

#import "AppDelegate.h"
#import "Controller.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

- (void)dealloc 
{
    [viewController release];
    [window release];
    [super dealloc];
}

@end
