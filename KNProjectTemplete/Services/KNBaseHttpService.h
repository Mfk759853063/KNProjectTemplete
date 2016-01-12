//
//  HZBaseHttpService.h
//  HZDLHuiXianXia
//
//  Created by hzdlapple2 on 15/10/24.
//  Copyright (c) 2015年 hzdlapple2. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "KNNetworkManager.h"

@interface KNBaseHttpService : NSObject

- (void)postUrl:(NSString *)url
          parms:(NSDictionary *)parms
       completeHandler:(void(^)(KNHTTPReturnCode code,id responseObject))completeHandler;

- (void)postUrl:(NSString *)url
          parms:(NSDictionary *)parms
       complete:(void(^)(KNHTTPReturnCode code,AFHTTPRequestOperation *operation,id responseObject))complete;

@end