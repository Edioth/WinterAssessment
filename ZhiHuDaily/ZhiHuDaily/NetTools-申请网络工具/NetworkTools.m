//
//  NetworkTools.m
//  WangYiNews
//
//  Created by Edioth Jin on 2021/2/22.
//

#import "NetworkTools.h"

@implementation NetworkTools

+ (instancetype)sharedManagerWithBaseURL:(NSURL *)baseURL {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        //请求地址的根地址
        NSURL *baseUrl = baseURL;
        NSURLSessionConfiguration *configutation = [NSURLSessionConfiguration defaultSessionConfiguration];
        //配置超时时长
        configutation.timeoutIntervalForRequest = 15;
        //添加配置
        instance = [[self alloc] initWithBaseURL:baseUrl sessionConfiguration:configutation];
    });
    return instance;
}
@end
