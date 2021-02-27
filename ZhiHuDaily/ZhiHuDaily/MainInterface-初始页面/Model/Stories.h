//
//  Stories.h
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Stories : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *hint;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, copy) NSString *image_hue;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *id;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)storiesWithdic:(NSDictionary *)dic;
/// 加载最新新闻
+ (void)storiesWithSuccess:(void(^)(NSArray *array))success error:(void(^)(void))error;
/// 下滑加载更多数据
+ (void)loadMorestoriesWithDateString:(NSString *)URLString Success:(void(^)(NSArray *array))success error:(void(^)(void))error;


@end

NS_ASSUME_NONNULL_END
