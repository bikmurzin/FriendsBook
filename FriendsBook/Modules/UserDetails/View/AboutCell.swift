//
//  Project: FriendsBook
//  File: AboutCell.swift
//  Created by: Robert Bikmurzin
//  Date: 29.01.2024
//

import UIKit
import SnapKit

final class AboutCell: UITableViewCell {
    
    static let identifier = "AboutCell"
    
    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.textColor
        label.font = .systemFont(ofSize: Constants.fontSize)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCellData(viewModel: String?) {
        aboutLabel.text = viewModel
    }
    
    private func makeConstraints() {
        addSubview(aboutLabel)
        aboutLabel.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(Constants.horizontalPadding)
            make.verticalEdges.equalToSuperview().inset(Constants.verticalPadding)
        }
    }
}

// MARK: - Constants
extension AboutCell {
    enum Constants {
        static let fontSize: CGFloat = 18
        static let textColor: UIColor = .label
        static let horizontalPadding: CGFloat = 20
        static let verticalPadding: CGFloat = 5
    }
}
