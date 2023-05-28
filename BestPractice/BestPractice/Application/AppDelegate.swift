//
//  AppDelegate.swift
//  BestPractice
//
//  Created by Ruyther Costa on 12/05/22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    private lazy var mainWindow = UIWindow()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        configureStatusBarAppearance()
        
        // Create a navigation controller
        let navigationController = UINavigationController()

        // Initialize your first coordinator
        let appCoordinator = AppCoordinator(navigationController: navigationController)

        // Start the coordinator
        appCoordinator.start()

        // Set the navigation controller as the root view controller
        mainWindow = UIWindow(frame: UIScreen.main.bounds)
        mainWindow.backgroundColor = .white
        mainWindow.rootViewController = navigationController
        mainWindow.makeKeyAndVisible()

        return true
    }

    private func configureStatusBarAppearance() {
        UIView.appearance().overrideUserInterfaceStyle = .light
    }
}
