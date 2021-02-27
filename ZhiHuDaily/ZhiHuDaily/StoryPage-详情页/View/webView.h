//
//  webView.h
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/24.
//

/**
 最开始使用WKWebView实现显示新闻的展示
 */

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN
@class StoryInformation;
@interface webView : WKWebView

@property (nonatomic, strong) StoryInformation *storyinformation;

@end

NS_ASSUME_NONNULL_END
