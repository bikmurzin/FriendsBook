//
//  Project: FriendsBook
//  File: FriendsListViewController.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

import UIKit

protocol FriendsListDisplayLogic: AnyObject {
    
}

final class FriendsListViewController: UIViewController {
    private let interactor: FriendsListBusinessLogic
    private let userId: Int?
    
    init(interactor: FriendsListBusinessLogic, userId: Int?) {
        self.interactor = interactor
        self.userId = userId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.loadData(request: FriendsListModels.Request(userId: userId))
    }
}

extension FriendsListViewController: FriendsListDisplayLogic {
    
}
