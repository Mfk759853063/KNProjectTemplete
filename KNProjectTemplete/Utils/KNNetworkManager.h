//
//  KNNetworkManager.h
//  KNProjectTemplete
//
//  Created by kwep_vbn on 15/12/3.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

/**
 *  网络返回类型
 */
typedef NS_ENUM(NSUInteger, KNHTTPReturnCode){
    /**
     *  成功
     */
    KNHTTPReturnSuccess,
    /**
     *  失败
     */
    KNHTTPReturnFiled,
    /**
     *  错误
     */
    KNHTTPReturnError,
};

@interface KNNetworkManager : AFHTTPRequestOperationManager

+ (instancetype)sharedManager;


@end
