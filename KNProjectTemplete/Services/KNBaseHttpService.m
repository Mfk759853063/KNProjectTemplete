//
//  HZBaseHttpService.m
//  HZDLHuiXianXia
//
//  Created by hzdlapple2 on 15/10/24.
//  Copyright (c) 2015年 hzdlapple2. All rights reserved.
//

#import "KNBaseHttpService.h"
#import "ApiDefines.h"
#import "MBProgressHUD.h"

const NSString *KNInterfaceErrorDescription = @"interfaceErrorKey";
const NSString *KNInterfaceErrorCodeDescription = @"interfaceErrorCode";
const NSInteger KNInterfaceErrorCode = 1024;

@implementation KNBaseHttpService

- (instancetype)init {
    self = [super init];
    if (self) {
        self.debugLog = YES;
    }
    return self;
}

- (MBProgressHUD *)showHudWithMaskType:(KNHttpRequestMask)mask message:(NSString *)message {
    MBProgressHUD *hud = nil;
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    if (mask == KNHttpRequestMaskNormal) {
        hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
    } else if (mask == KNHttpRequestMaskDimBackground) {
        hud = [MBProgressHUD showHUDAddedTo:keyWindow animated:YES];
        hud.dimBackground = YES;
    }
    hud.labelText = message;
    return hud;
}

- (void)postWithMaskType:(KNHttpRequestMask)mask
          showingMessage:(NSString *)message
                     url:(NSString *)urlPath
                 parms:(NSDictionary *)parms
            success:(KNSuccess)success faild:(KNFaild)faild {
    MBProgressHUD *hud = [self showHudWithMaskType:mask message:message];
    [[KNNetworkManager sharedManager] POST:urlPath parameters:parms success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [self dealWithHud:hud successHandler:success faildHandler:faild operation:operation response:responseObject error:nil];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        [self dealWithHud:hud successHandler:success faildHandler:faild operation:operation response:nil error:error];
        if (self.debugLog) {
            NSLog(@"requestUrl:%@\nparms:%@\nerror:%@\n",urlPath,parms,error);
        }
    }];
}

- (void)getWithMaskType:(KNHttpRequestMask)mask
          showingMessage:(NSString *)message
                     url:(NSString *)urlPath
                   parms:(NSDictionary *)parms
                 success:(KNSuccess)success faild:(KNFaild)faild {
    MBProgressHUD *hud = [self showHudWithMaskType:mask message:message];
    [[KNNetworkManager sharedManager] GET:urlPath parameters:parms success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        [self dealWithHud:hud successHandler:success faildHandler:faild operation:operation response:responseObject error:nil];
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        [self dealWithHud:hud successHandler:success faildHandler:faild operation:operation response:nil error:error];
        if (self.debugLog) {
            NSLog(@"requestUrl:%@\nparms:%@\nerror:%@\n",urlPath,parms,error);
        }
    }];
}

- (void)dealWithHud:(MBProgressHUD *)hud successHandler:(KNSuccess)successHandler faildHandler:(KNFaild)faildHander operation:(AFHTTPRequestOperation *)operation response:(id)responseObject error:(NSError *)error {
    if (error) {
        hud.mode = MBProgressHUDModeText;
        hud.labelText = @"网络请求出错";
        [hud hide:YES afterDelay:1.6];
        if (faildHander) {
            faildHander(error,operation);
        }
        
    } else {
        if (!successHandler || !faildHander) {
            [hud hide:YES afterDelay:0];
            return ;
        }
        NSInteger code = [responseObject[@"resultCode"] integerValue];
        if (code == 0) {
            successHandler(operation,responseObject);
            [hud hide:YES afterDelay:0];
        } else {
            NSError *error = [self generateErrorWithCode:code];
            NSDictionary *userInfo = error.userInfo;
            faildHander(error,operation);
            hud.mode = MBProgressHUDModeText;
            hud.labelText = userInfo[KNInterfaceErrorDescription];
            [hud hide:YES afterDelay:1.6];
        }
    }
}

- (NSError *)generateErrorWithCode:(NSInteger)code {
    NSDictionary *userInfo = @{KNInterfaceErrorDescription:@"接口错误",
                               KNInterfaceErrorCodeDescription:@(code)};
    return [NSError errorWithDomain:API_URL_DOMAIN code:KNInterfaceErrorCode userInfo:userInfo];
}

@end
