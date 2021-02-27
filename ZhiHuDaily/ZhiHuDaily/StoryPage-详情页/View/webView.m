//
//  webView.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/24.
//

#import "webView.h"
#import "StoryInformation.h"

@implementation webView

- (void)setStoryinformation:(StoryInformation *)storyinformation {
    _storyinformation = storyinformation;
    NSURL *url = [NSURL URLWithString:storyinformation.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self loadRequest:request];
}

- (void)try {
    
}

@end
