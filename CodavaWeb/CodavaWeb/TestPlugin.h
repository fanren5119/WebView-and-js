//
//  TestPlugin.h
//  CodavaWeb
//
//  Created by freshera on 2020/4/23.
//  Copyright © 2020 wiseinfoiotDev. All rights reserved.
//

#import <Cordova/CDV.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestPlugin : CDVPlugin

- (void)test:(CDVInvokedUrlCommand *)command;

@end

NS_ASSUME_NONNULL_END
