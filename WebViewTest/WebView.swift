//
//  GoswWebView.swift
//  WebViewTest
//
//  Created by Stefan Großmann on 14.11.20.
//

import SwiftUI
import WebKit

class WKRedirectWebView : WKWebView {}

extension WKRedirectWebView : WKUIDelegate {
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Swift.Void) {
            if(navigationAction.navigationType == .other) {
                if navigationAction.request.url != nil {
                    self.load(navigationAction.request)
                }
                decisionHandler(.cancel)
                return
            }
            decisionHandler(.allow)
        }
}

struct WebView : UIViewRepresentable {
    let request: URLRequest
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKRedirectWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}

struct WebView_Previews : PreviewProvider {
    static var previews: some View {
        WebView(request: URLRequest(url: URL(string: "http://www.gosw.de")!))
    }
}

