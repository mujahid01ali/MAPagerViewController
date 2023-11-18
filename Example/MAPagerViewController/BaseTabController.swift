//
//  BaseTabController.swift
//  Pager
//
//  Created by Mujahid Ali on 01/11/2023.
//

import UIKit
import MAPagerViewController

class BaseTabController: UIViewController {
    
    var tabs: [MATab] {
        return [
            MATab(icon: UIImage(systemName: "cricket.ball.fill"), title: "Music", screen: ViewController(), isSelected: true),
            MATab(title: "Entertainment", screen: ViewController2()),
            MATab(title: "World News", screen: ViewController3()),
            MATab(icon: UIImage(systemName: "cricket.ball.fill"), title: "Music", screen: ViewController()),
            MATab(title: "Entertainment", screen: ViewController2()),
            MATab(title: "World News", screen: ViewController3()),
            MATab(icon: UIImage(systemName: "cricket.ball.fill"), title: "Music", screen: ViewController()),
            MATab(title: "Entertainment", screen: ViewController2())
        ]
    }
    
    lazy var pagerView: MAPagerView = {
        let view = MAPagerView()
        return MAPagerView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PAGER VIEW"
        view.backgroundColor = .white
        setPager()
    }
    
    private func setPager() {
        let tabConfig = MATabConfiguration(borderRadius: 8.0,
                                         borderWidth: 1.0,
                                         font: .systemFont(ofSize: 16, weight: .bold),
                                         selectedCellBorderColor: .brown,
                                         selectedTabBackgroudColor: .brown,
                                         selectedTextColor: .white,
                                         SelectedTintColor: .white,
                                         bottomIndicatorColor: .brown)
        pagerView.configuration = PagerConfiguration(tabs: tabs,
                                                     isScrollingEnable: true,
                                                     pagerBackgroundColor: .white,
                                                     tabConfig: tabConfig)
        pagerView.callingViewControllers = self
        pagerView.setChildViews()
 
    }
}
