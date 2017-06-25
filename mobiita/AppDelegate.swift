//
//  AppDelegate.swift
//  mobiita
//
//  Created by 三木俊作 on 2016/11/26.
//  Copyright © 2016年 Shunsaku Miki. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        guard let query = url.query else {
            return true
        }
        
        let code = AuthorizationManager.genCode(query)
        guard code.characters.count > 0 else {
            return true
        }
        
        fetchAccessToken(code: code)
        
        return true
    }
    ;
    private func fetchAccessToken(code: String) {
        AccessTokenModel().fetchData(clientId: AuthorizationManager.kClientId, clientSecret: AuthorizationManager.kClientSecret, code: code) { (result) in
            switch result {
            case .success:
                break
            case .failed:
                // TODO: - Failed挙動
                break
            }
        }
    }
}

