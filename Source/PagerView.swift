//
//  PagerView.swift
//  Pager
//
//  Created by Mujahid Ali on 31/10/2023.
//

import UIKit

final public class MAPagerView: UIViewController {
    private var pageViewController: UIPageViewController!
    public var configuration: PagerConfiguration?
    public var callingViewControllers: UIViewController!
    
    private let mainScreenView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.register(MAPagerCell.self, forCellWithReuseIdentifier: "MAPagerCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = configuration?.pagerBackgroundColor
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private var pageViewControllers: [UIViewController] {
        var con: [UIViewController] = []
        for item in configuration?.tabs ?? [] {
            con.append(item.screen ?? UIViewController())
        }
        return con
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setConstraints()
        setPager()
        collectionView.reloadData()
        addCurrentControllersToView()
    }
    
    public func setChildViews() {
        //Adding pagerView as a child of calling view controller
        callingViewControllers.addChild(self)
        // Adding pagerView to the calling view controller view
        callingViewControllers.view.addSubview(self.view)
        // SET FRAME OF PAGERVIEW
        self.view.frame = callingViewControllers.view.bounds
        self.didMove(toParent: callingViewControllers)
    }

    
    private func addViews() {
        view.addSubview(collectionView)
        view.addSubview(mainScreenView)
    }
    
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        reloadPagerView()
    }
    
    private func reloadPagerView() {
        DispatchQueue.main.async {[weak self] in
            guard let self = self else { return }
            self.createLayout().invalidateLayout()
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.layoutIfNeeded()
            
            UIView.animate(withDuration: 0.1) {[weak self] in
                guard let self = self else { return }
                self.collectionView.scrollToItem(at: IndexPath(row: self.getIndexPathOfSelectedTab(), section: 0), at: .centeredHorizontally, animated: false)
            }
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            mainScreenView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 0),
            mainScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainScreenView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
    
    private func setPager() {
        pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.dataSource = self
        pageViewController.delegate = self
        pageViewController.setViewControllers([pageViewControllers.first ?? UIViewController()], direction: .forward, animated: true, completion: nil)
        if let scrollView = self.pageViewController.view.subviews.compactMap({ $0 as? UIScrollView }).first {
            scrollView.bounces = configuration?.isScrollingEnable ?? false
        }
    }
    
    private func addCurrentControllersToView() {
        self.addChild(pageViewController)
        mainScreenView.addSubview(pageViewController.view)
        pageViewController.view.frame = mainScreenView.bounds
        pageViewController.didMove(toParent: self)
        
    }
    
    private func didSelectTab(index: Int, previousIndex: Int) {
        if index >= 0 && index < pageViewControllers.count {
            let selectedViewController = pageViewControllers[index]
            if index > previousIndex {
                pageViewController.setViewControllers([selectedViewController], direction: .forward, animated: true, completion: nil)
            } else {
                pageViewController.setViewControllers([selectedViewController], direction: .reverse, animated: true, completion: nil)
            }
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout {[weak self] (_, _) -> NSCollectionLayoutSection? in
            guard let _ = self else {return nil}
            let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(80), heightDimension: .absolute(50))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(80), heightDimension: .absolute(50))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.interItemSpacing = .fixed(8)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = .init(top: 0, leading: 8, bottom: 0, trailing: 8)
            section.orthogonalScrollingBehavior = .continuous
            section.interGroupSpacing = 8
            return section
        }
    }
}

extension MAPagerView: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let previousSelectedIndex = getIndexPathOfSelectedTab()
        if completed, let currentViewController = pageViewController.viewControllers?.first,
           let index = configuration?.tabs.firstIndex(where: { $0.screen === currentViewController }) {
            selectAndUnSelectTabs(selectedIndex: index)
            collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
            collectionView.reloadItems(at: [IndexPath(item: previousSelectedIndex, section: 0), IndexPath(row: index, section: 0)])
        }
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard configuration?.isScrollingEnable ?? false else {
            return nil
        }
        if let index = configuration?.tabs.firstIndex(where: { $0.screen === viewController }), index > 0 {
            return configuration?.tabs[index - 1].screen
        }
        return nil
    }

    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard configuration?.isScrollingEnable ?? false else {
            return nil
        }
        if let index = configuration?.tabs.firstIndex(where: { $0.screen === viewController }), index < (configuration?.tabs.count ?? 0) - 1 {
            return configuration?.tabs[index + 1].screen
        }
        return nil
    }
}

extension MAPagerView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return configuration?.tabs.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard (configuration?.tabs.count ?? 0) > indexPath.row else {
            return UICollectionViewCell()
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MAPagerCell", for: indexPath) as? MAPagerCell else {
            return UICollectionViewCell()
        }
        cell.setConfiguartion(tab: configuration?.tabs[indexPath.row], config: configuration?.tabConfig)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let previousSelectedIndex = getIndexPathOfSelectedTab()
        if indexPath.row == previousSelectedIndex {
            return
        }
        selectAndUnSelectTabs(selectedIndex: indexPath.row)
        addCurrentControllersToView()
        UIView.animate(withDuration: 0.3, delay: 0) {[weak self] in
            self?.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            self?.collectionView.reloadItems(at: [IndexPath(item: previousSelectedIndex, section: 0), indexPath])
            self?.didSelectTab(index: indexPath.row, previousIndex: previousSelectedIndex)
        }
    }
    
    private func getIndexPathOfSelectedTab() -> Int {
        if let index = configuration?.tabs.firstIndex(where: { ($0.isSelected ?? false)} ) {
            return index
        }
        return 0
    }
    
    private func selectAndUnSelectTabs(selectedIndex: Int) {
        for (index, _) in (configuration?.tabs ?? []).enumerated() {
            if index == selectedIndex {
                configuration?.tabs[index].isSelected = true
            } else {
                configuration?.tabs[index].isSelected = false
            }
        }
    }
}

