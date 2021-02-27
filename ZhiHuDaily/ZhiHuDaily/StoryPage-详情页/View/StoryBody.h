//
//  StoryBody.h
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class StoryInformation;
@interface StoryBody : UITextView
///模型
@property (nonatomic, strong) StoryInformation *storyinformation;
@end

NS_ASSUME_NONNULL_END
