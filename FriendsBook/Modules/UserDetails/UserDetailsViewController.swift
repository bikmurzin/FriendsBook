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
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = "\(Constants.navigationTitle) \(userId)"
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
        } else {
            // show failure alert
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
    
    func makeCall(phone: String) {
        self.interactor.makeCall()
    }
    
    func writeEmail() {
        interactor.writeEmail()
    }
    
    func didSelectFriend(friendId: Int) {
        interactor.createNextScreen(request: friendId)
    }
}

// MARK: - Constants
extension UserDetailsViewController {
    enum Constants {
        static let callActionTitle: String = "Call"
        static let cancelActionTitle: String = "Cancel"
        static let navigationTitle: String = "User Id:"
        static let testViewModel = UserDetailsModels.ViewModel(
            info: UserDetailsModels.ViewModel.Info(name: "Bikmurzin Robert", age: "28", company: "Freelance", registered: "22.02.2022"),
            about: "Eu Lorem commodo nisi exercitation dolore. Eiusmod officia mollit proident labore ea nostrud elit esse sit commodo. Magna sunt nostrud magna irure magna exercitation ipsum ullamco irure nostrud.\r\n",
            contacts: UserDetailsModels.ViewModel.Contacts(email: "bikmurzinrm@gmail.com", phone: "+7 963 911 12 03", address: "Samara, samarskaya oblast, s'ezdovskaya, 9, 45"),
            location: "22'' 23' 3232'",
            friends: [UserViewModel.User(id: 1, name: "Potap", email: "potap@gmail.com", isActive: true)],
            additionalInfo: UserDetailsModels.ViewModel.AdditionalInfo(eyeColor: .green, favoriteFruitImage: UIImage(systemName: "apple.logo")))
    }
}
