//
//  StoryPageView.h
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class StoryInformation;
@class ExtraInformation;
@interface StoryPageView : UIView

//- (void)loadStoryWithURLString:(NSString *)URLString;
- (void)loadStoryBody:(StoryInformation *)storyinformation;
- (void)loadExtraInformation:(ExtraInformation *)extrainformation;
@end

NS_ASSUME_NONNULL_END
