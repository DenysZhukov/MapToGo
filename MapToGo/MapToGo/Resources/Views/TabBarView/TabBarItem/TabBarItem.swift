//
//  TabBarItem.swift
//  MapToGo
//
//  Created by Denys on 5/10/18.
//  Copyright © 2018 Denys Zhukov. All rights reserved.
//

import UIKit

class TabBarItem: UIView {
    
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
//            titleLabel.font =
        }
    }
    
    var itemText: String? {
        set(title) {
            titleLabel.text = title
        }
        get {
            return titleLabel.text
        }
    }
}
