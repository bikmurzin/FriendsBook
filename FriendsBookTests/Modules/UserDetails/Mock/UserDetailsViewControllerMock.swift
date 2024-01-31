//
//  Project: FriendsBook
//  File: UserDetailsViewControllerMock.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

@testable import FriendsBook

final class UserDetailsViewControllerMock: UserDetailsDisplayLogic {
    private(set) var displayDataWasCalled = 0
    private(set) var receivedDisplayDataViewModel: UserDetailsModels.ViewModel!
    func displayData(viewModel: FriendsBook.UserDetailsModels.ViewModel) {
        displayDataWasCalled += 1
        receivedDisplayDataViewModel = viewModel
    }
    
    private(set) var displayNextScreenWasCalled = 0
    private(set) var receivedDisplayNextScreenViewModel: UserDetailsNextScreenModels.ViewModel!
    func displayNextScreen(viewModel: FriendsBook.UserDetailsNextScreenModels.ViewModel) {
        displayNextScreenWasCalled += 1
        receivedDisplayNextScreenViewModel = viewModel
    }
    
    private(set) var displayMailWasCalled = 0
    private(set) var receivedDisplayMailViewModel: UserDetailsMailSendingModels.ViewModel!
    func displayMail(viewModel: FriendsBook.UserDetailsMailSendingModels.ViewModel) {
        displayMailWasCalled += 1
        receivedDisplayMailViewModel = viewModel
    }
}
