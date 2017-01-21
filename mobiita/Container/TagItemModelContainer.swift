//
//  TagItemModelContainer.swift
//  mobiita
//
//  Created by 三木俊作 on 2017/01/02.
//  Copyright © 2017年 Shunsaku Miki. All rights reserved.
//

import UIKit

class TagItemModelContainer: BaseContainer<TagItemModel> {
    
    // MARK: - Methods
    
    
    /// データ取得
    ///
    /// - Parameters:
    ///   - page: ページ
    ///   - perPage: リクエスト要素数
    ///   - query: クエリ
    ///   - completion: データ取得完了後コールバック
    func featchData(_ page: String?, perPage: String?, sort: String?, completionHandler: @escaping connectionResultHandler) {
        ConnectionManager.sharedInstance.getTagListApi(page: page, perPage: perPage, sort: sort) { (data) in
            if data.result.isSuccess {
                guard let data = data.result.value as? [[String: Any]] else {
                    completionHandler(.failed)
                    return
                }
                data.forEach({
                    guard let tagItemModel = TagItemModel(data: $0) else {
                        return
                    }
                    self.modelList.append(tagItemModel)
                })
                completionHandler(.success)
            } else {
                completionHandler(.failed)
            }
        }
    }
    
}
