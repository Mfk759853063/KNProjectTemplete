//
//  KNNetworkManager.m
//  KNProjectTemplete
//
//  Created by kwep_vbn on 15/12/3.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import "KNNetworkManager.h"
#import "ApiDefines.h"

@implementation KNNetworkManager

+ (instancetype)sharedManager{
    
    static KNNetworkManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:API_URL_PREFIX]];
    });
    return sharedManager;
}

- (instancetype)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    [self.requestSerializer setTimeoutInterval:60.0f];
//    self.responseSerializer = [AFJSONResponseSerializer serializer];
    self.responseSerializer.acceptableContentTypes = [NSSet
                    setWithObjects:@"application/json", @"text/html", @"text/plain", nil];
    
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    securityPolicy.allowInvalidCertificates = YES;
    self.securityPolicy = securityPolicy;
    [[AFNetworkReachabilityManager sharedManager]
     setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
         NSLog(@"Reachability: %@",
               AFStringFromNetworkReachabilityStatus(status));
         switch (status) {
             case AFNetworkReachabilityStatusReachableViaWWAN:
             case AFNetworkReachabilityStatusReachableViaWiFi:
                 break;
             case AFNetworkReachabilityStatusNotReachable:
             case AFNetworkReachabilityStatusUnknown:
                 break;
         }
     }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    return self;
}

@end
