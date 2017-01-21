//
//  WebViewContainerView.swift
//  mobiita
//
//  Created by 三木俊作 on 2017/01/09.
//  Copyright © 2017年 Shunsaku Miki. All rights reserved.
//

import UIKit
import WebKit

class WebViewContainerView: UIView {
    
    // MARK: - override
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.initWebView()
    }
    
    // MARK: - Methods
    
    
    /// URL読み込み
    ///
    /// - Parameter url: URL
    func loadUrl(_ url: String) {
        guard let url = URL(string: url) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        self.webView.load(urlRequest)
    }
    
    
    /// WebView生成から配置までの処理を一纏めにした関数
    private func initWebView() {
        self.webView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(self.webView)
        
        // AutoLayoutをコードから生成
        self.webView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.webView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.webView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        self.webView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    // MARK: - property
    
    /** WebView */
    var webView: WKWebView = WKWebView()

}
