//
//  KNNetworkManager.h
//  KNProjectTemplete
//
//  Created by kwep_vbn on 15/12/3.
//  Copyright © 2015年 vbn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface KNNetworkManager : AFHTTPRequestOperationManager

+ (instancetype)sharedManager;


@end
