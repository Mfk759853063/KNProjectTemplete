//
//  KNTestService.m
//  KNProjectTemplete
//
//  Created by hzdlapple2 on 16/1/20.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import "KNTestService.h"

@implementation KNTestService

- (void)requestTestAPI:(NSString *)urlPath parms:(NSDictionary *)parms success:(KNSuccess)success faild:(KNFaild)faild {
    [self getWithMaskType:KNHttpRequestMaskNormal showingMessage:@"" url:urlPath parms:parms success:success faild:faild];
}

@end
