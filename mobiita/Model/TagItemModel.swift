//
//  TagItemModel.swift
//  mobiita
//
//  Created by 三木俊作 on 2016/12/31.
//  Copyright © 2016年 Shunsaku Miki. All rights reserved.
//

import Foundation

struct TagItemModel: BaseModelProtocol {
    
    // MARK: - Initialize
    
    init?(data: [String: Any]) {
        guard let followersCount = data["followers_count"] as? Int,
              let id = data["id"] as? String,
              let itemsCount = data["items_count"] as? Int else {
                return nil
        }
        self.followersCount = followersCount
        self.iconUrl = data["icon_url"] as? String
        self.id = id
        self.itemsCount = itemsCount
    }
    
    
    // MARK: - Property
    
    /** フォロー数 */
    let followersCount: Int
    /** アイコン画像URL */
    let iconUrl: String?
    /** ID */
    let id: String
    /** アイテム数 */
    let itemsCount: Int
}
