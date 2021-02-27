//
//  MainInterface.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/23.
//


#import "MainInterface.h"
//跳转的控制器
#import "Portrait.h"
#import "StoryPage.h"
#import "Login.h"
// 视图
#import "StoriesCell.h"
#import "ImageLoopView.h"
// 模型
#import "Stories.h"
#import "Top_Stories.h"
/** 刷新控件 */
#import <MJRefresh.h>

@interface MainInterface ()
{
    ///登录状态
    BOOL loginStastus;
}
@property (nonatomic, strong) NSMutableArray *stories;
@property (nonatomic, strong) NSArray *top_stories;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *userName;

@end

@implementation MainInterface

- (void)viewDidAppear:(BOOL)animated {
    [self loadRightView];
}

- (void)viewDidLoad {
    loginStastus = NO;
    [super viewDidLoad];
    [self loadStoriesAndTop_Stories];
    self.tableView.rowHeight = 110;
    [self loadRightView];
    [self loadLeftView];
    [self loadTitleView];
    self.date = [self loadDate];
    [self.tableView registerClass:[StoriesCell class] forCellReuseIdentifier:@"StoriesCell"];
    /** 刷新 */
    [self loadHeaderAndFooterRefresh];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(LogOff) name:@"Logoff" object:nil];

}

#pragma mark - 加载导航栏
- (void)loadRightView {
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"isLogin"] isEqualToString:@""]) {
        [rightButton setImage:[UIImage imageNamed:@"Menu_Avatar"] forState:UIControlStateNormal];
    } else {
        [rightButton setImage:[UIImage imageNamed:@"userPicture"] forState:UIControlStateNormal];
    }
    rightButton.layer.cornerRadius = 20;
    [rightButton addTarget:self action:@selector(clickPortrait) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:rightButton]];
}
- (void)loadLeftView {
    UILabel *date = [[UILabel alloc] init];
    NSDateFormatter* formattor = [[NSDateFormatter alloc]init];
    formattor.dateFormat=@"MMdd";
    NSString* dateNow = [formattor stringFromDate:[[NSDate alloc] init]];
    int Day = dateNow.intValue % 100;
    int Month = (dateNow.intValue - Day) / 100;
    date.text = [NSString stringWithFormat:@"%d月%d日", Month, Day];
    [date setFont:[UIFont systemFontOfSize:18]];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:date]];
}
- (void)loadTitleView {
    UILabel *title = [[UILabel alloc] init];
    title.text = @"知乎日报";
    [title setFont:[UIFont systemFontOfSize:24 weight:UIFontWeightBold]];
    [self.navigationItem setTitleView:title];
}

#pragma mark - 载入模型
- (void)setStories:(NSMutableArray *)stories {
    _stories = stories;
    [self.tableView reloadData];
}
- (void)setTop_stories:(NSArray *)top_stories {
    _top_stories = top_stories;
    [self.tableView reloadData];
}
- (void)loadStoriesAndTop_Stories {
    [Top_Stories top_storiesWithSuccess:^(NSArray * _Nonnull array) {
        self.top_stories = array;
    } error:^{
        NSLog(@"出错了");
    }];
    [Stories storiesWithSuccess:^(NSArray * _Nonnull array) {
        self.stories = array.mutableCopy;
    } error:^{
        NSLog(@"出错了");
    }];
}
- (NSString *)loadDate {
    NSDateFormatter* formattor = [[NSDateFormatter alloc] init];
    formattor.dateFormat=@"yyyyMMdd";
    NSString* str = [formattor stringFromDate:[[NSDate alloc] init]];
    return str;
}
#pragma mark - 点击方法
- (void)LogOff {
    loginStastus = NO;
    [self loadRightView];
}
- (void)clickPortrait {
    //跳转判断
    if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"isLogin"] isEqualToString:@""]) {
        Login *login = [[Login alloc] init];
        [self.navigationController pushViewController:login animated:YES];
    } else {
        Portrait *portrait = [[Portrait alloc] init];
        [self.navigationController pushViewController:portrait animated:YES];
    }
}
- (void)loadHeaderAndFooterRefresh {
    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(pullDownToRefresh)];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(slideUpToLoadMoreData)];
}
//上滑加载更多数据
- (void)slideUpToLoadMoreData {
    //获得需要申请的日期
    int applyDate = self.date.intValue;
    applyDate -= 1;
    self.date = [NSString stringWithFormat:@"%d", applyDate];
    //发送GET请求获得数据
    [Stories loadMorestoriesWithDateString:self.date Success:^(NSArray * _Nonnull array) {
        [self.stories addObjectsFromArray:array];
        [self.tableView reloadData];
    } error:^{
        NSLog(@"出错了");
    }];
    //运行完此方法结束刷新
    [self.tableView.mj_footer endRefreshing];
}
//下拉刷新数据
- (void)pullDownToRefresh {
    [self.tableView.mj_header endRefreshing];
}
#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.stories.count / 6;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.stories.count;
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *StoriesCellID = @"StoriesCell";
    StoriesCell *cell = [tableView dequeueReusableCellWithIdentifier:StoriesCellID];
    if (cell == nil) {
        cell = [[StoriesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:StoriesCellID];
    }
    cell.stories = self.stories[indexPath.row + 6 * indexPath.section];
    return cell;
}

#pragma mark - Table view delegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section > 0) {
        UILabel *sectionDate = [[UILabel alloc] init];
        sectionDate.textAlignment = NSTextAlignmentCenter;
        NSDateFormatter* formattor = [[NSDateFormatter alloc] init];
        formattor.dateFormat=@"MMdd";
        NSString* str = [formattor stringFromDate:[[NSDate alloc] init]];
        NSInteger date = str.intValue - section;
        NSInteger Day = date % 100;
        NSInteger Month = (date - Day) / 100;
        sectionDate.text = [NSString stringWithFormat:@"--%ld月%ld日--", (long)Month, Day];
        return sectionDate;
    }
    ImageLoopView *imageLoopView = [[ImageLoopView alloc] init];
    //添加单击事件
    imageLoopView.actionBlock = ^(NSInteger index) {
        [self jumpToStoryAtIndexWithStoryId:imageLoopView.top_stories[index].id];
    };
    imageLoopView.top_stories = self.top_stories;
    return imageLoopView;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForHeaderInSection:(NSInteger)section {
    if (section > 0) {
        return 10;
    }
    return self.tableView.frame.size.width;
}
// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Push the view controller.
    StoriesCell *story = [tableView cellForRowAtIndexPath:indexPath];
    StoryPage *storypage = [[StoryPage alloc] initWithStoryId:story.stories.id];
    [self.navigationController pushViewController:storypage animated:YES];
}
- (void)jumpToStoryAtIndexWithStoryId:(NSString *)top_storyId {
    StoryPage *storypage = [[StoryPage alloc] initWithStoryId:top_storyId];
    [self.navigationController pushViewController:storypage animated:YES];
}

@end
