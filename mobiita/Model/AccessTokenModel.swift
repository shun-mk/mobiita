//
//  AccessTokenModel.swift
//  mobiita
//
//  Created by Shunsaku Miki on 2017/06/25.
//  Copyright © 2017年 Shunsaku Miki. All rights reserved.
//

import UIKit

class AccessTokenModel: BaseModelProtocol {
    
    
    /// データ取得
    ///
    /// - Parameters:
    ///   - clientId: clientId
    ///   - clientSecret: clientSecret
    ///   - code: code
    ///   - completionHandler: 完了ハンドラ
    func fetchData(clientId: String, clientSecret: String, code: String, completionHandler: @escaping ConnectionResultHandler) {
        ConnectionManager.sharedInstance.getAccessToken(clientId: clientId, clientSecret: clientSecret, code: code) { (data) in
            
            guard data.result.isSuccess else {
                completionHandler(.failed)
                return
            }
            
            guard let data = data.result.value as? [String: Any] else {
                completionHandler(.failed)
                return
            }
            
            guard let accessToken = data["token"] as? String else {
                completionHandler(.failed)
                return
            }
            UserDefaults.standard.accessToken = accessToken
            completionHandler(.success)
        }
    }
}
