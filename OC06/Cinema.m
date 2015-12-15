//
//  Cinema.m
//  OC06
//
//  Created by 田月 on 15/12/14.
//  Copyright © 2015年 田月. All rights reserved.
//

#import "Cinema.h"

@implementation Cinema
{
    int _theNum;    //用来保存用户选择的电影票的编号
}
//重写 init方法 来给电影院 默认一些电影票的赋值信息
- (id)init{
    self = [super init];
    
    if (self) {
        //初始化电影票信息
        for (int i = 0; i < 5 ; i++) {
            //创建电影票的并放入 数组
            Movieticket *t = [Movieticket new];
            t.name = [NSString stringWithFormat:@"隔壁老王的奋斗史%d",i+1];
            t.longTime = @"120分钟";
            t.actors = [NSString stringWithFormat:@"张%d丰和老王",i+1];
            t.beginTime = [NSString stringWithFormat:@"20:%02d",i+2];
            
            t.price = 99;
            t.actionTime = [NSString stringWithFormat:@"2015-12-%02d",i+2];
            t.movieNum = i+1;
            _arr[i]=t;
            
        }
    }
    return  self;
}
- (void)buyTicket{
    NSLog(@"开始购票");
    [self showList];
}

//提供影视讯息
- (void)showList{
    NSLog(@"展示影讯");
    
    for (int i = 0 ;  i < 5 ; i++) {
        Movieticket * t = _arr[i];
        NSLog(@"\n编号：%d\n名称：%@,时长：%@,主演：%@\n,上映时间：%@,开始时间：%@,票价:%d\n\n",t.movieNum,t.name,t.longTime,t.actors,t.actionTime,t.beginTime,t.price);
    }
    [self selectMovie];
}

//选择电影
- (void)selectMovie{
    NSLog(@"选择电影");
    printf("请输入电影的编号 ");
    int num;
    scanf("%d",&num);
    if ( num<1 || num>5) {
        printf("有病么");
        return;
    }
    
    NSLog(@"您选择的电影是 %@",_arr[num-1].name);
    _theNum = num - 1;
    [self selectSeat];
}

//展示座位并选择
- (void)selectSeat{
    
    NSLog(@"选择座位");
    //打印矩形
    for (int i = 0 ; i < 4; i++) {      //打印行
        for (int j = 0  ; j < 5 ; j++)  //打印列
        {
            if(i == 0){
                printf("%02d\t",j);
            }else if(j == 0){
                printf("%02d\t",i);
            }else{
            printf("+\t");
            }
        }
        printf("\n");
    }
    int row,col;
    printf("请选择行数，列数 例如3，4");
    scanf("%d,%d",&row,&col);
    
//    if (i == row && j == col) {
//        printf("-\t");
//    }
//    for (int i = 0 ; i < 4; i++) {      //打印行
//        for (int j = 0  ; j < 5 ; j++)  //打印列
//        {
//            if(i == 0){
//                printf("%02d\t",j);
//            }else if(j == 0){
//                printf("%02d\t",i);
//            }else if(i == row && j == col){
//                printf("-\t");
//            }else{
//                printf("+\t");
//            }
//        }
//        printf("\n");
//    }
    NSLog(@"\n购票信息：片名：%@，开始时间：%@ \n 座位信息%d排%d列",_arr[_theNum].name,_arr[_theNum].beginTime,row,col);
    printf("请确认信息：1.确认 0.取消");
    int user;
    scanf("%d",&user);
    if (user == 1) {
        _arr[_theNum].row = row;
        _arr[_theNum].col = col;
        [self pay];
    }else{
        printf("完事儿了\n");
    }
    
   
}

- (void)pay{
    NSLog(@"正在支付...");
    NSLog(@"支付成功！！！");
    [self show];
}
//提供出票信息和座位信息
- (void)show{
    //展示票信息
    Movieticket *t = _arr[_theNum];
    NSLog(@"\n恭喜你购票成功：\n: %@\n开始时间： %@\n排号%d列号%d 票价：%d\n\n",t.name,t.beginTime,t.row,t.col,t.price);
    for (int i = 0; i<4; i++) {
        for (int j = 0; j<5; j++) {
            if ( i == 0) {
                printf("%02d\t",j);
            }else if( j == 0){
                printf("%02d\t",i);
            }else if(i == t.row && j == t.col){
                printf("-\t");
            }
            else {
                printf("+\t");
            }
        }
        printf("\n");
    }
    NSLog(@"出票");
}

@end
