//
//  Project: FriendsBook
//  File: SceneDelegate.swift
//  Created by: Robert Bikmurzin
//  Date: 26.01.2024
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = UINavigationController(rootViewController: FriendsListBuilder().build())
        window?.makeKeyAndVisible()
    }
}

