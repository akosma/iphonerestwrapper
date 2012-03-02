//
//  Controller.m
//  iPhoneWrapperTest
//
//  Created by Adrian on 11/18/08.
//  Copyright akosma software 2008. All rights reserved.
//

#import "Controller.h"
#import "Wrapper.h"
#import "VerbPicker.h"

@implementation Controller

@synthesize address = _address;
@synthesize parameter = _parameter;
@synthesize output = _output;
@synthesize popUpButton = _popUpButton;
@synthesize engine = _engine;
@synthesize picker = _picker;

- (void)dealloc 
{
    [_engine release];
    [_picker release];
    [super dealloc];
}

- (void)pickerDone
{
    [self.picker.view removeFromSuperview];
    [self.popUpButton setTitle:self.picker.chosenVerb forState:UIControlStateNormal];
    [self.popUpButton setTitle:self.picker.chosenVerb forState:UIControlStateHighlighted];
}

#pragma mark -
#pragma mark WrapperDelegate methods

- (void)wrapper:(Wrapper *)wrapper didRetrieveData:(NSData *)data
{
    NSString *text = [self.engine responseAsText];
    if (text != nil)
    {
        self.output.text = text;
    }
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)wrapperHasBadCredentials:(Wrapper *)wrapper
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bad credentials!" 
                                                    message:@"Bad credentials!"  
                                                   delegate:self 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)wrapper:(Wrapper *)wrapper didCreateResourceAtURL:(NSString *)url
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Resource created!" 
                                                    message:[NSString stringWithFormat:@"Resource created at %@!", url]  
                                                   delegate:self 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)wrapper:(Wrapper *)wrapper didFailWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!" 
                                                    message:[NSString stringWithFormat:@"Error code: %d!", [error code]]  
                                                   delegate:self 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

- (void)wrapper:(Wrapper *)wrapper didReceiveStatusCode:(int)statusCode
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Status code not OK!" 
                                                    message:[NSString stringWithFormat:@"Status code not OK: %d!", statusCode]
                                                   delegate:self 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
    [alert show];
    [alert release];
}

#pragma mark -
#pragma mark UITextFieldDelegate methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -
#pragma mark IBAction methods

- (IBAction)launch:(id)sender
{
    [self.address resignFirstResponder];
    [self.parameter resignFirstResponder];

    NSURL *url = [NSURL URLWithString:self.address.text];
    NSDictionary *parameters = nil;
    if ([self.parameter.text length] > 0)
    {
        NSArray *keys = [NSArray arrayWithObjects:@"parameter", nil];
        NSArray *values = [NSArray arrayWithObjects:self.parameter.text, nil];
        parameters = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    }
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    self.output.text = @"";
    
    if (self.engine == nil)
    {
        self.engine = [[[Wrapper alloc] init] autorelease];
        self.engine.delegate = self;
    }
    [self.engine sendRequestTo:url 
                     usingVerb:[self.popUpButton titleForState:UIControlStateNormal] 
                withParameters:parameters];    
}

- (IBAction)chooseMethod:(id)sender
{
    [self.address resignFirstResponder];
    [self.parameter resignFirstResponder];
    
    if (self.picker == nil)
    {
        self.picker = [[[VerbPicker alloc] init] autorelease];
        self.picker.parent = self;
    }
    [self.view addSubview:self.picker.view];
}

@end
