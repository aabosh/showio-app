//
//  TitleTableViewCell.swift
//  ShowTracker
//
//  Created by Roman Madyanov on 11/11/2018.
//  Copyright © 2018 Roman Madyanov. All rights reserved.
//

import Foundation
import UIKit

class TitleTableViewCell: UITableViewCell {
    var title: String? {
        get { return titleLabel.text }
        set { titleLabel.text = newValue }
    }

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setTextStyle(.title2)
        return label
    }()

    private lazy var topLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(titleLabel)
        contentView.addSubview(topLineView)

        titleLabel.snap(insets: UIEdgeInsets(top: 16, left: 24, bottom: 8, right: 24))

        NSLayoutConstraint.activate([
            topLineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            topLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topLineView.topAnchor.constraint(equalTo: contentView.topAnchor),
            topLineView.heightAnchor.constraint(equalToConstant: 0.5),
        ])

        startListenForThemeChange()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TitleTableViewCell: ChangingTheme {
    @objc func didChangeTheme() {
        titleLabel.textColor = Theme.current.primaryForegroundColor
        topLineView.backgroundColor = Theme.current.primaryForegroundColor.withAlphaComponent(0.1)
    }
}
