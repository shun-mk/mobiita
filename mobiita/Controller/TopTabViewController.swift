//
//  TopTabViewController.swift
//  mobiita
//
//  Created by 三木俊作 on 2016/11/27.
//  Copyright © 2016年 Shunsaku Miki. All rights reserved.
//

import UIKit

class TopTabViewController: UITabBarController {
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSelectArticleHandler()
        guard let newArticleListVc = self.viewControllers?[0] as? NewArticleListViewController else {
            return
        }
        newArticleListVc.selectArticleHandler = self.selectArticleHandler
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    
    
    /// 記事選択ハンドラー処理
    private func setSelectArticleHandler() {
        self.selectArticleHandler = { url in
            self.performSegue(withIdentifier: "toWebViewController", sender: url)
        }
    }
    
    // MARK: - override
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toWebViewController" {
            guard let vc = segue.destination as? WebViewController,
                  let url = sender as? String else {
                    return
            }
            vc.url = url
        }
    }
    
    /** 記事選択ハンドラー処理 */
    var selectArticleHandler: ((_ url: String) -> ())?
}
