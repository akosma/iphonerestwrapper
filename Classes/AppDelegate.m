//
//  AppDelegate.m
//  iPhoneWrapperTest
//
//  Created by Adrian on 11/18/08.
//  Copyright akosma software 2008. All rights reserved.
//

#import "AppDelegate.h"
#import "Controller.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (void)applicationDidFinishLaunching:(UIApplication *)application 
{
    // Override point for customization after app launch    
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
}

- (void)dealloc 
{
    [_viewController release];
    [_window release];
    [super dealloc];
}

@end
