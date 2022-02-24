//
//  SceneDelegate.swift
//  Weather App
//
//  Created by Bruno Benčević on 9/5/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var rootCoordinator: Coordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        if rootCoordinator == nil {
            rootCoordinator = RootCoordinator()
        }
        
        window!.rootViewController = rootCoordinator?.start()
        window!.makeKeyAndVisible()
    }
}
