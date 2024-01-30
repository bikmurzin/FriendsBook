//
//  Project: FriendsBook
//  File: UIView+Extensions.swift
//  Created by: Robert Bikmurzin
//  Date: 29.01.2024
//

import UIKit

extension UIView {
    func addSubviews(views: [UIView]) {
        for view in views {
            addSubview(view)
        }
    }
}
