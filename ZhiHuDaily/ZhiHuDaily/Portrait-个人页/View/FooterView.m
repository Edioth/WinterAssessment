//
//  FooterView.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/23.
//

#import "FooterView.h"
#import <Masonry.h>

@interface FooterView ()
///设置按钮
@property (nonatomic, weak) UIButton *preferences;
///
@property (nonatomic, weak) UIButton *nightMode;
@end

@implementation FooterView
//初始化方法
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSubviews];
    }
    return self;
}
//加载子控件
- (void)loadSubviews {
    //初始化设置按钮
    UIButton *preferences = [[UIButton alloc] init];
    [preferences setTitle:@"设置" forState:UIControlStateNormal];
    [preferences setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [preferences setImage:[UIImage imageNamed:@"Menu_Icon_Setting"] forState:UIControlStateNormal];
    [preferences sizeToFit];
    [preferences addTarget:self action:@selector(preferencesClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:preferences];
    self.preferences = preferences;
    //初始化夜间模式按钮
    UIButton *nightMode = [[UIButton alloc] init];
    [nightMode setTitle:@"夜晚" forState:UIControlStateNormal];
    [nightMode setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [nightMode setImage:[UIImage imageNamed:@"Menu_Dark"] forState:UIControlStateNormal];
    [nightMode sizeToFit];
    [nightMode addTarget:self action:@selector(nightModeClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:nightMode];
    self.nightMode = nightMode;
}
//布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.preferences mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.centerX.equalTo(self).mas_offset(75);
    }];
    [self.nightMode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.centerX.equalTo(self).mas_offset(-75);
    }];
}
//发出通知，控制器控制跳转到 设置界面
- (void)preferencesClick {
    //监听者 Portrait
    NSNotification *note = [[NSNotification alloc] initWithName:@"preferencesClick" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:note];
}
//发出通知，控制器实现该控件的作用
- (void)nightModeClick {
    //监听者 Portrait
    NSNotification *note = [[NSNotification alloc] initWithName:@"nightModeClick" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:note];
}


@end
