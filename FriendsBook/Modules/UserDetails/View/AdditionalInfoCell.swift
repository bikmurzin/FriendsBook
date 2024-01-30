//
//  Project: FriendsBook
//  File: AdditionalInfoCell.swift
//  Created by: Robert Bikmurzin
//  Date: 29.01.2024
//

import UIKit
import SnapKit

final class AdditionalInfoCell: UITableViewCell {
    
    static let identifier = "AdditionalInfoCell"
    
    private let eyeColorLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.labelsTextColor
        label.font = .systemFont(ofSize: Constants.labelsTextSize)
        return label
    }()
    
    private let favoriteFruitLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.labelsTextColor
        label.font = .systemFont(ofSize: Constants.labelsTextSize)
        return label
    }()
    
    private let eyeColorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.eyeColorViewSize / 2
        view.layer.masksToBounds = true
        return view
    }()
    
    private let favoriteFruitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCellData(viewModel: UserDetailsModels.ViewModel.AdditionalInfo?) {
        eyeColorLabel.text = Constants.eyeColorText
        favoriteFruitLabel.text = Constants.favoriteFruitText
        eyeColorView.backgroundColor = viewModel?.eyeColor
        favoriteFruitImageView.image = viewModel?.favoriteFruitImage
    }
    
    private func makeConstraints() {
        addSubviews(views: [eyeColorLabel, favoriteFruitLabel, eyeColorView, favoriteFruitImageView])
        eyeColorLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Constants.horizontalPadding)
            make.top.equalToSuperview().inset(Constants.topPadding)
        }
        favoriteFruitLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Constants.horizontalPadding)
            make.top.equalTo(eyeColorLabel.snp.bottom).offset(Constants.topPadding)
        }
        eyeColorView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(Constants.horizontalPadding)
            make.top.equalToSuperview().inset(Constants.topPadding)
            make.width.height.equalTo(Constants.eyeColorViewSize)
        }
        favoriteFruitImageView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(Constants.horizontalPadding)
            make.top.equalTo(eyeColorLabel.snp.bottom).offset(Constants.topPadding)
            make.width.height.equalTo(Constants.favoriteFruitImageViewSize)
        }
    }
}

// MARK: - Constants
extension AdditionalInfoCell {
    enum Constants {
        static let eyeColorText: String = "Eye Color"
        static let favoriteFruitText: String = "Favorite Fruit"
        static let topPadding: CGFloat = 20
        static let horizontalPadding: CGFloat = 20
        static let eyeColorViewSize: CGFloat = 15
        static let favoriteFruitImageViewSize: CGFloat = 25
        static let labelsTextColor: UIColor = .secondaryLabel
        static let labelsTextSize: CGFloat = 15
    }
}
