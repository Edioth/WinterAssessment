//
//  MyMessages.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/23.
//

#import "MyMessages.h"

@interface MyMessages ()

@end

@implementation MyMessages

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的消息";
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
@end
