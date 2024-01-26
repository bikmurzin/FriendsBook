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
    private let userId: Int
    
    init(interactor: UserDetailsBusinessLogic, userId: Int) {
        self.interactor = interactor
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
