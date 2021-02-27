//
//  Top_Stories.m
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/23.
//

#import "Top_Stories.h"
#import "NetworkTools.h"

@implementation Top_Stories

- (instancetype)initWithDic:(NSDictionary *)dic {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)top_storiesWithdic:(NSDictionary *)dic {
    return [[self alloc] initWithDic:dic];
}

//发送异步请求获取数据
+ (void)top_storiesWithSuccess:(void (^)(NSArray * _Nonnull))success error:(void (^)(void))error {
    [[NetworkTools sharedManagerWithBaseURL:[NSURL URLWithString:@"https://news-at.zhihu.com/api/3"]] GET:@"news/latest" parameters:nil headers:nil progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //字典转模型
            NSArray *array = [responseObject valueForKey:@"top_stories"];
            NSInteger capacity = array.count;
            NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:capacity];
            [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                Top_Stories *top_stories = [Top_Stories top_storiesWithdic:obj];
                [mArray addObject:top_stories];
            }];
            if (success) {
                success(mArray.copy);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull err) {
            if (error) {
                error();
            }
        }];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

@end
