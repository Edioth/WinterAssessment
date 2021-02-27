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
@property (nonatomic, weak) StoryBody *storybody;
//@property (nonatomic, weak) webView *webview;
@property (nonatomic, weak) BottomBar *bottomBar;
@end

@implementation StoryPageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSubviews];
    }
    return self;
}

- (void)loadSubviews {
    BottomBar *bottombar = [[BottomBar alloc] initWithFrame:CGRectMake(0, self.frame.size.height*11/12, self.frame.size.width, self.frame.size.height / 12)];
    [self addSubview:bottombar];
    self.bottomBar = bottombar;
    
    StoryBody *storybody = [[StoryBody alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*11/12)];
    [self addSubview:storybody];
    self.storybody = storybody;
//    webView *webview = [[webView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*11/12)];
//    [self addSubview:webview];
//    self.webview = webview;
}
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

//    [self.webview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.right.equalTo(self);
//        make.bottom.equalTo(self.bottomBar.mas_top);
//    }];
}
- (void)loadStoryBody:(id)storyinformation {
    self.storybody.storyinformation = storyinformation;
}
- (void)loadExtraInformation:(ExtraInformation *)extrainformation {
    self.bottomBar.extraInformation = extrainformation;
}
//- (void)loadStoryWithURLString:(NSString *)URLString {
//    NSURL *url = [NSURL URLWithString:URLString];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [self.webview loadRequest:request];
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
