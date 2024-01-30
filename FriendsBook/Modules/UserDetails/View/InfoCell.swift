//
//  Project: FriendsBook
//  File: InfoCell.swift
//  Created by: Robert Bikmurzin
//  Date: 29.01.2024
//

import UIKit
import SnapKit

final class InfoCell: UITableViewCell {
    
    static let identifier = "InfoCell"
    
    private let nameView: UserDetailsHorizontalView = {
        let stackView = UserDetailsHorizontalView()
        return stackView
    }()
    
    private let ageView: UserDetailsHorizontalView = {
        let stackView = UserDetailsHorizontalView()
        return stackView
    }()
    
    private let companyView: UserDetailsHorizontalView = {
        let stackView = UserDetailsHorizontalView()
        return stackView
    }()
    
    private let registeredView: UserDetailsHorizontalView = {
        let stackView = UserDetailsHorizontalView()
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCellData(viewModel: UserDetailsModels.ViewModel.Info?) {
        nameView.setText(leftText: Constants.nameLeftText, rightText: viewModel?.name)
        ageView.setText(leftText: Constants.ageLeftText, rightText: viewModel?.age)
        companyView.setText(leftText: Constants.companyLeftText, rightText: viewModel?.company)
        registeredView.setText(leftText: Constants.registeredLeftText, rightText: viewModel?.registered)
    }
    
    private func makeConstraints() {
        addSubviews(views: [nameView, ageView, companyView, registeredView])
        nameView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(Constants.topPadding)
            make.horizontalEdges.equalToSuperview().inset(Constants.horizontalPadding)
            make.height.equalTo(Constants.heightViews)
        }
        ageView.snp.makeConstraints { make in
            make.top.equalTo(nameView.snp.bottom).offset(Constants.topPadding)
            make.horizontalEdges.equalToSuperview().inset(Constants.horizontalPadding)
            make.height.equalTo(Constants.heightViews)
        }
        companyView.snp.makeConstraints { make in
            make.top.equalTo(ageView.snp.bottom).offset(Constants.topPadding)
            make.horizontalEdges.equalToSuperview().inset(Constants.horizontalPadding)
            make.height.equalTo(Constants.heightViews)
        }
        registeredView.snp.makeConstraints { make in
            make.top.equalTo(companyView.snp.bottom).offset(Constants.topPadding)
            make.horizontalEdges.equalToSuperview().inset(Constants.horizontalPadding)
            make.height.equalTo(Constants.heightViews)
        }
        
    }
}

// MARK: - Constants
extension InfoCell {
    enum Constants {
        static let nameLeftText: String = "Name"
        static let ageLeftText: String = "Age"
        static let companyLeftText: String = "Company"
        static let registeredLeftText: String = "Registered"
        static let topPadding: CGFloat = 15
        static let horizontalPadding: CGFloat = 20
        static let heightViews: CGFloat = 20
    }
}
