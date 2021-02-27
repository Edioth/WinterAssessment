//
//  NetworkTools.h
//  WangYiNews
//
//  Created by Edioth Jin on 2021/2/22.
//

#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetworkTools : AFHTTPSessionManager

+ (instancetype)sharedManagerWithBaseURL:(NSURL *)baseURL;

@end

NS_ASSUME_NONNULL_END
