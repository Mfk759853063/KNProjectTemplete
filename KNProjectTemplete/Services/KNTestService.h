//
//  KNTestService.h
//  KNProjectTemplete
//
//  Created by hzdlapple2 on 16/1/20.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import "KNBaseHttpService.h"

@interface KNTestService : KNBaseHttpService


- (void)requestTestAPI:(NSString *)urlPath parms:(NSDictionary *)parms success:(KNSuccess)success faild:(KNFaild)faild;

@end
