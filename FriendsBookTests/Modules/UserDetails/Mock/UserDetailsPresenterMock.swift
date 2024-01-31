//
//  Project: FriendsBook
//  File: UserDetailsPresenterMock.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

@testable import FriendsBook

final class UserDetailsPresenterMock: UserDetailsPresentationLogic {
    private(set) var presentDataWasCalled = 0
    private(set) var receivedPresentDataResponse: UserDetailsModels.Response!
    func presentData(response: FriendsBook.UserDetailsModels.Response) {
        presentDataWasCalled += 1
        receivedPresentDataResponse = response
    }
    
    private(set) var presentNextScreenWasCalled = 0
    private(set) var receivedPresentNextScreenResponse: UserDetailsNextScreenModels.Response!
    func presentNextScreen(response: FriendsBook.UserDetailsNextScreenModels.Response) {
        presentNextScreenWasCalled += 1
        receivedPresentNextScreenResponse = response
    }
    
    private(set) var presentMailWasCalled = 0
    private(set) var receivedPresentMailResponse: UserDetailsMailSendingModels.Response!
    func presentMail(response: FriendsBook.UserDetailsMailSendingModels.Response) {
        presentMailWasCalled += 1
        receivedPresentMailResponse = response
    }
}
