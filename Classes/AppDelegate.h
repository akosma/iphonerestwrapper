//
//  AppDelegate.h
//  iPhoneWrapperTest
//
//  Created by Adrian on 11/18/08.
//  Copyright akosma software 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Controller;

@interface AppDelegate : NSObject <UIApplicationDelegate> 

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet Controller *viewController;

@end
