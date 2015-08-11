//
//  AFAppDotNetAPIClient.h
//  GTNetwork
//
//  Created by 赵国腾 on 15/8/11.
//  Copyright (c) 2015年 zhaoguoteng. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface AFAppDotNetAPIClient : AFHTTPSessionManager

+ (instancetype)sharedClient;

@end
