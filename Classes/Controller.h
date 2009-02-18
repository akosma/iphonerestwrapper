//
//  Controller.h
//  iPhoneWrapperTest
//
//  Created by Adrian on 11/18/08.
//  Copyright netinfluence 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WrapperDelegate.h"

@class Wrapper;
@class VerbPicker;

@interface Controller : UIViewController <WrapperDelegate, UITextFieldDelegate>
{
    IBOutlet UITextField *address;
    IBOutlet UITextField *parameter;
    IBOutlet UITextView *output;
    IBOutlet UIButton *popUpButton;
    
    Wrapper *engine;
    VerbPicker *picker;
}

- (IBAction)launch:(id)sender;
- (IBAction)chooseMethod:(id)sender;
- (void)pickerDone;

@end

