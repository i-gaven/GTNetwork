//
//  User.m
//  GTNetwork
//
//  Created by 赵国腾 on 15/8/11.
//  Copyright (c) 2015年 zhaoguoteng. All rights reserved.
//

#import "User.h"

@interface User ()

@property (nonatomic, assign, readwrite) NSInteger userID;
@property (nonatomic, strong, readwrite) NSString *userName;
@property (nonatomic, strong, readwrite) NSString *avatarImageURLString;

@end

@implementation User

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    
    if (self = [super init]) {
        
        self.userID = (NSUInteger)[[attributes valueForKeyPath:@"id"] integerValue];
        self.userName = [attributes valueForKeyPath:@"username"];
        self.avatarImageURLString = [attributes valueForKeyPath:@"avatar_image.url"];
    }
    
    return self;
}

- (NSURL *)avatarImageURL {
    return [NSURL URLWithString:_avatarImageURLString];
}

@end
