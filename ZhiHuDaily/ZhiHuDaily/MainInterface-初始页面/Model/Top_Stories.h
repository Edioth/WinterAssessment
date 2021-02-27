//
//  Top_Stories.h
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Top_Stories : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *hint;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, copy) NSString *image_hue;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *id;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)top_storiesWithdic:(NSDictionary *)dic;
+ (void)top_storiesWithSuccess:(void(^)(NSArray *array))success error:(void(^)(void))error;

@end

NS_ASSUME_NONNULL_END
