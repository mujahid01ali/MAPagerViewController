//
//  PagerCellConfig.swift
//  MAPager-iOS
//
//  Created by Mujahid Ali on 11/11/2023.
//

import Foundation

final class MAPagerCellConfig {
    private var config: MATabConfiguration?
    private var tab: MATab?
    
    init(config: MATabConfiguration? = nil, tab: MATab? = nil) {
        self.config = config
        self.tab = tab
    }
    
    var borderRadius: Double {
        config?.borderRadius ?? 0.0
    }
    
    var selectedCellBorderColor: CGColor {
        if let isSelected = tab?.isSelected, isSelected, let selectedCellBorderColor = config?.selectedCellBorderColor {
            return selectedCellBorderColor.cgColor
        } else if let borderColor = config?.borderColor {
            return borderColor.cgColor
        }
        return UIColor.black.cgColor
    }
    
    var tabBackgroundColor: UIColor {
        if let isSelected = tab?.isSelected, isSelected, let tabBackgroundColor = config?.selectedTabBackgroudColor {
            return tabBackgroundColor
        } else if let borderColor = config?.tabBackgroudColor {
            return borderColor
        }
        return UIColor.black
    }
    
    var bottomIndicatorColor: UIColor {
        return config?.bottomIndicatorColor ?? .black
    }
    
    var borderWidth: Double {
        config?.borderWidth ?? 0.0
    }
    
    var textColor: UIColor {
        if let isSelected = tab?.isSelected, isSelected, let textColor = config?.selectedTextColor {
            return textColor
        } else if let textColor = config?.textColor {
            return textColor
        }
        return UIColor.black
    }
    
    var tintColor: UIColor {
        if let isSelected = tab?.isSelected, isSelected, let tintColor = config?.SelectedTintColor {
            return tintColor
        } else if let tintColor = config?.tintColor {
            return tintColor
        }
        return UIColor.black
    }
    
    var isIconHidden: Bool {
        return tab?.icon == nil ? true : false
    }
    
    var icon: UIImage? {
        tab?.icon
    }
    
    var title: String {
        let isTitleInUpperCase: Bool = config?.isTitleInUpperCase ?? false
        return isTitleInUpperCase ? (tab?.title ?? "").uppercased() : (tab?.title ?? "")
    }
    var font: UIFont {
        config?.font ?? .systemFont(ofSize: 16, weight: .regular)
    }
    var isBottomSelectorVisible: Bool {
        if let showBottomSelector = config?.showBottomSelector, showBottomSelector, let isSelected = tab?.isSelected, isSelected {
            return false
        } else {
            return true
        }
    }
}
