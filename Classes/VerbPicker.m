//
//  VerbPicker.m
//  iPhoneWrapperTest
//
//  Created by Adrian on 11/18/08.
//  Copyright 2008 netinfluence. All rights reserved.
//

#import "VerbPicker.h"
#import "Controller.h"

@implementation VerbPicker

@synthesize parent;
@synthesize chosenVerb;

- (id)init
{
    if (self = [super initWithNibName:@"VerbPicker" bundle:nil])
    {
        verbs = [[NSArray alloc] initWithObjects:@"GET", @"POST", @"PUT", @"DELETE", nil];
        chosenVerb = @"GET";
    }
    return self;
}

- (void)dealloc
{
    self.chosenVerb = nil;
    [verbs release];
    verbs = nil;
    [super dealloc];
}

- (IBAction)verbChosen:(id)sender
{
    [parent pickerDone];
}

#pragma mark -
#pragma mark UIPickerViewDelegate methods

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [verbs objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    chosenVerb = [verbs objectAtIndex:row];
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
