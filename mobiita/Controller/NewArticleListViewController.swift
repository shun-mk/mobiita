//
//  NewArticleListViewController.swift
//  mobiita
//
//  Created by 三木俊作 on 2016/11/27.
//  Copyright © 2016年 Shunsaku Miki. All rights reserved.
//

import UIKit

class NewArticleListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.exeGetPostingItemListApi()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - API
    
    /// 新着投稿取得API実行
    private func exeGetPostingItemListApi() {
        self.dataContainer.fetchData(page: "1", perPage: "20", query: nil) { (result) in
            switch result {
            case .success:
                self.tableView.reloadData()
            case .failed:
                break
            }
        }
    }
    
    
    /// 新着投稿追加取得API実行
    ///
    /// - Parameter page: ページ
    private func exeGetAdditionalPostingItemListAPi(page: Int) {
        self.dataContainer.fetchAdditionalData(page: page.description, perPage: "20", query: nil) { (result) in
            switch result {
            case .success:
                self.tableView.reloadData()
            case .failed:
                break
            }
        }
    }
    
    // MARK: - Delegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostingItemTableViewCell = self.tableView.dequeueReusableCell(for: indexPath)
        cell.setData(data: self.dataContainer.modelList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataContainer.modelList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectArticleHandler?(self.dataContainer.modelList[indexPath.row].url)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView.contentOffset.y >= (self.tableView.contentSize.height - self.tableView.bounds.size.height) {

        }
    }
    

    // MARK: - Private Methods
    
    /// UI初期化
    private func initUI() {
        self.tableView.frame.size.width = self.view.frame.width
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 20
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.register(PostingItemTableViewCell.self)
    }
    
    // MARK: - Property
    
    @IBOutlet weak var tableView: UITableView!
    /** データコンテナ */
    var dataContainer: PostingItemModelContainer = PostingItemModelContainer()
    /** 記事選択ハンドラー */
    var selectArticleHandler: ((_ url: String) -> ())?
    
}
