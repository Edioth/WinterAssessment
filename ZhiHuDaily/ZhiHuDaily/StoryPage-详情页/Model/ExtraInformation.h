//
//  ExtraInformation.h
//  ZhiHuDaily
//
//  Created by Edioth Jin on 2021/2/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExtraInformation : NSObject

@property (nonatomic, copy) NSNumber *long_comments;
@property (nonatomic, copy) NSNumber *popularity;
@property (nonatomic, copy) NSNumber *short_comments;
@property (nonatomic, copy) NSNumber *comments;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)extrainformationWithDic:(NSDictionary *)dic;
+ (void)extrainformationWithStoryid:(NSString *)Storyid Success:(void(^)(ExtraInformation *extrainformation))success Error:(void(^)(void))error;


@end

NS_ASSUME_NONNULL_END
