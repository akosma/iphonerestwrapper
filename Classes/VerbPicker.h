//
//  VerbPicker.h
//  iPhoneWrapperTest
//
//  Created by Adrian on 11/18/08.
//  Copyright 2008 netinfluence. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Controller;

@interface VerbPicker : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    IBOutlet UIPickerView *picker;
    
    Controller *parent;
    NSArray *verbs;
    NSString *chosenVerb;
}

@property (nonatomic, copy) NSString *chosenVerb;
@property (nonatomic, assign) Controller *parent;

- (IBAction)verbChosen:(id)sender;

@end
