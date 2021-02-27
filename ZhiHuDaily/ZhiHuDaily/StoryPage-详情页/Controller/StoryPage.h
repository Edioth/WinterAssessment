//
//  StoryPage.h
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface StoryPage : UIViewController

- (instancetype)initWithStoryId:(NSString *)storyId;
+ (instancetype)storyPageWithStoryId:(NSString *)storyId;

@end

NS_ASSUME_NONNULL_END
