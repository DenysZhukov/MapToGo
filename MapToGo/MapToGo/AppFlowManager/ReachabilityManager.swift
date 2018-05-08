//
//  ReachabilityManager.swift
//  MapToGo
//
//  Created by Denys on 4/13/18.
//  Copyright © 2018 Denys Zhukov. All rights reserved.
//

import Foundation
import Reachability

typealias ReachabilityCallback = ((NetworkConnectionStatus) -> Void)

enum NetworkConnectionStatus {
    case connected
    case disconnected
    
    var description: String {
        switch self {
        case .connected: return "connected".uppercased()
        case .disconnected: return "disconnected".uppercased()
        }
    }
}

class ReachabilityManager: Configurable {
    private let reachability = Reachability()
    private let connectionCallback: ReachabilityCallback?
    init(connectionCallback: ReachabilityCallback? = nil) {
        self.connectionCallback = connectionCallback
    }
    
    func configure() {
        do {
            try reachability?.startNotifier()
        } catch let error {
            fatalError(error.localizedDescription)
        }
        reachability?.whenReachable = { [weak self] reachability in
            switch reachability.connection {
            case .cellular, .wifi:
                self?.connectionCallback?(.connected)
            case .none: break
            }
        }
        reachability?.whenUnreachable = { [weak self] reachability in
            switch reachability.connection {
            case .cellular, .wifi: break
            case .none:
                self?.connectionCallback?(.disconnected)
            }
        }
    }
}
