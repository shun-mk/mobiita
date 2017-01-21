//
//  WebViewController.swift
//  mobiita
//
//  Created by Shunsaku Miki on 2017/01/09.
//  Copyright © 2017年 Shunsaku Miki. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.webViewContainer.loadUrl(url ?? "")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var webViewContainer: WebViewContainerView!

    /** URL文字列 */
    var url: String?
}
