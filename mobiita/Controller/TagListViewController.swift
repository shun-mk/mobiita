//
//  TagListViewController.swift
//  mobiita
//
//  Created by 三木俊作 on 2016/11/27.
//  Copyright © 2016年 Shunsaku Miki. All rights reserved.
//

import UIKit

class TagListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.exeGetTagItemApi()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - API
    
    /// タグ取得Api実行
    private func exeGetTagItemApi() {
        self.dataContainer.featchData("1", perPage: "20", sort: "count") { (result) in
            switch result {
            case .success:
                self.tableView.reloadData()
            case .failed :
                break
            }
        }
    }
    
    // MARK: - Methods
    
    /// UI初期処理
    private func initUI() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 45
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.register(TagItemTableViewCell.self)
    }
    
    // MARK: - Delegate
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TagItemTableViewCell = self.tableView.dequeueReusableCell(for: indexPath)
        cell.setData(data: self.dataContainer.modelList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataContainer.modelList.count
    }
    
    // MARK: - Property
    
    /** TableView */
    @IBOutlet weak var tableView: UITableView!
    /** データ保持インスタンス */
    var dataContainer: TagItemModelContainer = TagItemModelContainer()
}
