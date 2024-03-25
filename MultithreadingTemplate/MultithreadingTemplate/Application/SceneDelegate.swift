//
//  SceneDelegate.swift
//  MultithreadingTemplate
//
//  Created by Levon Shaxbazyan on 19.03.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = DetachedTaskViewController()
        window.makeKeyAndVisible()
        self.window = window
    }
}
