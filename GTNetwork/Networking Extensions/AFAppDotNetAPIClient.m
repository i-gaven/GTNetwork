//
//  AFAppDotNetAPIClient.m
//  GTNetwork
//
//  Created by 赵国腾 on 15/8/11.
//  Copyright (c) 2015年 zhaoguoteng. All rights reserved.
//

#import "AFAppDotNetAPIClient.h"

static NSString *const AFAppDotNetAPIBaseURLString = @"https://api.app.net/";

@implementation AFAppDotNetAPIClient

+ (instancetype)sharedClient {
    
    static AFAppDotNetAPIClient *_sharedClient = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[AFAppDotNetAPIClient alloc]initWithBaseURL:[NSURL URLWithString:AFAppDotNetAPIBaseURLString]];
        _sharedClient.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    
    return _sharedClient;
}

@end
