//
//  Project: FriendsBook
//  File: UIStackView+Extensions.swift
//  Created by: Robert Bikmurzin
//  Date: 29.01.2024
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
