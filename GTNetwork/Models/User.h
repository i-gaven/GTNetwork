//
//  User.h
//  GTNetwork
//
//  Created by 赵国腾 on 15/8/11.
//  Copyright (c) 2015年 zhaoguoteng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, assign, readonly) NSInteger userID;
@property (nonatomic, strong, readonly) NSString *userName;
@property (nonatomic, strong, readonly)  NSURL *avatarImageURL;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
