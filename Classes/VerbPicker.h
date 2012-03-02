//
//  VerbPicker.h
//  iPhoneWrapperTest
//
//  Created by Adrian on 11/18/08.
//  Copyright 2008 akosma software. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Controller;

@interface VerbPicker : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) IBOutlet UIPickerView *picker;
@property (nonatomic, strong) NSArray *verbs;
@property (nonatomic, copy) NSString *chosenVerb;
@property (nonatomic, assign) Controller *parent;

- (IBAction)verbChosen:(id)sender;

@end
