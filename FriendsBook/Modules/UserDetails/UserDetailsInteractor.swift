//
//  Project: FriendsBook
//  File: UserDetailsInteractor.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

import Foundation
import UIKit
import MessageUI
import MapKit

protocol UserDetailsBusinessLogic: AnyObject {
    func loadData(userId: Int)
    func createNextScreen(request: UserDetailsNextScreenModels.Request)
    func openLocation()
    func makeCall()
    func writeEmail()
}

final class UserDetailsInteractor {
    private let presenter: UserDetailsPresentationLogic
    private let dataWorker = DataWorker()
    private var userFriends: [UserModel] = []
    private var currentUser: UserModel?
    
    init(presenter: UserDetailsPresentationLogic) {
        self.presenter = presenter
    }
    
    private func getUserFriends(users: [UserModel], userId: Int) -> [UserModel] {
        let friendsIds = users.filter({ $0.id == userId })[0].friends
        let userFriends = users.filter({
            let user = $0
            return friendsIds.contains { friend in
                friend.id == user.id
            }
        })
        return userFriends
    }
}

extension UserDetailsInteractor: UserDetailsBusinessLogic {
    func loadData(userId: Int) {
        let users = dataWorker.loadData()
        guard !users.isEmpty else { return }
        currentUser = users.filter({ $0.id == userId })[0]
        guard let unwrCurrentUser = currentUser else { return }
        userFriends = getUserFriends(users: users, userId: userId)
        presenter.presentData(response: UserDetailsModels.Response(currentUser: unwrCurrentUser, userFriends: userFriends))
    }
    
    func createNextScreen(request: UserDetailsNextScreenModels.Request) {
        guard userFriends[request].isActive else { return }
        presenter.presentNextScreen(response: userFriends[request].id)
    }
    
    func openLocation() {
        let latitude: CLLocationDegrees = Double(currentUser?.latitude ?? 0)
        let longitude: CLLocationDegrees = Double(currentUser?.longitude ?? 0)
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = currentUser?.name
        mapItem.openInMaps(launchOptions: options)

    }
    
    func makeCall() {
        guard let phoneURL = URL(string: "tel://\(currentUser?.phone ?? "")") else { return }
        
        if UIApplication.shared.canOpenURL(phoneURL) {
            UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
        }
    }
    
    func writeEmail() {
        presenter.presentMail(response: currentUser?.email ?? "")
    }
}
