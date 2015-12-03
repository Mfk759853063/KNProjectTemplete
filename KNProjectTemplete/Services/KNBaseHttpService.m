//
//  HZBaseHttpService.m
//  HZDLHuiXianXia
//
//  Created by hzdlapple2 on 15/10/24.
//  Copyright (c) 2015年 hzdlapple2. All rights reserved.
//

#import "KNBaseHttpService.h"

@implementation KNBaseHttpService

- (void)postUrl:(NSString *)url parms:(NSDictionary *)parms complete:(void(^)(KNHTTPReturnCode code,AFHTTPRequestOperation *operation,id responseObject))complete
{
    [[KNNetworkManager sharedManager] POST:url parameters:parms success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        complete?complete(KNHTTPReturnSuccess,operation,responseObject):nil;
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        complete?complete(KNHTTPReturnError,operation,error):nil;
    }];
}

@end
