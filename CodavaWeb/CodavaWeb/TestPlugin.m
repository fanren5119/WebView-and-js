//
//  TestPlugin.m
//  CodavaWeb
//
//  Created by freshera on 2020/4/23.
//  Copyright © 2020 wiseinfoiotDev. All rights reserved.
//

#import "TestPlugin.h"

@implementation TestPlugin

- (void)test:(CDVInvokedUrlCommand *)command
{
    CDVPluginResult *okResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    
    CDVPluginResult *errorResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
    NSString *content = [NSString stringWithFormat:@"%@", command.arguments.firstObject];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:content preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self.commandDelegate sendPluginResult:okResult callbackId:command.callbackId];
    }];
    [alert addAction:ok];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [self.commandDelegate sendPluginResult:errorResult callbackId:command.callbackId];
    }];
    [alert addAction:cancel];
    [UIApplication.sharedApplication.keyWindow.rootViewController presentViewController:alert animated:YES completion:nil];
    
}

@end
