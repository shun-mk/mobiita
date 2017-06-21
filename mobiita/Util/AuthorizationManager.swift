//
//  AuthorizationManager.swift
//  mobiita
//
//  Created by Shunsaku Miki on 2017/06/21.
//  Copyright © 2017年 Shunsaku Miki. All rights reserved.
//

import UIKit

final class AuthorizationManager {
    
    // MARK: - Methods
    
    /// Auth認証用URL生成
    ///
    /// - Returns: URL
    private class func genAuthUrl() -> URL?{
        return URL(string: kAuthUrl + "?" + prefixCilentId + kClientId + "&" + preficScope + kScope)
    }
    
    
    /// 認証画面表示
    class func openOAuthUrl() {
        guard let url = genAuthUrl() else { return }
        UIApplication.shared.openURL(url)
    }
    
    // MARK: - Property
    
    /** qiitaAPIクライアントID */
    static let kClientId = "de1b2dd6bd71d8c71fbdce0e066562c759bcce9a"
    /** QiitaクライントSecret */
    static let kClientSecret = "f6551191b43e82c3de17fa665da9f8ddd0a9c5b5"
    /** 認証用サイトURL */
    static let kAuthUrl = "https://qiita.com/api/v2/oauth/authorize"
    /** スコープ(クエリ) */
    static let kScope = "read_qiita"
    /** State(クエリ) */
    static let kState = ""
    /** クライアントIDキー */
    static let prefixCilentId = "client_id="
    /** scopeキー */
    static let preficScope = "scope="
    
}
