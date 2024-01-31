//
//  Project: FriendsBook
//  File: FriendListPresenterMock.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

@testable import FriendsBook

final class FriendListPresenterMock: FriendsListPresentationLogic {
    
    private(set) var presentDataWasCalled = 0
    private(set) var receivedPresentDataResponse: FriendsListModels.Response!
    func presentData(response: FriendsBook.FriendsListModels.Response) {
        presentDataWasCalled += 1
        receivedPresentDataResponse = response
    }
    
    private(set) var presentRefreshedDataWasCalled = 0
    private(set) var receivedPresentRefreshedData: FriendsListModels.Response!
    func presentRefreshedData(response: FriendsBook.FriendsListModels.Response) {
        presentRefreshedDataWasCalled += 1
        receivedPresentRefreshedData = response
    }
    
    private(set) var presentNextScreenDataWasCalled = 0
    private(set) var receivedPresentNextScreenDataResponse: FriendsListNextScreenModels.Response!
    func presentNextScreenData(response: FriendsBook.FriendsListNextScreenModels.Response) {
        presentNextScreenDataWasCalled += 1
        receivedPresentNextScreenDataResponse = response
    }
    
    
}
