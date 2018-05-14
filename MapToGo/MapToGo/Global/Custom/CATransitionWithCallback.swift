//
//  CATransitionWithCallback.swift
//  MapToGo
//
//  Created by Denys on 5/8/18.
//  Copyright © 2018 Denys Zhukov. All rights reserved.
//

import Foundation
import QuartzCore.CAAnimation

class CATransitionWithCallback: NSObject {
    let transition: CATransition
    fileprivate let completion: (Bool) -> Void
    init(_ transition: CATransition, completion: @escaping (_ didFinish: Bool) -> Void) {
        self.transition = transition
        self.completion = completion
        super.init()
        transition.delegate = self
    }
}

extension CATransitionWithCallback: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        completion(flag)
    }
}
