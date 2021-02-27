//
//  BottomBar.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/24.
//

#import "BottomBar.h"
#import "ExtraInformation.h"
#import <Masonry.h>

@interface BottomBar ()
{
    BOOL isPraised;
    BOOL isCollected;
}
///返回
@property (nonatomic, weak) UIButton *backButtom;
///点赞
@property (nonatomic, weak) UIButton *praiseButtom;
///评论
@property (nonatomic, weak) UIButton *commentButtom;
///收藏
@property (nonatomic, weak) UIButton *collectButtom;
///转发
@property (nonatomic, weak) UIButton *repostButtom;


@end

@implementation BottomBar

- (void)setExtraInformation:(ExtraInformation *)extraInformation {
    _extraInformation = extraInformation;
    [self.praiseButtom setTitle:[NSString stringWithFormat:@"%@", extraInformation.popularity] forState:UIControlStateNormal];
    [self.commentButtom setTitle:[NSString stringWithFormat:@"%@", extraInformation.comments] forState:UIControlStateNormal];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSubviews];
    }
    return self;
}
- (void)loadSubviews {
    // 返回
    UIButton *backbutton = [[UIButton alloc] init];
    [backbutton setImage:[UIImage imageNamed:@"News_Navigation_Arrow"] forState:UIControlStateNormal];
    [backbutton setImage:[UIImage imageNamed:@"News_Navigation_Arrow_Highlight"] forState:UIControlStateHighlighted];
    backbutton.imageEdgeInsets = UIEdgeInsetsMake(-30, 0, 0, 0);
    [backbutton addTarget:self action:@selector(clickBack) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backbutton];
    self.backButtom = backbutton;
    // 点赞
    UIButton *praisebutton = [[UIButton alloc] init];
    [praisebutton setImage:[UIImage imageNamed:@"News_Navigation_Vote"] forState:UIControlStateNormal];
    [praisebutton setImage:[UIImage imageNamed:@"News_Navigation_Voted"] forState:UIControlStateHighlighted];
    [praisebutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    praisebutton.imageEdgeInsets = UIEdgeInsetsMake(-30, 0, 0, 0);
    praisebutton.titleEdgeInsets = UIEdgeInsetsMake(-30, -30, 0, 0);
    [praisebutton addTarget:self action:@selector(clickPraise) forControlEvents:UIControlEventTouchUpInside];
     [self addSubview:praisebutton];
    self.praiseButtom = praisebutton;
    // 评论
    UIButton *commentbutton = [[UIButton alloc] init];
    [commentbutton setImage:[UIImage imageNamed:@"News_Navigation_Comment"] forState:UIControlStateNormal];
    [commentbutton setImage:[UIImage imageNamed:@"News_Navigation_Comment_Highlight"] forState:UIControlStateHighlighted];
    [commentbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    commentbutton.imageEdgeInsets = UIEdgeInsetsMake(-30, 0, 0, 0);
    commentbutton.titleEdgeInsets = UIEdgeInsetsMake(-30, -30, 0, 0);
    [self addSubview:commentbutton];
    self.commentButtom = commentbutton;
    // 收藏
    UIButton *collectbutton = [[UIButton alloc] init];
    [collectbutton setImage:[UIImage imageNamed:@"Menu_Icon_Collect"] forState:UIControlStateNormal];
    [collectbutton setImage:[UIImage imageNamed:@"Menu_Icon_Collect_Highlight"] forState:UIControlStateHighlighted];
    [collectbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    collectbutton.imageEdgeInsets = UIEdgeInsetsMake(-30, 0, 0, 0);
    [collectbutton addTarget:self action:@selector(clickCollect) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:collectbutton];
    self.collectButtom = collectbutton;
    //转发
    UIButton *repostButton = [[UIButton alloc] init];
    [repostButton setImage:[UIImage imageNamed:@"News_Navigation_Share"] forState:UIControlStateNormal];
    [repostButton setImage:[UIImage imageNamed:@"News_Navigation_Share_Highlight"] forState:UIControlStateHighlighted];
    [repostButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    repostButton.imageEdgeInsets = UIEdgeInsetsMake(-30, 0, 0, 0);
    [self addSubview:repostButton];
    self.repostButtom = repostButton;
    
    isPraised = NO;
    isCollected = NO;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self.backButtom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self);
        make.width.mas_equalTo(self.frame.size.width/5);
    }];
    [self.praiseButtom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.backButtom.mas_right);
        make.width.mas_equalTo(self.frame.size.width/5);
    }];
    [self.commentButtom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.praiseButtom.mas_right);
        make.width.mas_equalTo(self.frame.size.width/5);
    }];
    [self.collectButtom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.commentButtom.mas_right);
        make.width.mas_equalTo(self.frame.size.width/5);
    }];
    [self.repostButtom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.left.equalTo(self.collectButtom.mas_right);
        make.width.mas_equalTo(self.frame.size.width/5);
    }];
}


- (void)clickBack {
    NSNotification *note = [NSNotification notificationWithName:@"clickBack" object:nil];
    [[NSNotificationCenter defaultCenter] postNotification:note];
}

- (void)clickPraise {
    if (isPraised) {//取消点赞
        [self.praiseButtom setImage:[UIImage imageNamed:@"News_Navigation_Vote"] forState:UIControlStateNormal];
        isPraised = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"praiseFail" object:nil];
    } else {//点赞成功
        [self.praiseButtom setImage:[UIImage imageNamed:@"News_Navigation_Voted"] forState:UIControlStateNormal];
        isPraised = YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"praiseSuccess" object:nil];
    }
}
- (void)clickCollect {
    if (isCollected) {
        [self.collectButtom setImage:[UIImage imageNamed:@"Menu_Icon_Collect"] forState:UIControlStateNormal];
        isCollected = NO;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"CollectFail" object:nil];
    } else {
        [self.collectButtom setImage:[UIImage imageNamed:@"Menu_Icon_Collect_Highlight"] forState:UIControlStateNormal];
        isCollected = YES;
        [[NSNotificationCenter defaultCenter] postNotificationName:@"CollectSuccess" object:nil];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
