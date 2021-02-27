//
//  ExtraInformation.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/24.
//

#import "ExtraInformation.h"
#import "NetworkTools.h"

@implementation ExtraInformation

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+(instancetype)extrainformationWithDic:(NSDictionary *)dic {
    return [[self alloc] initWithDic:dic];
}

+ (void)extrainformationWithStoryid:(NSString *)Storyid Success:(void (^)(ExtraInformation * extrainformation))success Error:(void (^)(void))error {
    [[NetworkTools sharedManagerWithBaseURL:[NSURL URLWithString:@"https://news-at.zhihu.com/api/3"]] GET:[NSString stringWithFormat:@"story-extra/%@", Storyid] parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, NSDictionary * responseObject) {
            //字典转模型
            ExtraInformation *extrainformation = [ExtraInformation extrainformationWithDic:responseObject];
            
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
