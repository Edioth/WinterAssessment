//
//  HeadPortrait.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/23.
//

#import "HeadPortrait.h"
#import <Masonry.h>

@interface HeadPortrait ()


@end

@implementation HeadPortrait
//初始化控件
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSubviews];
    }
    return self;
}
//加载头视图的子控件
- (void)loadSubviews {
    //初始化头像
    UIImageView *icon = [[UIImageView alloc] init];
    icon.backgroundColor = [UIColor redColor];
    icon.layer.cornerRadius = 50;
    [self addSubview:icon];
    self.icon = icon;

    //初始化昵称
    UILabel *name = [[UILabel alloc] init];
    [name setFont:[UIFont systemFontOfSize:22]];
    [self addSubview:name];
    self.name = name;

}
//布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.centerX.equalTo(self);
    }];
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
        make.bottom.equalTo(self.name.mas_top);
        make.width.height.mas_equalTo(100);
    }];
}


@end
