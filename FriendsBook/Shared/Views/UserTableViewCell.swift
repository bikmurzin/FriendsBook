//
//  Project: FriendsBook
//  File: UserTableViewCell.swift
//  Created by: Robert Bikmurzin
//  Date: 28.01.2024
//

import UIKit
import SnapKit

final class UserTableViewCell: UITableViewCell {
    static let identifier = "FriendListTableViewCell"
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.nameTextColor
        label.font = .systemFont(ofSize: Constants.nameFontSize)
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.emailTextColor
        label.font = .systemFont(ofSize: Constants.emailFontSize)
        label.textAlignment = .left
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
    
    func configCellData(viewModel: FriendsListModels.ViewModel.User?) {
        nameLabel.text = viewModel?.name
        emailLabel.text = viewModel?.email
        guard let isActive = viewModel?.isActive else { return }
        switch isActive {
        case true:
            statusLabel.text = Constants.activeStatusText
            statusLabel.textColor = Constants.activeStatusColor
        case false:
            statusLabel.text = Constants.inactiveStatusText
            statusLabel.textColor = Constants.inactiveStatusColor
        }
    }
    
    private func makeConstraints() {
        addSubview(nameLabel)
        addSubview(emailLabel)
        addSubview(statusLabel)
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.horizontalPadding)
            make.bottom.equalTo(snp.centerY).inset(Constants.verticalPadding)
        }
        emailLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Constants.horizontalPadding)
            make.top.equalTo(snp.centerY).offset(Constants.verticalPadding)
        }
        statusLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(Constants.horizontalPadding)
            make.centerY.equalToSuperview()
            make.width.equalTo(Constants.statusLabelWidth)
        }
    }
}

// MARK: - Constants
extension UserTableViewCell {
    enum Constants {
        static let nameTextColor: UIColor = .black
        static let emailTextColor: UIColor = .gray
        static let activeStatusColor: UIColor = .green
        static let inactiveStatusColor: UIColor = .lightGray
        static let backgroundColor: UIColor = .clear
        static let nameFontSize: CGFloat = 20
        static let emailFontSize: CGFloat = 15
        static let statusFontSize: CGFloat = 16
        static let statusLabelWidth: CGFloat = 70
        static let activeStatusText: String = "Online"
        static let inactiveStatusText: String = "Offline"
        static let horizontalPadding: CGFloat = 20
        static let verticalPadding: CGFloat = 5
    }
}
