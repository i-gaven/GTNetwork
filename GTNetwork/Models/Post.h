//
//  Post.h
//  GTNetwork
//
//  Created by 赵国腾 on 15/8/11.
//  Copyright (c) 2015年 zhaoguoteng. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;
@interface Post : NSObject

@property (nonatomic, assign) NSInteger postID;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) User *user;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block;

@end
