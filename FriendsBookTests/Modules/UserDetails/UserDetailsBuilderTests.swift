//
//  Project: FriendsBook
//  File: UserDetailsBuilderTests.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

import Quick
import Nimble
import UIKit
@testable import FriendsBook

final class UserDetailsBuilderTests: QuickSpec {
    override class func spec() {
        var userDetailsBuilder: UserDetailsBuilder!
        var result: UIViewController!
        
        beforeEach {
            userDetailsBuilder = UserDetailsBuilder()
            result = UIViewController()
        }
        
        describe(".build") {
            it("should return a valid UIViewController") {
                // when
                result = userDetailsBuilder.build(userId: Constants.userId)
                
                // then
                expect(result).to(beAKindOf(UserDetailsViewController.self))
            }
        }
    }
}

extension UserDetailsBuilderTests {
    enum Constants {
        static let userId = 1
    }
}
