//
//  VerbPicker.m
//  iPhoneWrapperTest
//
//  Created by Adrian on 11/18/08.
//  Copyright 2008 akosma software. All rights reserved.
//

#import "VerbPicker.h"
#import "Controller.h"

@implementation VerbPicker

@synthesize parent = _parent;
@synthesize chosenVerb = _chosenVerb;
@synthesize picker = _picker;
@synthesize verbs = _verbs;

- (id)init
{
    if (self = [super initWithNibName:@"VerbPicker" bundle:nil])
    {
        self.verbs = [NSArray arrayWithObjects:@"GET", @"POST", @"PUT", @"DELETE", nil];
        self.chosenVerb = @"GET";
    }
    return self;
}

- (void)dealloc
{
    [_chosenVerb release];
    [_verbs release];
    [_picker release];
    [super dealloc];
}

- (IBAction)verbChosen:(id)sender
{
    [self.parent pickerDone];
}

#pragma mark -
#pragma mark UIPickerViewDelegate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.verbs objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.chosenVerb = [self.verbs objectAtIndex:row];
}

#pragma mark -
#pragma mark UIPickerViewDataSource methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 4;
}

@end
