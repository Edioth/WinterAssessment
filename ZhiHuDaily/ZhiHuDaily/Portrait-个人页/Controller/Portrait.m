//
//  Portrait.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/23.
//

#import "Portrait.h"
#import "HeadPortrait.h"
#import "FooterView.h"
#import "Preferences.h"
//跳转的界面
#import "MyCollections.h"
#import "MyMessages.h"

@interface Portrait ()

@end

@implementation Portrait

- (void)loadView {
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.tableView.scrollEnabled = NO;
    self.tableView.rowHeight = 60;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferencesClick) name:@"preferencesClick" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nightModeClick) name:@"nightModeClick" object:nil];

}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"我的收藏";
    } else {
        cell.textLabel.text = @"我的消息";
    }
    return cell;
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//设置头视图和尾视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HeadPortrait *potrait = [[HeadPortrait alloc] initWithFrame:CGRectZero];
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"isLogin"] isEqualToString:@""]) {
        potrait.icon.image = [UIImage imageNamed:@"Menu_Avatar"];
    } else {
        potrait.icon.image = [UIImage imageNamed:@"userPicture"];
    }
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"userName"] isEqualToString:@""]) {
        //如果没有值就不赋值
    } else {
        potrait.name.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"userName"];
    }
    return potrait;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return self.tableView.frame.size.width/2;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    FooterView *footerView = [[FooterView alloc] initWithFrame:CGRectZero];
    return footerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return self.tableView.frame.size.height - self.tableView.sectionHeaderHeight - self.tableView.rowHeight * 2;
    return self.tableView.frame.size.height / 2;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        //跳转至我的收藏
        [self.navigationController pushViewController:[[MyCollections alloc] init] animated:YES];
    } else {
        //跳转至我的消息
        [self.navigationController pushViewController:[[MyMessages alloc] init] animated:YES];
    }
}

- (void)nightModeClick {
    NSLog(@"夜间模式");
}
- (void)preferencesClick {
    Preferences *preferences = [[Preferences alloc] init];
    [self.navigationController pushViewController:preferences animated:YES];
}
@end
