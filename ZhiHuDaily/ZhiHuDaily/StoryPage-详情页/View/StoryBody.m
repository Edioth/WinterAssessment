//
//  StoryBody.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/26.
//

#import "StoryBody.h"
#import "StoryInformation.h"

@implementation StoryBody

- (void)setStoryinformation:(StoryInformation *)storyinformation {
    _storyinformation = storyinformation;
    //翻译HTML格式的body 直接展示出来
    NSString *htmlBody = storyinformation.body;
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[htmlBody dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    self.attributedText = attributedString;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
