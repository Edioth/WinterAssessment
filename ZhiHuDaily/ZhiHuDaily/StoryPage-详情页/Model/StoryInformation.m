//
//  StoryInformation.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/26.
//

#import "StoryInformation.h"
#import "NetworkTools.h"

@implementation StoryInformation
///初始化方法
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
///网络申请
+ (void)storyinformationWithStoryid:(NSString *)Storyid Success:(void (^)(StoryInformation * storyinformation))success Error:(void (^)(void))error {
    /** 使用自定义的网络工具 */
    [[NetworkTools sharedManagerWithBaseURL:[NSURL URLWithString:@"https://news-at.zhihu.com/api/3"]] GET:[NSString stringWithFormat:@"story/%@", Storyid] parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
            //字典转模型
            StoryInformation *extrainformation = [StoryInformation storyinformationWithDic:responseObject];
            
            if (success) {
                //返回模型
                success(extrainformation);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull err) {
            if (error) {
                error();
            }
        }];
}
///忽略模型中无对应属性的情况
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end
