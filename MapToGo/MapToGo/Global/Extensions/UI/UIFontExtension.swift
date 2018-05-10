//
//  UIFontExtension.swift
//  MapToGo
//
//  Created by Denys on 5/10/18.
//  Copyright © 2018 Denys Zhukov. All rights reserved.
//

import UIKit

extension UIFont {
    static let defaultFontSize: CGFloat = 18.0
    static let defaultFontName: String = "Trebuchet MS"
    
    static func defaultRegularFont(with size: CGFloat = defaultFontSize) -> UIFont {
        return UIFont.init(name: defaultFontName, size: size)!
    }
}
