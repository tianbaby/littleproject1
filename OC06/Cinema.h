//
//  Cinema.h
//  OC06
//
//  Created by 田月 on 15/12/14.
//  Copyright © 2015年 田月. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Movieticket.h"
@interface Cinema : NSObject
{
    // 用来存放 电影院中的 一堆电影票
    Movieticket *_arr[5];
}
//开始购票
- (void)buyTicket;

//提供影视讯息
- (void)showList;

//选择电影
- (void)selectMovie;

//展示座位并选择
- (void)selectSeat;

- (void)pay;
//提供出票信息和座位信息
- (void)show;

@end
