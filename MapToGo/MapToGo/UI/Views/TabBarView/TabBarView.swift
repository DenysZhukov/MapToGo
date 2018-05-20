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
    
    //MARK: - Configure -
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLayout()
        baseShadow(offset: CGSize(width: 0.0, height: -10.0))
        selectItem(with: .map)
    }
    
    //MAKR: - Interface methods -
    func selectItem(with type: TabBarItemType) {
        let tabBarItem = itemViews.first(where: { $0.type == type })
        tabBarItem?.isSelected = true
    }
    
    //MARK: - Private methods -
    private func setupLayout() {
        itemViews.forEach { $0.removeFromSuperview() }
        itemViews.removeAll()
        for (idx, item) in itemTypes.enumerated() {
            let itemView = TabBarItemView.fromNib()
            itemView.type = item
            itemView.actionCallback = tabBarItemCallback()
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
    
    private func tabBarItemCallback() -> TabBarItemCallback {
        return  { [weak self] type in
            guard let selectedItem = self?.itemViews.first(where: { $0.isSelected }) else { return }
            selectedItem.isSelected = false
            guard let tapped = self?.itemViews.first(where: { $0.type == type }) else { return }
            tapped.isSelected = true
        }
    }
}
