//
//  Project: FriendsBook
//  File: UserDetailsHowizontalStackView.swift
//  Created by: Robert Bikmurzin
//  Date: 29.01.2024
//

import UIKit
import SnapKit

final class UserDetailsHorizontalView: UIView {
    
    private let leftLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.leftLabelTextColor
        label.font = .systemFont(ofSize: Constants.leftLabelTextSize)
        return label
    }()
    
    private let rightLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.rightLabelTextColor
        label.font = .systemFont(ofSize: Constants.rightLabelTextSize)
        label.numberOfLines = 0
        return label
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        configView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(leftText: String, rightText: String?) {
        leftLabel.text = leftText
        rightLabel.text = rightText
    }
    
    private func configView() {
        backgroundColor = Constants.selfBackgroundColor
        addSubviews(views: [leftLabel, rightLabel])
        leftLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
        }
        rightLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview()
        }
    }
}

// MARK: - Constants
extension UserDetailsHorizontalView {
    enum Constants {
        static let leftLabelTextSize: CGFloat = 15
        static let rightLabelTextSize: CGFloat = 18
        static let leftLabelTextColor: UIColor = .secondaryLabel
        static let rightLabelTextColor: UIColor = .label
        static let horizontalPadding: CGFloat = 15
        static let selfBackgroundColor: UIColor = .clear
    }
}
