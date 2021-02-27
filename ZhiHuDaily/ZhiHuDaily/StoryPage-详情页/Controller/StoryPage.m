//
//  StoryPage.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/24.
//

#import "StoryPage.h"
#import "StoryPageView.h"
/** 模型 */
#import "ExtraInformation.h"
#import "StoryInformation.h"

@interface StoryPage ()
///底部导航栏
@property (nonatomic, weak) StoryPageView *storypageView;
///新闻的id
@property (nonatomic, copy) NSString *storyid;
///新闻的额外信息
@property (nonatomic, strong) ExtraInformation *extrainformation;
///新闻的主体
@property (nonatomic, strong) StoryInformation *storyinformation;
@end

@implementation StoryPage
/** 初始化方法 */
- (instancetype)initWithStoryId:(NSString *)storyId {
    self = [super init];
    if (self) {
        self.storyid = storyId;
    }
    return self;
}
+ (instancetype)storyPageWithStoryId:(NSString *)storyId {
    return [[self alloc] initWithStoryId:storyId];
}
/** 给数据赋值 */
- (void)setExtrainformation:(ExtraInformation *)extrainformation {
    _extrainformation = extrainformation;
    [(StoryPageView *)self.view loadExtraInformation:self.extrainformation];
}
- (void)setStoryinformation:(StoryInformation *)storyinformation {
    _storyinformation = storyinformation;
    [(StoryPageView *)self.view loadStoryBody:storyinformation];
    
//    [(StoryPageView *)self.view loadStoryWithURLString:storyinformation.url];
}
/** 加载视图 */
- (void)loadView {
    StoryPageView *storypageView = [[StoryPageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    storypageView.backgroundColor = [UIColor whiteColor];
    self.view = storypageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    [self addNotification];
    [self loadExtraInformation];
    [self loadStoryInformation];
    
}
///监听通知
- (void)addNotification {
    ///底部栏的按钮点击监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clickBack) name:@"clickBack" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(praiseFail) name:@"praiseFail" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(praiseSuccess) name:@"praiseSuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(collectSuccess) name:@"CollectSuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(collectFail) name:@"CollectFail" object:nil];
}
///移除监听
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
#pragma mark -
/** 对应按钮的点击方法 */
- (void)clickBack {
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)praiseFail {
    self.extrainformation.popularity = [NSNumber numberWithInt:self.extrainformation.popularity.intValue - 1];
    self.extrainformation = self.extrainformation;
    [self alterWithMessage:@"取消点赞"];
}
- (void)praiseSuccess {
    self.extrainformation.popularity = [NSNumber numberWithInt:self.extrainformation.popularity.intValue + 1];
    self.extrainformation = self.extrainformation;
    [self alterWithMessage:@"点赞成功"];
}
- (void)collectFail {
    [self alterWithMessage:@"取消收藏"];
}
- (void)collectSuccess {
    [self alterWithMessage:@"收藏成功"];
}

///弹出提示框
- (void)alterWithMessage:(NSString *)msg {
    UIAlertController *alter = [UIAlertController alertControllerWithTitle:nil message:msg preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alter animated:YES completion:nil];
    [alter dismissViewControllerAnimated:YES completion:nil];
}
//申请底部栏model数据
- (void)loadExtraInformation {
    NSString *storyid = self.storyid;
    [ExtraInformation extrainformationWithStoryid:storyid Success:^(ExtraInformation * _Nonnull extrainformation) {
        self.extrainformation = extrainformation;
    } Error:^{
        NSLog(@"数据出错啦");
    }];
}
//申请新闻主干部分model
- (void)loadStoryInformation {
    NSString *storyid = self.storyid;
    [StoryInformation storyinformationWithStoryid:storyid Success:^(StoryInformation * _Nonnull storyinformation) {
        self.storyinformation = storyinformation;
    } Error:^{
        NSLog(@"数据出错啦");
    }];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
