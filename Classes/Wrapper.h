//
//  Wrapper.h
//  WrapperTest
//
//  Created by Adrian on 10/18/08.
//  Copyright 2008 Adrian Kosmaczewski. All rights reserved.
//

#import <Foundation/Foundation.h> 
#import "WrapperDelegate.h"

@interface Wrapper : NSObject 
{
@private
    NSMutableData *receivedData;
    NSString *mimeType;
    NSURLConnection *conn;
    BOOL asynchronous;
    NSObject<WrapperDelegate> *delegate;
    NSString *username;
    NSString *password;
}

@property (nonatomic, readonly) NSData *receivedData;
@property (nonatomic) BOOL asynchronous;
@property (nonatomic, copy) NSString *mimeType;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, assign) NSObject<WrapperDelegate> *delegate; // Do not retain delegates!

- (void)sendRequestTo:(NSURL *)url usingVerb:(NSString *)verb withParameters:(NSDictionary *)parameters;
- (void)uploadData:(NSData *)data toURL:(NSURL *)url;
- (void)cancelConnection;
- (NSDictionary *)responseAsPropertyList;
- (NSString *)responseAsText;

@end

