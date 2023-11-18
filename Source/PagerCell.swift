//
//  PagerCell.swift
//  Pager
//
//  Created by Mujahid Ali on 01/11/2023.
//

import UIKit

final class MAPagerCell: UICollectionViewCell {
    
    let lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Tab"
        lbl.font = .systemFont(ofSize: 16, weight: .bold)
        lbl.textColor = UIColor.cyan
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let iconView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 8
        sv.axis = .horizontal
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    let chipsView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bottonIndicatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var pagerCellConfig: MAPagerCellConfig!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setConstraints()
        chipsView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addViews()
        setConstraints()
        iconView.layer.cornerRadius = 18
    }
    
    private func addViews() {
        contentView.addSubview(chipsView)
        chipsView.addSubview(stackView)
        stackView.addArrangedSubview(iconView)
        stackView.addArrangedSubview(lblTitle)
        contentView.addSubview(bottonIndicatorView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            chipsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            chipsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            chipsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: chipsView.topAnchor, constant: 8),
            stackView.leadingAnchor.constraint(equalTo: chipsView.leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: chipsView.trailingAnchor, constant: -8),
            stackView.bottomAnchor.constraint(equalTo: chipsView.bottomAnchor, constant: -8),
        ])
        
        NSLayoutConstraint.activate([
            bottonIndicatorView.topAnchor.constraint(equalTo: chipsView.bottomAnchor, constant: 8),
            bottonIndicatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            bottonIndicatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            bottonIndicatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            bottonIndicatorView.heightAnchor.constraint(equalToConstant: 3)
        ])
    }
    
    func setConfiguartion(tab: MATab?, config: MATabConfiguration?) {
        pagerCellConfig = MAPagerCellConfig(config: config, tab: tab)
        chipsView.layer.cornerRadius = pagerCellConfig.borderRadius
        chipsView.layer.borderWidth = pagerCellConfig.borderWidth
        chipsView.layer.borderColor = pagerCellConfig.selectedCellBorderColor
        chipsView.backgroundColor = pagerCellConfig.tabBackgroundColor
        
        
        lblTitle.font = pagerCellConfig.font
        lblTitle.text = pagerCellConfig.title
        lblTitle.textColor = pagerCellConfig.textColor
        
        iconView.tintColor = pagerCellConfig.tintColor
        iconView.isHidden = pagerCellConfig.isIconHidden
        iconView.image = pagerCellConfig.icon
        
        bottonIndicatorView.isHidden = pagerCellConfig.isBottomSelectorVisible
        bottonIndicatorView.backgroundColor = pagerCellConfig.bottomIndicatorColor
    }
}
