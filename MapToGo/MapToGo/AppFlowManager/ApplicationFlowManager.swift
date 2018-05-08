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
    
    fileprivate let notificationCenter = NotificationCenter.default

    let window: UIWindow
    private lazy var reachabilityManager: ReachabilityManager = {
        let manager = ReachabilityManager(connectionCallback: { status in
            print("Connection status changed - ", status.description)
        })
        return manager
    }()

    init(with window: UIWindow) {
        self.window = window
        super.init()
        notificationCenter.addObserver(self,
                                       selector: #selector(self.initiateSignOut),
                                       name: Notifications.signOut,
                                       object: nil)
    }
    
    func initialFlow() {
        reachabilityManager.configure()
    }
    
}

private extension ApplicationFlowManager {
    
    func changeViewController(_ viewController: UIViewController) {
        guard window.rootViewController != nil else {
            window.rootViewController = viewController
            return
        }
        let transition = CATransition()
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionMoveIn
        transition.subtype = kCATransitionFromTop
        transition.duration = 1
        
        let previousVC = window.rootViewController
        let callbackTransition = CATransitionWithCallback(transition) { _ in
            previousVC?.removeFromParentViewController()
            previousVC?.view.removeFromSuperview()
        }
        window.layer.add(callbackTransition.transition,
                         forKey: kCATransition)
        window.rootViewController = viewController
    }
    
    @objc func initiateSignOut() {
        initialFlow()
    }

}
