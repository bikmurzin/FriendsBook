//
//  Project: FriendsBook
//  File: FriendListViewControllerMock.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

@testable import FriendsBook

final class FriendListViewControllerMock: FriendsListDisplayLogic {
    
    private(set) var displayDataWasCalled = 0
    private(set) var receivedDisplayDataViewModel: FriendsListModels.ViewModel!
    func displayData(viewModel: FriendsBook.FriendsListModels.ViewModel) {
        displayDataWasCalled += 1
        receivedDisplayDataViewModel = viewModel
    }
    
    private(set) var displayRefreshedDataWasCalled = 0
    private(set) var receivedDisplayRefreshedDataViewModel: FriendsListModels.ViewModel!
    func displayRefreshedData(viewModel: FriendsBook.FriendsListModels.ViewModel) {
        displayRefreshedDataWasCalled += 1
        receivedDisplayRefreshedDataViewModel = viewModel
    }
    
    private(set) var displayNextScreenWasCalled = 0
    private(set) var receivedDisplayNextScreenViewModel: FriendsListNextScreenModels.ViewModel!
    func displayNextScreen(viewModel: FriendsBook.FriendsListNextScreenModels.ViewModel) {
        displayNextScreenWasCalled += 1
        receivedDisplayNextScreenViewModel = viewModel
    }
}
