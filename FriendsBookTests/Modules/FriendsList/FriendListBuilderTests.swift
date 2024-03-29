//
//  Project: FriendsBook
//  File: FriendListBuilderTests.swift
//  Created by: Robert Bikmurzin
//  Date: 31.01.2024
//

import Quick
import Nimble
import UIKit
@testable import FriendsBook

final class FriendListBuilderTests: QuickSpec {
    override class func spec() {
        var friendListBuilder: FriendsListBuilder!
        var result: UIViewController!
        
        beforeEach {
            friendListBuilder = FriendsListBuilder()
            result = UIViewController()
        }
        
        describe(".build") {
            it("should return a valid UIViewController") {
                // when
                result = friendListBuilder.build()
                
                // then
                expect(result).to(beAKindOf(FriendsListViewController.self))
            }
        }
    }
}
