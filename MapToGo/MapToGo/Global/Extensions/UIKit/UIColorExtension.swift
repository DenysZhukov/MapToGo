//
//  UIColorExtension.swift
//  MapToGo
//
//  Created by Denys on 5/10/18.
//  Copyright © 2018 Denys Zhukov. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var customBlack: UIColor {
        return UIColor.colorWith(red: 33.0, green: 33.0, blue: 33.0)
    }
    
    private static func colorWith(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        return UIColor.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha / 1.0)
    }
}
