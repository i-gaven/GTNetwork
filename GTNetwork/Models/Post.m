
//
//  Post.m
//  GTNetwork
//
//  Created by 赵国腾 on 15/8/11.
//  Copyright (c) 2015年 zhaoguoteng. All rights reserved.
//

#import "Post.h"
#import "User.h"
#import "AFAppDotNetAPIClient.h"
#import "AFNetworking.h"

@interface Post ()

@end

@implementation Post

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    
    if (self = [super init]) {
        
        self.postID = (NSUInteger)[[attributes valueForKeyPath:@"id"] integerValue];
        self.text = [attributes valueForKeyPath:@"text"];
        self.user = [[User alloc]initWithAttributes:[attributes valueForKeyPath:@"user"]];
    }
    
    return self;
}

+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block {
    
    return [[AFAppDotNetAPIClient sharedClient] GET:@"stream/0/posts/stream/global"
                                         parameters:nil
                                            success:^(NSURLSessionDataTask * task, id json) {
                                                
                                                NSArray *postsFromResponse = json[@"data"];
                                                
                                                NSMutableArray *mutablePosts = [NSMutableArray arrayWithCapacity:postsFromResponse.count];
                                                
                                                for (NSDictionary *dic in postsFromResponse) {
                                                    
                                                    Post *post = [[Post alloc]initWithAttributes:dic];
                                                    [mutablePosts addObject:post];
                                                }
                                                
                                                if (block) {
                                                    block([NSArray arrayWithArray:mutablePosts], nil);
                                                }
                                                
                                          } failure:^(NSURLSessionDataTask * tast, NSError * error) {
                                              
                                              if (block) {
                                                  block([NSArray array], error);
                                              }
                                          }];
}

@end
