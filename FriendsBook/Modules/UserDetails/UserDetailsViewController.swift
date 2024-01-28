//
//  Project: FriendsBook
//  File: UserDetailsViewController.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

import UIKit

protocol UserDetailsDisplayLogic: AnyObject {
    
}

final class UserDetailsViewController: UIViewController {
    private let interactor: UserDetailsBusinessLogic
    private let router: UserDetailsRoutingLogic
    private let userId: Int
    
    init(interactor: UserDetailsBusinessLogic, router: UserDetailsRoutingLogic, userId: Int) {
        self.interactor = interactor
        self.router = router
        self.userId = userId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

extension UserDetailsViewController: UserDetailsDisplayLogic {
    
}
