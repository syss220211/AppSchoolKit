//
//  SceneDelegate.swift
//  AppSchoolKit
//
//  Created by 박서연 on 2023/06/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
//        let NavigationFirstViewController = UINavigationController(rootViewController: NavigationFirstViewController())
        /*
        let NavigationFirstViewController = NavigationFirstViewController()
        NavigationFirstViewController.tabBarItem = UITabBarItem(title: "First", image: UIImage(systemName: "pencil.circle"), tag: 0)
        
        let NavigationSecondViewController = UINavigationController(rootViewController: NavigationSecondViewController())
        NavigationSecondViewController.tabBarItem = UITabBarItem(title: "Second", image: UIImage(systemName: "eraser.fill"), tag: 1)
        
        let NavigationThirdViewController = UINavigationController(rootViewController: NavigationThirdViewController())
        NavigationThirdViewController.tabBarItem = UITabBarItem(title: "Third", image: UIImage(systemName: "heart.fill"), tag: 2)
        
        let NavigationFourthViewController = UINavigationController(rootViewController: NavigationFourthViewController())
        NavigationFourthViewController.tabBarItem = UITabBarItem(title: "Fourth", image: UIImage(systemName: "star.fill"), tag: 3)
        
        let NavigationFifthViewController = UINavigationController(rootViewController: NavigationFifthViewController())
        NavigationFifthViewController.tabBarItem = UITabBarItem(title: "Fifth", image: UIImage(systemName: "text.insert"), tag: 4)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [NavigationFirstViewController, NavigationSecondViewController, NavigationThirdViewController, NavigationFourthViewController, NavigationFifthViewController]
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
         */
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

