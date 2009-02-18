//
//  AppDelegate.h
//  iPhoneWrapperTest
//
//  Created by Adrian on 11/18/08.
//  Copyright netinfluence 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Controller;

@interface AppDelegate : NSObject <UIApplicationDelegate> 
{
    IBOutlet UIWindow *window;
    IBOutlet Controller *viewController;
}

@end
