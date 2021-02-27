//
//  Portrait.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/23.
//

#import "Portrait.h"
/** 头控件 尾控件 */
#import "HeadPortrait.h"
#import "FooterView.h"
/** 跳转的界面 */
#import "MyCollections.h"
#import "MyMessages.h"
#import "Preferences.h"

@interface Portrait ()

@end

@implementation Portrait

- (void)loadView {
    //得到屏幕的 bounds
    self.tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = NO;
    self.tableView.scrollEnabled = NO;
    self.tableView.rowHeight = 60;
    /** 监听 tableView子控件FooterView的子控件的点击 */
    //点击设置
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preferencesClick) name:@"preferencesClick" object:nil];
    //点击夜间模式
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nightModeClick) name:@"nightModeClick" object:nil];

}
#pragma mark - Table view data source
// 2 个cell 显示 我的消息 我的收藏
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
//移除通知
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//设置头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //初始化头控件
    HeadPortrait *potrait = [[HeadPortrait alloc] initWithFrame:CGRectZero];
    //从 用户偏好设置 得到 是否登陆isLogin 用户名userName
    //设置头像
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"isLogin"] isEqualToString:@""]) {
        //没有登录 设置为默认图片
        potrait.icon.image = [UIImage imageNamed:@"Menu_Avatar"];
    } else {
        //完成登录 设置为用户头像
        potrait.icon.image = [UIImage imageNamed:@"userPicture"];
    }
    //设置用户名
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"userName"] isEqualToString:@""]) {
        //如果没有值就不赋值
    } else {
        //如果有则取出用户名并赋值
        potrait.name.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"userName"];
    }
    return potrait;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    //头视图高度
    return self.tableView.frame.size.width/2;
}
//设置尾视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    FooterView *footerView = [[FooterView alloc] initWithFrame:CGRectZero];
    return footerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    //尾视图高度
    return self.tableView.frame.size.height / 2;
}
//cell的点击方法实现代码
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        //跳转至 我的收藏
        [self.navigationController pushViewController:[[MyCollections alloc] init] animated:YES];
    } else {
        //跳转至 我的消息
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
