//
//  ViewController.m
//  RequestDemo01
//
//  Created by student on 16/3/11.
//  Copyright © 2016年 Sunny. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>
@property (nonatomic,retain) NSMutableData *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    怎么发送一个请求
    NSString *string = @"http://www.baidu.com";
    NSURL *url = [NSURL URLWithString:string];
//  NSURLRequest  创建请求类
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//  NSURLConnection  建立链接
    [NSURLConnection connectionWithRequest:request delegate:self];
    NSLog(@"123456789");
    
    
    
    
//    这是一个异步请求
//    NSString *urlString = @"www.baidu.com";
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
////    queue 队列
//    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
//    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
//        NSLog(@"%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
//    }];
//    发送一个同步请求
//    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.baidu.com"]];
//    NSURLResponse * response = nil;
//   NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
//    NSData *data = [NSData data];
}
/*
 Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file.
 2016-03-11 11:14:57.952 RequestDemo01[3418:1051593] -[ViewController connection:didFailWithError:]
 是因为在iOS9之后安全加强
*/
#pragma  mark ---请求失败的时候会调用这个方法
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"%s",__FUNCTION__);
    
}
#pragma  mark ---接收响应的时候调用这个方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"一一一%s",__FUNCTION__);
    self.data = [NSMutableData data];
//    Receive 接收接纳  Response响应 反应 回应
}
#pragma  mark ---接收响应数据时候会调用这个方法，这个方法会调用多次
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
//    append 附加
    [self.data appendData:data];
    NSLog(@"二二二%s",__FUNCTION__);
}
#pragma  mark ---在接收数据完成时候会调用这个方法
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"三三三%s",__FUNCTION__);
//    NSLog(@"————————》》》》》%@",self.data);
//    把data转化成字符串
    NSString *string = [[NSString alloc]initWithData:self.data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",string);
    [string release];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
