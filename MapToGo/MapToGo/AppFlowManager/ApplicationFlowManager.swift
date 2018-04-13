//
//  ApplicationFlowManager.swift
//  MapToGo
//
//  Created by Denys on 4/13/18.
//  Copyright © 2018 Denys Zhukov. All rights reserved.
//

import UIKit
import Reachability

class ApplicationFlowManager: NSObject {
    
    fileprivate let reachabilityManager = Reachability()
    
    let window: UIWindow
    
    init(with window: UIWindow) {
        self.window = window
    }
}
