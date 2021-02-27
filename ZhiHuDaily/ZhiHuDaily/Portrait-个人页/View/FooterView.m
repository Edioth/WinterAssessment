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

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSubviews];
    }
    return self;
}

- (void)loadSubviews {
    UIButton *preferences = [[UIButton alloc] init];
    [preferences setTitle:@"设置" forState:UIControlStateNormal];
    [preferences setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [preferences setImage:[UIImage imageNamed:@"Menu_Icon_Setting"] forState:UIControlStateNormal];
    [preferences sizeToFit];
    [preferences addTarget:self action:@selector(preferencesClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:preferences];
    self.preferences = preferences;
    
    UIButton *nightMode = [[UIButton alloc] init];
    [nightMode setTitle:@"夜晚" forState:UIControlStateNormal];
    [nightMode setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [nightMode setImage:[UIImage imageNamed:@"Menu_Dark"] forState:UIControlStateNormal];
    [nightMode sizeToFit];
    [nightMode addTarget:self action:@selector(nightModeClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:nightMode];
    self.nightMode = nightMode;
}
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

- (void)preferencesClick {
    
    NSNotification *note = [[NSNotification alloc] initWithName:@"preferencesClick" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:note];
}

- (void)nightModeClick {
    NSNotification *note = [[NSNotification alloc] initWithName:@"nightModeClick" object:nil userInfo:nil];
    [[NSNotificationCenter defaultCenter] postNotification:note];
}


@end
