//
//  StoryPageView.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/24.
//

#import "StoryPageView.h"
#import "StoryBody.h"
#import "webView.h"
#import "BottomBar.h"
#import <Masonry.h>

@interface StoryPageView ()
///新闻主体 textView
@property (nonatomic, weak) StoryBody *storybody;
///新闻主体 WKWebView
//@property (nonatomic, weak) webView *webview;
///底部导航栏
@property (nonatomic, weak) BottomBar *bottomBar;
@end

@implementation StoryPageView
///初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSubviews];
    }
    return self;
}
///加载子控件
- (void)loadSubviews {
    BottomBar *bottombar = [[BottomBar alloc] initWithFrame:CGRectMake(0, self.frame.size.height*11/12, self.frame.size.width, self.frame.size.height / 12)];
    [self addSubview:bottombar];
    self.bottomBar = bottombar;
    
    StoryBody *storybody = [[StoryBody alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*11/12)];
    [self addSubview:storybody];
    self.storybody = storybody;
    //WKWebView实现展示文章
//    webView *webview = [[webView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*11/12)];
//    [self addSubview:webview];
//    self.webview = webview;
}
///子控件布局
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.bottomBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(self.frame.size.height / 12);
    }];
    [self.storybody mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.bottom.equalTo(self.bottomBar.mas_top);
    }];
    //WKWebView布局
//    [self.webview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.equalTo(self);
//        make.bottom.equalTo(self.bottomBar.mas_top);
//    }];
}
///赋值新闻内容
- (void)loadStoryBody:(id)storyinformation {
    self.storybody.storyinformation = storyinformation;
}
///赋值新闻额外信息
- (void)loadExtraInformation:(ExtraInformation *)extrainformation {
    self.bottomBar.extraInformation = extrainformation;
}

@end
