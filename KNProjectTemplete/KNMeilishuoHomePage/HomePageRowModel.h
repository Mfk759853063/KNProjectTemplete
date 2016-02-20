//
//  HomePageRowModel.h
//  KNProjectTemplete
//
//  Created by kwep_vbn on 16/2/20.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RowDesc : NSObject

@property (nonatomic,copy) NSString *type;
@property (nonatomic,copy) NSString *bg_color;
@property (assign, nonatomic) CGFloat height;
@property (nonatomic,copy) NSString *column;

@end


@interface HomePageModel : NSObject

@property(nonatomic,copy) NSString *pic_url;
@property (nonatomic,copy) NSString *pic_width;
@property (nonatomic,copy) NSString *pic_height;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *title;

@end



@interface HomePageRowModel : NSObject

@property (strong, nonatomic) RowDesc *desc;
@property (strong, nonatomic) NSArray *data;


@end
