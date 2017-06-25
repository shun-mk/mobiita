//
//  UserDefaultsUtility.swift
//  mobiita
//
//  Created by Shunsaku Miki on 2017/06/25.
//  Copyright © 2017年 Shunsaku Miki. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static let accessTokenKey = "accessToken"
    
    /** アクセストークン */
    var accessToken: String? {
        get {
            return UserDefaults.standard.string(forKey: UserDefaults.accessTokenKey)
        }
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefaults.accessTokenKey)
            UserDefaults.standard.synchronize()
        }
    }
}
