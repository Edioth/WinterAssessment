//
//  StoryInformation.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/26.
//

#import "StoryInformation.h"
#import "NetworkTools.h"

@implementation StoryInformation

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)storyinformationWithDic:(NSDictionary *)dic {
    return [[self alloc] initWithDic:dic];
}
+ (void)storyinformationWithStoryid:(NSString *)Storyid Success:(void (^)(StoryInformation * storyinformation))success Error:(void (^)(void))error {
    [[NetworkTools sharedManagerWithBaseURL:[NSURL URLWithString:@"https://news-at.zhihu.com/api/3"]] GET:[NSString stringWithFormat:@"story/%@", Storyid] parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
            //字典转模型
            StoryInformation *extrainformation = [StoryInformation storyinformationWithDic:responseObject];
            
            if (success) {
                success(extrainformation);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull err) {
            if (error) {
                error();
            }
        }];
}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end
