//
//  Stories.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/23.
//

#import "StoriesCell.h"
#import "Stories.h"
#import <UIImageView+AFNetworking.h>
#import <Masonry.h>

@interface StoriesCell ()
///图标
@property (nonatomic, weak) UIImageView *icon;
///标题
@property (nonatomic, weak) UILabel *title;
///副标题
@property (nonatomic, weak) UILabel *hint;
@end

@implementation StoriesCell

- (void)setStories:(Stories *)stories {
    _stories = stories;
    [self.icon setImageWithURL:[NSURL URLWithString:self.stories.images[0]]];
    self.title.text = stories.title;
    self.hint.text = stories.hint;
    
}

//在这个方法中添加子控件
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubViews];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    int space = 10;
    //图片
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(space);
        make.right.bottom.mas_offset(-space);
        make.width.mas_equalTo(self.icon.mas_height);
    }];
    
    int Max_titleWidth = self.contentView.frame.size.width - 3 * space - self.icon.frame.size.width;
    int Max_titleHeight = self.contentView.frame.size.height;
    //标题
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.icon).mas_offset(space);
        make.left.mas_offset(space);
        make.width.mas_lessThanOrEqualTo(Max_titleWidth);
        make.height.mas_lessThanOrEqualTo(Max_titleHeight);
    }];
    
    //副标题
    [self.hint mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.title.mas_bottom);
        make.left.mas_offset(space);
        make.width.mas_lessThanOrEqualTo(Max_titleWidth);
    }];

}
- (void)loadSubViews {
    //图标
    UIImageView *icon = [[UIImageView alloc] init];
    [self.contentView addSubview:icon];
    self.icon = icon;
    
    //标题
    UILabel *title = [[UILabel alloc] init];
    title.numberOfLines = 0;
    [title setFont:[UIFont systemFontOfSize:18 weight:UIFontWeightBold]];
    [self.contentView addSubview:title];
    self.title = title;
    
    //副标题
    UILabel *hint = [[UILabel alloc] init];
    hint.numberOfLines = 0;
    [hint setFont:[UIFont systemFontOfSize:16 weight:UIFontWeightThin]];
    [self.contentView addSubview:hint];
    self.hint = hint;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
