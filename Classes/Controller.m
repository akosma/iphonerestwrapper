//
//  Controller.m
//  iPhoneWrapperTest
//
//  Created by Adrian on 11/18/08.
//  Copyright netinfluence 2008. All rights reserved.
//

#import "Controller.h"
#import "Wrapper.h"
#import "VerbPicker.h"

@implementation Controller

- (void)dealloc 
{
    [engine release];
    engine = nil;
    [picker release];
    picker = nil;
    [super dealloc];
}

- (void)pickerDone
{
    [picker.view removeFromSuperview];
    [popUpButton setTitle:picker.chosenVerb forState:UIControlStateNormal];
    [popUpButton setTitle:picker.chosenVerb forState:UIControlStateHighlighted];
}

#pragma mark -
#pragma mark WrapperDelegate methods

- (void)wrapper:(Wrapper *)wrapper didRetrieveData:(NSData *)data
{
    NSString *text = [engine responseAsText];
    if (text != nil)
    {
        output.text = text;
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
    [address resignFirstResponder];
    [parameter resignFirstResponder];

    NSURL *url = [NSURL URLWithString:address.text];
    NSDictionary *parameters = nil;
    if ([parameter.text length] > 0)
    {
        NSArray *keys = [NSArray arrayWithObjects:@"parameter", nil];
        NSArray *values = [NSArray arrayWithObjects:parameter.text, nil];
        parameters = [NSDictionary dictionaryWithObjects:values forKeys:keys];
    }
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    output.text = @"";
    
    if (engine == nil)
    {
        engine = [[Wrapper alloc] init];
        engine.delegate = self;
    }
    [engine sendRequestTo:url usingVerb:[popUpButton titleForState:UIControlStateNormal] withParameters:parameters];    
}

- (IBAction)chooseMethod:(id)sender
{
    [address resignFirstResponder];
    [parameter resignFirstResponder];
    
    if (picker == nil)
    {
        picker = [[VerbPicker alloc] init];
        picker.parent = self;
    }
    [self.view addSubview:picker.view];
}

@end
