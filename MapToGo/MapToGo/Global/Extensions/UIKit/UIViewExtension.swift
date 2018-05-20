//
//  UIViewExtension.swift
//  MapToGo
//
//  Created by Denys on 5/10/18.
//  Copyright © 2018 Denys Zhukov. All rights reserved.
//

import UIKit

//MARK: - Helper -
extension UIView {
    
    static func fromNibHelper<T: UIView>(owner: Any? = nil) -> T {
        let type = Bundle(for: T.self)
        return type.loadNibNamed(String(describing: T.self),
                                 owner: owner,
                                 options: nil)?.first as! T
    }
    
    static func fromNib(owner: Any? = nil) -> Self {
        return fromNibHelper(owner: owner)
    }
    
}

//MARK: - Configuration -
extension UIView {
    
    func baseShadow(offset: CGSize,
                    opacity: Float = 0.3,
                    radius: CGFloat = 14.0) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = radius
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
}

//MARK: - Animation -
extension UIView {
    @discardableResult
    static func baseAnimation(duration: TimeInterval?,
                              delay: TimeInterval = 0.0,
                              options: UIViewAnimationOptions = [.beginFromCurrentState, .allowUserInteraction, .curveEaseInOut],
                              animation: @escaping VoidClosure,
                              completion: VoidClosure? = nil) -> UIViewPropertyAnimator {
        return UIViewPropertyAnimator.runningPropertyAnimator(withDuration: duration ?? 0.0,
                                                              delay: delay,
                                                              options: options,
                                                              animations: animation) { _ in
                                                                completion?()
        }
    }
    
}
