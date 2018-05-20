//
//  TabBarItemView.swift
//  MapToGo
//
//  Created by Denys on 5/10/18.
//  Copyright © 2018 Denys Zhukov. All rights reserved.
//

import UIKit

typealias TabBarItemCallback = ((TabBarView.TabBarItemType) -> Void)

class TabBarItemView: UIControl {
    private let normalFontSize: CGFloat = 18.0
    private let animationDuration: TimeInterval = 0.2

    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.defaultSemiboldFont(with: normalFontSize)
            titleLabel.textAlignment = .center
            titleLabel.textColor = isSelected ? UIColor.blueBerry : .gray
        }
    }
    
    override var isSelected: Bool {
        didSet {
            UIView.transition(with: titleLabel,
                              duration: animationDuration,
                              options: .transitionCrossDissolve,
                              animations: { [weak self] in
                                guard let strongSelf = self else { return }
                                self?.titleLabel.textColor = strongSelf.isSelected ? UIColor.blueBerry : .gray
            })
        }
    }
    
    var type: TabBarView.TabBarItemType? {
        didSet {
            titleLabel.text = type?.title
        }
    }
    
    var actionCallback: TabBarItemCallback?
    
    //MARK: - Configure -
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .clear
        addTarget(self, action: #selector(tabBarItemAction), for: .touchUpInside)
    }
    
    @objc
    private func tabBarItemAction() {
        guard let type = self.type else { return }
        actionCallback?(type)
    }
}
