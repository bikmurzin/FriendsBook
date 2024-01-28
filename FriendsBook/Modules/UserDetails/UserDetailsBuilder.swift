//
//  Project: FriendsBook
//  File: UserDetailsBuilder.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

import UIKit

protocol UserDetailsBuildLogic: AnyObject {
    func build(userId: Int) -> UIViewController
}

final class UserDetailsBuilder: UserDetailsBuildLogic {
    func build(userId: Int) -> UIViewController {
        let presenter = UserDetailsPresenter()
        let interactor = UserDetailsInteractor(presenter: presenter)
        let router = UserDetailsRouter()
        let viewController = UserDetailsViewController(interactor: interactor, router: router, userId: userId)
        router.viewController = viewController

        presenter.viewController = viewController
        return viewController
    }
}
