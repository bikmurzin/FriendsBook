//
//  Project: FriendsBook
//  File: UserDetailsRouter.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

import Foundation

protocol UserDetailsRoutingLogic: AnyObject {
    func routeToNextUserDetailsViewController(userId: Int)
}

final class UserDetailsRouter {
    weak var viewController: UserDetailsViewController?
    
    init(viewController: UserDetailsViewController? = nil) {
        self.viewController = viewController
    }
}

extension UserDetailsRouter: UserDetailsRoutingLogic {
    func routeToNextUserDetailsViewController(userId: Int) {
        DispatchQueue.main.async { [weak self] in
            let nextUserDetailsViewController = UserDetailsBuilder().build(userId: userId)
            guard let viewController = self?.viewController else { return }
            viewController.navigationController?.pushViewController(nextUserDetailsViewController, animated: true)
        }
    }
}
