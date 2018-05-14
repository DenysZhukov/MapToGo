//
//  UIViewExtension+Helper.swift
//  MapToGo
//
//  Created by Denys on 5/10/18.
//  Copyright © 2018 Denys Zhukov. All rights reserved.
//

import UIKit

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
