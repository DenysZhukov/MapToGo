//
//  TabBarView.swift
//  MapToGo
//
//  Created by Denys on 5/10/18.
//  Copyright © 2018 Denys Zhukov. All rights reserved.
//

import UIKit
import SnapKit

class TabBarView: UIView {
    
    enum TabBarItemType {
        case map
        case setting
        
        var title: String {
            switch self {
            case .map: return "Map"
            case .setting: return "Settings"
            }
        }
    }
    
    let itemTypes: [TabBarItemType] = [.map, .setting]
    var itemViews: [TabBarItemView] = []
    
    //MARK: - Initialization -
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupLayout()
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupLayout()
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
    }
    
    private func setupLayout() {
        itemViews.forEach { $0.removeFromSuperview() }
        itemViews.removeAll()
        for (idx, item) in itemTypes.enumerated() {
            let itemView = TabBarItemView.fromNib()
            itemView.itemText = item.title
            addSubview(itemView)
            switch idx {
            case 0:
                itemView.snp.makeConstraints { make in
                    make.bottom.leading.top.equalToSuperview()
                }
            case itemTypes.count - 1 where itemTypes.count > 1:
                itemView.snp.makeConstraints { make in
                    make.bottom.trailing.top.equalToSuperview()
                    guard let last = itemViews.last else { return }
                    make.leading.equalTo(last.snp.trailing)
                    make.width.equalTo(last.snp.width)
                }
            default:
                itemView.snp.makeConstraints { make in
                    make.bottom.top.equalToSuperview()
                    guard let last = itemViews.last else { return }
                    make.leading.equalTo(last.snp.trailing)
                    make.width.equalTo(last.snp.width)
                }
            }
            itemViews.append(itemView)
        }
    }
}
