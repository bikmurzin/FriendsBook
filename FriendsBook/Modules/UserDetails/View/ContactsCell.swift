//
//  Project: FriendsBook
//  File: ContactsCell.swift
//  Created by: Robert Bikmurzin
//  Date: 29.01.2024
//

import UIKit
import SnapKit

final class ContactsCell: UITableViewCell {
    
    static let identifier = "ContactsCell"
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.addressTextColor
        label.font = .systemFont(ofSize: Constants.addressTextSize)
        label.numberOfLines = 0
        return label
    }()
    
    private let emailButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(Constants.buttonsColor, for: .normal)
        return button
    }()
    
    private let phoneButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(Constants.buttonsColor, for: .normal)
        return button
    }()
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = Constants.stackViewSpacing
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCellData(viewModel: UserDetailsModels.ViewModel.Contacts?) {
        addressLabel.text = viewModel?.address
        emailButton.setTitle(viewModel?.email, for: .normal)
        phoneButton.setTitle(viewModel?.phone, for: .normal)
    }
    
    private func makeConstraints() {
        addSubview(verticalStackView)
        verticalStackView.addArrangedSubviews(views: [phoneButton, emailButton, addressLabel])
        verticalStackView.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(Constants.horizontalPadding)
            make.verticalEdges.equalToSuperview().inset(Constants.verticalPadding)
        }
    }
}

// MARK: - Constants
extension ContactsCell {
    enum Constants {
    static let addressTextColor: UIColor = .label
        static let addressTextSize: CGFloat = 18
        static let stackViewSpacing: CGFloat = 15
        static let horizontalPadding: CGFloat = 20
        static let verticalPadding: CGFloat = 5
        static let buttonsColor: UIColor = .blue
        
    }
}
