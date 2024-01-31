//
//  Project: FriendsBook
//  File: UserDetailsPresenter.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

import UIKit
import CoreLocation

protocol UserDetailsPresentationLogic: AnyObject {
    func presentData(response: UserDetailsModels.Response)
    func presentNextScreen(response: UserDetailsNextScreenModels.Response)
    func presentMail(response: UserDetailsMailSendingModels.Response)
}

final class UserDetailsPresenter {
    
    weak var viewController: UserDetailsDisplayLogic?
    
    private func makeViewModel(response: UserDetailsModels.Response) -> UserDetailsModels.ViewModel {
        let registered = formatDate(date: stringToDate(isoDate: response.currentUser.registered))
        let location = CLLocation(latitude: response.currentUser.latitude, longitude: response.currentUser.longitude)
        let friends = response.userFriends.map { user in
            UserViewModel.User(id: user.id, name: user.name, email: user.email, isActive: user.isActive)
        }
        var eyeColor: UIColor = .black
        switch response.currentUser.eyeColor {
        case "green":
            eyeColor = Constants.greenColor
        case "brown":
            eyeColor = Constants.brownColor
        case "blue":
            eyeColor = Constants.blueColor
        default:
            break
        }
        var fruitImage = UIImage(named: response.currentUser.favoriteFruit)
        let viewModel = UserDetailsModels.ViewModel(
            info: UserDetailsModels.ViewModel.Info(name: response.currentUser.name, age: String(response.currentUser.age), company: response.currentUser.company, registered: registered),
            about: response.currentUser.about,
            contacts: UserDetailsModels.ViewModel.Contacts(email: response.currentUser.email, phone: response.currentUser.phone, address: response.currentUser.address),
            location: location.dms,
            friends: friends,
            additionalInfo: UserDetailsModels.ViewModel.AdditionalInfo(eyeColor: eyeColor, favoriteFruitImage: fruitImage))
        return viewModel
    }
    
    private func stringToDate(isoDate: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from:isoDate)!
    }
    
    private func formatDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "HH:mm dd.MM.yy"
        return dateFormatter.string(from: date)
    }
}

// MARK: - UserDetailsPresentationLogic
extension UserDetailsPresenter: UserDetailsPresentationLogic {
    func presentData(response: UserDetailsModels.Response) {
        viewController?.displayData(viewModel: makeViewModel(response: response))
    }
    
    func presentNextScreen(response: UserDetailsNextScreenModels.Response) {
        viewController?.displayNextScreen(viewModel: response)
    }
    
    func presentMail(response: UserDetailsMailSendingModels.Response) {
        viewController?.displayMail(viewModel: response)
    }
}

// MARK: - Constants
extension UserDetailsPresenter {
    enum Constants {
        static let greenColor: UIColor = UIColor(red: 25/255.0, green: 163/255.0, blue: 55/255.0, alpha: 1)
        static let brownColor: UIColor = UIColor(red: 94/255.0, green: 72/255.0, blue: 30/255.0, alpha: 1)
        static let blueColor: UIColor = UIColor(red: 67/255.0, green: 101/255.0, blue: 128/255.0, alpha: 1)
    }
}
