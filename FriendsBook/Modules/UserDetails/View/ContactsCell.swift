//
//  Project: FriendsBook
//  File: ContactsCell.swift
//  Created by: Robert Bikmurzin
//  Date: 29.01.2024
//

import UIKit
import SnapKit

protocol IContactsCellHandler: AnyObject {
    func emailButtonDidTap()
    func phoneButtonDidTap()
}

final class ContactsCell: UITableViewCell {
    
    static let identifier = "ContactsCell"
    weak var delegate: IContactsCellHandler?
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.addressTextColor
        label.font = .systemFont(ofSize: Constants.addressTextSize)
        label.numberOfLines = 0
        return label
    }()
    
    private let emailButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let phoneButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(phoneButtonTapped), for: .touchUpInside)
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
        contentView.addSubviews(views: [emailButton, phoneButton])
        addSubview(addressLabel)
        phoneButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.firstContactTopPadding)
            make.leading.equalToSuperview().inset(Constants.horizontalPadding)
        }
        emailButton.snp.makeConstraints { make in
            make.top.equalTo(phoneButton.snp.bottom).offset(Constants.topPadding)
            make.leading.equalToSuperview().inset(Constants.horizontalPadding)
        }
        addressLabel.snp.makeConstraints { make in
            make.top.equalTo(emailButton.snp.bottom).offset(Constants.topPadding)
            make.horizontalEdges.equalToSuperview().inset(Constants.horizontalPadding)
        }
    }
    
    @objc
    private func emailButtonTapped() {
        print("emailButtonTapped")
        delegate?.emailButtonDidTap()
    }
    
    @objc
    private func phoneButtonTapped() {
        print("phoneButtonTapped")
        delegate?.phoneButtonDidTap()
    }
}

// MARK: - Constants
extension ContactsCell {
    enum Constants {
    static let addressTextColor: UIColor = .label
        static let addressTextSize: CGFloat = 18
        static let stackViewSpacing: CGFloat = 15
        static let horizontalPadding: CGFloat = 20
        static let topPadding: CGFloat = 15
        static let firstContactTopPadding: CGFloat = 10
        static let buttonsColor: UIColor = .blue
        
    }
}
