//
//  HeadPortrait.h
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeadPortrait : UIView
///头像
@property (nonatomic, weak) UIImageView *icon;
///昵称
@property (nonatomic, weak) UILabel *name;
@end

NS_ASSUME_NONNULL_END
