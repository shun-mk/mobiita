//
//  WebViewController.swift
//  mobiita
//
//  Created by Shunsaku Miki on 2017/01/09.
//  Copyright © 2017年 Shunsaku Miki. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    /** Progress */
    var progressView = UIProgressView()
    /** ローディングキー */
    let kLoading = "loading"
    /** プログレスキー */
    let kEstimatedProgress = "estimatedProgress"
    
    // MARK: - Methods
    
    /**
     プログレスバー生成
     */
    private func genProgressBar() {
        self.progressView = UIProgressView(frame: CGRect(x: 0, y: self.navigationController!.navigationBar.frame.size.height - 2, width: self.view.frame.size.width, height: 10))
        self.progressView.progressViewStyle = .bar
        self.navigationController?.navigationBar.addSubview(self.progressView)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.webViewContainer.webView.addObserver(self, forKeyPath: kLoading, options: .new, context: nil)
        self.webViewContainer.webView.addObserver(self, forKeyPath: kEstimatedProgress, options: .new, context: nil)
        self.genProgressBar()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.webViewContainer.loadUrl(url ?? "")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == kEstimatedProgress {
            self.progressView.setProgress(Float(self.webViewContainer.webView.estimatedProgress), animated: true)
        } else if keyPath == kLoading {
            UIApplication.shared.isNetworkActivityIndicatorVisible = self.webViewContainer.webView.isLoading
            if self.webViewContainer.webView.isLoading {
                self.progressView.setProgress(0.1, animated: true)
            } else {
                self.progressView.setProgress(0.0, animated: false)
            }
        } else {
            self.progressView.setProgress(0.0, animated: false)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        self.progressView.removeFromSuperview()
    }
    
    deinit {
        self.webViewContainer.webView.removeObserver(self, forKeyPath: kEstimatedProgress)
        self.webViewContainer.webView.removeObserver(self, forKeyPath: kLoading)
    }
    
    @IBOutlet weak var webViewContainer: WebViewContainerView!
    
    /** URL文字列 */
    var url: String?
}
