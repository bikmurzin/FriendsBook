//
//  Project: FriendsBook
//  File: FriendListInteractorMock.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

@testable import FriendsBook

final class FriendListInteractorMock: FriendsListBusinessLogic {
    
    private(set) var loadDataWasCalled = 0
    func loadData() {
        loadDataWasCalled += 1
    }
    
    private(set) var refreshDataWasCalled = 0
    func refreshData() {
        refreshDataWasCalled += 1
    }
    
    private(set) var loadNextScreenDataWasCalled = 0
    private(set) var receivedLoadNextScreenDataRequest: FriendsListNextScreenModels.Request!
    func loadNextScreenData(request: FriendsBook.FriendsListNextScreenModels.Request) {
        loadNextScreenDataWasCalled += 1
        receivedLoadNextScreenDataRequest = request
    }
}
