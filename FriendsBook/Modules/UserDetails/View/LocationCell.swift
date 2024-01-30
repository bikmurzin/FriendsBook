//
//  Project: FriendsBook
//  File: LocationCell.swift
//  Created by: Robert Bikmurzin
//  Date: 29.01.2024
//

import UIKit
import SnapKit

final class LocationCell: UITableViewCell {
    
    static let identifier = "LocationCell"
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.textColor
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
        locationLabel.text = viewModel
    }
    
    private func makeConstraints() {
        addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(Constants.horizontalPadding)
        }
    }
}

// MARK: - Constants
extension LocationCell {
    enum Constants {
        static let horizontalPadding: CGFloat = 20
        static let textColor: UIColor = .blue
    }
}
