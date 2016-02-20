//
//  UIColor+Addtions.m
//  KNProjectTemplete
//
//  Created by kwep_vbn on 16/2/20.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import "UIColor+Addtions.h"

@implementation UIColor (Addtions)

+(UIColor*)colorWithHex:(long)hexColor alpha:(float)opacity {
    
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

+(UIColor*)colorWithHex:(long)hexColor{
    
    return [UIColor colorWithHex:hexColor alpha:1];
}

@end
