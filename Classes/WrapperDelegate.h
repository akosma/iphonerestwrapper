//
//  WrapperDelegate.h
//  WrapperTest
//
//  Created by Adrian on 10/18/08.
//  Copyright 2008 Adrian Kosmaczewski. All rights reserved.
//

#import <Foundation/Foundation.h> 

@class Wrapper;

@protocol WrapperDelegate <NSObject>

@required
- (void)wrapper:(Wrapper *)wrapper didRetrieveData:(NSData *)data;

@optional
- (void)wrapperHasBadCredentials:(Wrapper *)wrapper;
- (void)wrapper:(Wrapper *)wrapper didCreateResourceAtURL:(NSString *)url;
- (void)wrapper:(Wrapper *)wrapper didFailWithError:(NSError *)error;
- (void)wrapper:(Wrapper *)wrapper didReceiveStatusCode:(int)statusCode;

@end
