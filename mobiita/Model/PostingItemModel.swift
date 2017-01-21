//
//  PostingItemModel.swift
//  mobiita
//
//  Created by 三木俊作 on 2016/11/29.
//  Copyright © 2016年 Shunsaku Miki. All rights reserved.
//

import Foundation

struct PostingItemModel: BaseModelProtocol {
    
    // MARK: - initialize
    
    init?(data: [String: Any]) {
        guard let updateDate = data["updated_at"] as? String,
              let title = data["title"] as? String,
              let id = data["id"] as? String,
              let url = data["url"] as? String else {
            return nil
        }
        self.updateDate = updateDate
        self.title = title
        self.id = id
        self.url = url
    }
    
    // MARK: - property
    
    /** 最終更新日 */
    let updateDate: String
    /** 記事タイトル */
    let title: String
    /** 投稿者ID */
    let id: String
    /** URL */
    let url: String
    
}
