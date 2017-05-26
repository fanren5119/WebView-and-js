//
//  ViewController.m
//  WebViewTest
//
//  Created by 王磊 on 2017/5/23.
//  Copyright © 2017年 wanglei. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@protocol JSTestExport <JSExport>

- (void)takePhoto:(NSString *)token;
- (void)sendPost:(NSDictionary *)dict;

@end

@interface ViewController () <UIWebViewDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, JSTestExport>

@property (strong, nonatomic)  UIWebView *webView;
@property (nonatomic, strong) NSString *token;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    context[@"iosDelegate"] = self;
    context.exceptionHandler = ^(JSContext *context, JSValue *exceptionValue) {
        context.exception = exceptionValue;
    };
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    NSData *data = UIImageJPEGRepresentation(image, 0.01);
    [self dismissViewControllerAnimated:YES completion:nil];


    NSString *imageData = [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithCarriageReturn];
    imageData = [NSString stringWithFormat:@"data:image/jpeg;base64,%@", imageData];
    
    JSContext *context = [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    JSValue *jsValue = context[@"setImageWithData"];
    NSArray *arguments = @[@{@"image": imageData, @"id": self.token}];
    [jsValue callWithArguments:arguments];
}


- (void)takePhoto:(NSString *)token;
{
    self.token = token;
    dispatch_async(dispatch_get_main_queue(), ^{
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        }
        imagePicker.videoQuality = UIImagePickerControllerQualityTypeLow;
        imagePicker.delegate = self;
        [self presentViewController:imagePicker animated:YES completion:nil];
    });
}

- (void)sendPost:(NSDictionary *)dict
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:dict[@"message"] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
