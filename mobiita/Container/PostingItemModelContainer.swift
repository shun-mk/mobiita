//
//  PostingItemModelContainer.swift
//  mobiita
//
//  Created by 三木俊作 on 2016/12/10.
//  Copyright © 2016年 Shunsaku Miki. All rights reserved.
//

import UIKit

class PostingItemModelContainer: BaseContainer<PostingItemModel> {
    
    // MARK: - Methods
    
    /// データ取得
    ///
    /// - Parameter dataLoadResultHandler: 通信完了コールバック
    func fetchData(page: String?, perPage: String?, query: String?, completionHandler: @escaping connectionResultHandler) {
        ConnectionManager.sharedInstance.getItemListApi(page: page, perPage: perPage, query: query, completionHandler: { data in
            if data.result.isSuccess {
                guard let data = data.result.value as? [[String: Any]] else {
                    completionHandler(.failed)
                    return
                }
                data.forEach({
                    guard let postingItemModel = PostingItemModel(data: $0) else {
                        return
                    }
                    self.modelList.append(postingItemModel)
                })
                completionHandler(.success)
            } else {
                completionHandler(.failed)
            }
        })
    }
    
    
    /// 追加データ取得
    ///
    /// - Parameters:
    ///   - page: ページ
    ///   - perPage: 要素数
    ///   - query: クエリ
    ///   - completionHandler: 通信完了後コールバック
    func fetchAdditionalData(page: String?, perPage: String?, query: String?, completionHandler: @escaping connectionResultHandler) {
        ConnectionManager.sharedInstance.getItemListApi(page: page, perPage: perPage, query: query) { (data) in
            if data.result.isSuccess {
                guard let data = data.result.value as? [[String: Any]] else {
                    completionHandler(.failed)
                    return
                }
                data.forEach({
                    guard let PostingItemModel = PostingItemModel(data: $0) else {
                        return
                    }
                    self.modelList.append(PostingItemModel)
                })
                completionHandler(.success)
            } else {
                completionHandler(.failed)
            }
        }
    }
}
