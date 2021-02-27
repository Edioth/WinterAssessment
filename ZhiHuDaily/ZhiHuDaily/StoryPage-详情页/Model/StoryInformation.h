//
//  StoryInformation.h
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface StoryInformation : NSObject

@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *image_hue;
@property (nonatomic, copy) NSString *image_source;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *section_thumbnail;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *ga_prefix;
@property (nonatomic, copy) NSString *section_name;
@property (nonatomic, copy) NSString *share_url;
@property (nonatomic, copy) NSString *section_id;
@property (nonatomic, strong) NSArray *css;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSArray *js;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)storyinformationWithDic:(NSDictionary *)dic;
+ (void)storyinformationWithStoryid:(NSString *)Storyid Success:(void(^)(StoryInformation *storyinformation))success Error:(void(^)(void))error;

@end

NS_ASSUME_NONNULL_END
