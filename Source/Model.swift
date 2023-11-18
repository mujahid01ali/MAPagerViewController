//
//  Model.swift
//  Pager
//
//  Created by Mujahid Ali on 01/11/2023.
//

import UIKit

public struct MATab {
    var icon: UIImage?
    var title: String?
    var screen: UIViewController?
    var isSelected: Bool?
    
    public init(icon: UIImage? = nil, title: String?, screen: UIViewController?, isSelected: Bool? = false) {
        self.icon = icon
        self.title = title
        self.screen = screen
        self.isSelected = isSelected
    }
}

public struct MATabConfiguration {
    var borderRadius: Double?
    var borderColor: UIColor?
    var borderWidth: Double?
    var textColor: UIColor?
    var tintColor: UIColor?
    var tabBackgroudColor: UIColor?
    var font: UIFont?
    var isTitleInUpperCase: Bool?
    var showBottomSelector: Bool?
    var selectedCellBorderColor: UIColor?
    var selectedTabBackgroudColor: UIColor?
    var selectedTextColor: UIColor?
    var SelectedTintColor: UIColor?
    var bottomIndicatorColor: UIColor?
    
    public init(borderRadius: Double? = 0.0, borderColor: UIColor? = .darkGray, borderWidth: Double? = 0.0, textColor: UIColor? = .black, tintColor: UIColor? = .black, tabBackgroudColor: UIColor? = .white, font: UIFont? = .systemFont(ofSize: 16, weight: .regular), isTitleInUpperCase: Bool? = false, showBottomSelector: Bool? = true, selectedCellBorderColor: UIColor? = .black, selectedTabBackgroudColor: UIColor? = .white, selectedTextColor: UIColor? = .black, SelectedTintColor: UIColor? = .black, bottomIndicatorColor: UIColor? = .black) {
        self.borderRadius = borderRadius
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.textColor = textColor
        self.tintColor = tintColor
        self.tabBackgroudColor = tabBackgroudColor
        self.font = font
        self.isTitleInUpperCase = isTitleInUpperCase
        self.showBottomSelector = showBottomSelector
        self.selectedCellBorderColor = selectedCellBorderColor
        self.selectedTabBackgroudColor = selectedTabBackgroudColor
        self.selectedTextColor = selectedTextColor
        self.SelectedTintColor = SelectedTintColor
        self.bottomIndicatorColor = bottomIndicatorColor
    }
}

public struct PagerConfiguration {
    var tabs: [MATab]
    var isScrollingEnable: Bool?
    var pagerBackgroundColor: UIColor?
    var tabConfig: MATabConfiguration?
    
    
    public init(tabs: [MATab], isScrollingEnable: Bool? = true, pagerBackgroundColor: UIColor? = .white, tabConfig: MATabConfiguration? = MATabConfiguration()) {
        self.tabs = tabs
        self.isScrollingEnable = isScrollingEnable
        self.pagerBackgroundColor = pagerBackgroundColor
        self.tabConfig = tabConfig
    }
}




