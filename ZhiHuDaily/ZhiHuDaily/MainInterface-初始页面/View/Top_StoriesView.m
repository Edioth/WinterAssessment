//
//  Top_StoriesView.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/24.
//

#import "Top_StoriesView.h"
#import "Top_Stories.h"
#import <Masonry.h>
#import <UIImageView+AFNetworking.h>

@interface Top_StoriesView ()
@property (nonatomic, weak) UILabel *title;
@property (nonatomic, weak) UILabel *hint;
@end

@implementation Top_StoriesView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadSubviews];
    }
    return self;
}

+ (instancetype)top_storiesViewWithTop_Story:(Top_Stories *)top_story {
    return [[self alloc] init];
}

- (void)loadSubviews {
    //标题
    UILabel *title = [[UILabel alloc] init];
    [title setFont:[UIFont systemFontOfSize:24 weight:UIFontWeightBold]];
    title.textColor = [UIColor whiteColor];
    title.numberOfLines = 2;
    self.title = title;
    [self addSubview:title];
    
    //来源
    UILabel *hint = [[UILabel alloc] init];
    [hint setFont:[UIFont systemFontOfSize:16 weight:UIFontWeightThin]];
    hint.textColor = [UIColor whiteColor];
    self.hint = hint;
    [self addSubview:hint];
}

- (void)setTop_story:(Top_Stories *)top_story {
    
    _top_story = top_story;
    //bug为什么title和hint无法赋值
    [self setImageWithURL:[NSURL URLWithString:top_story.image]];
    self.title.text = top_story.title;
    self.hint.text = top_story.hint;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //title and hint
    [self.hint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).mas_offset(20);
        make.bottom.equalTo(self).mas_offset(-20);
    }];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(20);
        make.bottom.equalTo(self.hint.mas_top);
        make.right.mas_offset(-20);
    }];
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
