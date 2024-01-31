//
//  Project: FriendsBook
//  File: UserDetailsViewController.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

import UIKit
import MessageUI

protocol UserDetailsDisplayLogic: AnyObject {
    func displayData(viewModel: UserDetailsModels.ViewModel)
    func displayNextScreen(viewModel: UserDetailsNextScreenModels.ViewModel)
    func displayMail(viewModel: UserDetailsMailSendingModels.ViewModel)
}

final class UserDetailsViewController: UIViewController {
    private let interactor: UserDetailsBusinessLogic
    private let router: UserDetailsRoutingLogic
    private let userId: Int
    private let userDetailsView = UserDetailsView()
    
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
        view = userDetailsView
        userDetailsView.delegate = self
        interactor.loadData(userId: userId)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
    
    private func sendEmail(email: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([email])
            mail.setMessageBody("", isHTML: true)

            present(mail, animated: true)
        }
    }
}

extension UserDetailsViewController: UserDetailsDisplayLogic, MFMailComposeViewControllerDelegate {
    func displayData(viewModel: UserDetailsModels.ViewModel) {
        userDetailsView.updateView(viewModel: viewModel)
    }
    
    func displayNextScreen(viewModel: UserDetailsNextScreenModels.ViewModel) {
        router.routeToNextUserDetailsViewController(userId: viewModel)
    }
    
    func displayMail(viewModel: UserDetailsMailSendingModels.ViewModel) {
        sendEmail(email: viewModel)
    }
    
    
}

// MARK: - DisplayUserDetails
extension UserDetailsViewController: DisplayUserDetails {
    func openLocation() {
        interactor.openLocation()
    }
    
    func makeCall() {
        self.interactor.makeCall()
    }
    
    func writeEmail() {
        interactor.writeEmail()
    }
    
    func didSelectFriend(friendId: Int) {
        interactor.createNextScreen(request: friendId)
    }
}
