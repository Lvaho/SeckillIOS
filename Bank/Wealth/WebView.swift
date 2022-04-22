//
//  WebView.swift
//  Bank
//
//  Created by 金慕煙 on 2022/4/10.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let url: URL?
    
    func makeUIView(context: Context) -> WKWebView { //实现协议里的makeUIView方法，用来初始化并返回一个WKWebView网页视图对象
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let config = WKWebViewConfiguration()
        config.defaultWebpagePreferences = prefs
        return WKWebView(
            frame: .zero,
            configuration: config
        )
    }
        
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let myURL = url else {
            return
        }
        //实现协议里的updateUIView方法，用来设置网页视图需要加载的网址参数
        //URL(string: "http://web.keepwork.xyz:8080/deposit/toDeposit")!
        //var url = "http://web.keepwork.xyz:8080/deposit/toDeposit"
        let webrequest = URLRequest(url: myURL)
        //初始化一个URLRequest对象，作为网页视图的网址
        let UIWeb = UIWebView.init(frame: UIScreen.main.bounds)
        UIWeb.loadRequest(webrequest)
        //通过load方法，使网页视图加载该网址对应的网页
    }
}

