## 一、WebView简介
        现在很多app要求某些界面可以随时更新，WebView用的也越来越多；而ios的webView也有两种，
    一种是UIWebView，另一种是WKWebView；WkWebView是ios8.0之后开放的API，想比与UIWebView，
    它有更多的优点。

## 二、WKWebView的优点
* WKWebView的内存远远没有UIWebView的开销大,而且没有缓存
* 拥有高达60FPS滚动刷新率及内置手势
* 支持了更多的HTML5特性
* 高效的app和web信息交换通道
* 允许JavaScript的Nitro库加载并使用,UIWebView中限制了
* WKWebView目前缺少关于页码相关的API
* 提供加载网页进度的属性

## 三、WKWebView的缺点
* UIWebView可以使用NSURLProtocol来做页面缓存，而WKWebView不行；

## 四、oc与js交互
    WebView与js交互的方式有很多，有第三方的一些SDK，如Cordova、HBuilder等，还有一些第三方的库，如
WebViewJavaScriptBridge等，而本章只介绍如何使用原始的方法与js进行交互；
    ps：UIWebView与js交互：WebViewTest
    ps: WKWebView与js交互：WKWebViewTest
