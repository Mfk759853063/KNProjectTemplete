//
//  HZBaseHttpService.h
//  HZDLHuiXianXia
//
//  Created by hzdlapple2 on 15/10/24.
//  Copyright (c) 2015年 hzdlapple2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KNNetworkManager.h"

// 接口错误的描述,使用于error.userInfo[KNInterfaceErrorDescription]
extern const NSString *KNInterfaceErrorDescription;
// 接口错误的代码,使用于error.userInfo[KNInterfaceErrorCodeDescription]
extern const NSString *KNInterfaceErrorCodeDescription;
// 如果错误代码等于KNInterfaceErrorCode说明是接口错误
extern const NSInteger KNInterfaceErrorCode;

typedef void(^KNSuccess)(id operation,id response);
typedef void(^KNFaild)(NSError *error,id operation);

typedef enum : NSUInteger {
    KNHttpRequestMaskNone = 1, // 不使用MBProgressView
    KNHttpRequestMaskDimBackground, //遮罩不能点击
    KNHttpRequestMaskNormal,// 正常
} KNHttpRequestMask;

@interface KNBaseHttpService : NSObject

@property (assign, nonatomic) BOOL debugLog;

/*!
 *  GET 方法
 *
 *  @param mask    是否显示loadingView及类型
 *  @param message 显示的提示文本
 */
- (void)getWithMaskType:(KNHttpRequestMask)mask
                    showingMessage:(NSString *)message
                    url:(NSString *)urlPath
                  parms:(NSDictionary *)parms
                success:(KNSuccess)success faild:(KNFaild)faild;
/*!
 *  POST 方法
 *
 *  @param mask    是否显示loadingView及类型
 *  @param message 显示的提示文本
 */
- (void)postWithMaskType:(KNHttpRequestMask)mask
         showingMessage:(NSString *)message
                    url:(NSString *)urlPath
                  parms:(NSDictionary *)parms
                success:(KNSuccess)success faild:(KNFaild)faild;

@end