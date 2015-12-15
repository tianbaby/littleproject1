//
//  main.m
//  OC06
//
//  Created by 田月 on 15/12/14.
//  Copyright © 2015年 田月. All rights reserved.
//
/**

 */
void buyMovieTicket();
void buyConcertTicket();
#import <Foundation/Foundation.h>
#import "Common.h"
#import "Cinema.h"
#import "Movieticket.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("请输入您想购买票的票种：1🎥电影票 2📡演唱会票");
        int num;
        scanf("%d",&num);
        if (num == 1) {
            buyMovieTicket();
        }else if (num == 2){
            buyConcertTicket();
        }else{
            NSLog(@"只接受输入1，2哦");
        }
 
        
    }
    return 0;
}
void buyMovieTicket(){
    printf("📺想看什么电影呢？\n");
    Cinema * wanda = [Cinema new];
    [wanda buyTicket];
    
}
void buyConcertTicket(){
    printf("🎶想看谁的演唱会呢？\n");
}

