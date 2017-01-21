//
//  BaseContainer.swift
//  mobiita
//
//  Created by 三木俊作 on 2016/12/10.
//  Copyright © 2016年 Shunsaku Miki. All rights reserved.
//

import Foundation
import Alamofire

typealias connectionResultHandler = (_ result: ConnectResult) -> ()

class BaseContainer<T: BaseModelProtocol> {
    
    // MARK: - property
    
    /** モデルリスト */
    var modelList: [T] = []
}
