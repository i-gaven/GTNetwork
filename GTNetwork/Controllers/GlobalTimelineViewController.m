//
//  ViewController.m
//  GTNetwork
//
//  Created by 赵国腾 on 15/8/11.
//  Copyright (c) 2015年 zhaoguoteng. All rights reserved.
//

#import "GlobalTimelineViewController.h"
#import "Post.h"

@interface GlobalTimelineViewController ()

@property (nonatomic, strong) NSArray *posts;

@end

@implementation GlobalTimelineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [Post globalTimelinePostsWithBlock:^(NSArray *posts, NSError *error) {
        
        self.posts = posts;
        [self.tableView reloadData];
    }];
}

#pragma mark -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.posts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    Post *post = self.posts[indexPath.row];
    
    cell.textLabel.text = post.text;
    
    return cell;
}

@end
