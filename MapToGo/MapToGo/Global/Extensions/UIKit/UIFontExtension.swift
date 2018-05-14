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
    static let defaultFontName = "OpenSans"
    static let defaultLightFontName = defaultFontName + "-Light"
    static let defaultItalicFontName = defaultFontName + "-Italic"
    static let defaultSemiboldFontName = defaultFontName + "-Semibold"
    static let defaultBoldFontName = defaultFontName + "-Bold"

    static func defaultRegularFont(with size: CGFloat = defaultFontSize) -> UIFont {
        return UIFont.init(name: defaultFontName, size: size)!
    }
    static func defaultLightFont(with size: CGFloat = defaultFontSize) -> UIFont {
        return UIFont.init(name: defaultLightFontName, size: size)!
    }
    static func defaultItalicFont(with size: CGFloat = defaultFontSize) -> UIFont {
        return UIFont.init(name: defaultItalicFontName, size: size)!
    }
    static func defaultSemiboldFont(with size: CGFloat = defaultFontSize) -> UIFont {
        return UIFont.init(name: defaultSemiboldFontName, size: size)!
    }
    static func defaultBoldFont(with size: CGFloat = defaultFontSize) -> UIFont {
        return UIFont.init(name: defaultBoldFontName, size: size)!
    }

}
