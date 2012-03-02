//
//  Controller.h
//  iPhoneWrapperTest
//
//  Created by Adrian on 11/18/08.
//  Copyright akosma software 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WrapperDelegate.h"

@class Wrapper;
@class VerbPicker;

@interface Controller : UIViewController <WrapperDelegate, UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextField *address;
@property (nonatomic, strong) IBOutlet UITextField *parameter;
@property (nonatomic, strong) IBOutlet UITextView *output;
@property (nonatomic, strong) IBOutlet UIButton *popUpButton;

@property (nonatomic, strong) Wrapper *engine;
@property (nonatomic, strong) VerbPicker *picker;

- (IBAction)launch:(id)sender;
- (IBAction)chooseMethod:(id)sender;
- (void)pickerDone;

@end

