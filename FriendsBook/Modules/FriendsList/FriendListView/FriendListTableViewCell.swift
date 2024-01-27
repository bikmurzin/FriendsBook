//
//  Project: FriendsBook
//  File: FriendListTableViewCell.swift
//  Created by: Robert Bikmurzin
//  Date: 27.01.2024
//

import UIKit
import SnapKit

final class FriendListTableViewCell: UITableViewCell {
    
    static let identifier = "FriendListTableViewCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.nameTextColor
        label.font = .systemFont(ofSize: Constants.nameFontSize)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.nameTextColor
        label.font = .systemFont(ofSize: Constants.nameFontSize)
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.inactiveStatusColor
        label.font = .systemFont(ofSize: Constants.statusFontSize)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeConstraints()
        backgroundColor = Constants.backgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCellData(viewModel: FriendsListModels.ViewModel) {
        nameLabel.text = viewModel.name
        emailLabel.text = viewModel.email
        switch viewModel.isActive {
        case true:
            statusLabel.text = Constants.activeStatusText
            statusLabel.textColor = Constants.activeStatusColor
        case false:
            statusLabel.text = Constants.inactiveStatusText
        }
    }
    
    private func makeConstraints() {
        addSubview(nameLabel)
        addSubview(emailLabel)
        addSubview(statusLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.horizontalPadding)
            make.centerY.equalToSuperview().inset(Constants.verticalPadding)
        }
        emailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.horizontalPadding)
            make.centerY.equalToSuperview().offset(Constants.verticalPadding)
        }
        statusLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(Constants.horizontalPadding)
            make.centerY.equalToSuperview()
        }
    }
}

// MARK: - Constants
extension FriendListTableViewCell {
    enum Constants {
        static let nameTextColor: UIColor = .black
        static let emailTextColor: UIColor = .gray
        static let activeStatusColor: UIColor = .gray
        static let inactiveStatusColor: UIColor = .gray
        static let backgroundColor: UIColor = .clear
        static let nameFontSize: CGFloat = 20
        static let emailFontSize: CGFloat = 15
        static let statusFontSize: CGFloat = 18
        static let activeStatusText: String = "Active"
        static let inactiveStatusText: String = "Inactive"
        static let horizontalPadding: CGFloat = 15
        static let verticalPadding: CGFloat = 15
    }
}
