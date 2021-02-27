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

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSubviews];
    }
    return self;
}
- (void)loadSubviews {
    ///头像
    UIImageView *icon = [[UIImageView alloc] init];
    icon.backgroundColor = [UIColor redColor];
    icon.layer.cornerRadius = 50;
    [self addSubview:icon];
    self.icon = icon;

    ///昵称
    UILabel *name = [[UILabel alloc] init];
    [name setFont:[UIFont systemFontOfSize:22]];
    [self addSubview:name];
    self.name = name;

}

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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
