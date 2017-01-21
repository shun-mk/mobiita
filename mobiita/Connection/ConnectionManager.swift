//
//  ConnectionManager.swift
//  mobiita
//
//  Created by 三木俊作 on 2016/11/26.
//  Copyright © 2016年 Shunsaku Miki. All rights reserved.
//

import UIKit
import Alamofire

/** 
 通信結果Enum
 */
enum ConnectResult {
    case success
    case failed
}

typealias completionHandler = (_ data: DataResponse<Any>) -> ()

class ConnectionManager {
    
    // MARK: - Method
    
    /// 投稿一覧取得API
    ///
    /// - Parameters:
    ///   - page: ページ
    ///   - per_page: 1リクエストの要素
    ///   - query: クエリ
    ///   - completionHandoler: 通信完了後コールバック
    func getItemListApi(page: String?, perPage: String?, query: String?, completionHandler: @escaping completionHandler) {
        
        var parameters = [String: Any]()
        self.setDicParameter(&parameters, key: "page", parameter: page)
        self.setDicParameter(&parameters, key: "per_page", parameter: perPage)
        self.setDicParameter(&parameters, key: "query", parameter: query)

        Alamofire.request(ConnectionManager.getItemListUrl, method: .get, parameters: parameters).responseJSON { (DataResponse) in
            completionHandler(DataResponse)
        }
    }
    
    
    /// タグ一覧取得API
    ///
    /// - Parameters:
    ///   - page: ページ
    ///   - perPage: 1リクエストの要素
    ///   - sort: 並び順
    ///   - completionHandler: 通信完了後コールバック
    func getTagListApi(page: String?, perPage: String?, sort: String?, completionHandler: @escaping completionHandler) {
        
        var parameters = [String: Any]()
        self.setDicParameter(&parameters, key: "page", parameter: page)
        self.setDicParameter(&parameters, key: "per_page", parameter: perPage)
        self.setDicParameter(&parameters, key: "sort", parameter: sort)
        
        
        Alamofire.request(ConnectionManager.getTagListUrl, method: .get, parameters: parameters).responseJSON { (DataResponse) in
            completionHandler(DataResponse)
        }
    }
    
    
    /// リクエストparamがnilじゃなければDicに値を格納
    ///
    /// - Parameters:
    ///   - parameters: パラメータ格納用Dic
    ///   - key: キー
    ///   - parameter: リクエストパラメータ
    private func setDicParameter(_ parameters: inout [String: Any], key: String, parameter: String?) {
        guard let parameter = parameter else {
            return
        }
        parameters[key] = parameter
    }
    
    // MARK: Property
    
    private init () {}
    /** Singleton Object */
    static let sharedInstance = ConnectionManager()
    /** 投稿一覧取得APIURL */
    static let getItemListUrl = Const.kPath + "items"
    
    static let getTagListUrl = Const.kPath + "tags"
}
