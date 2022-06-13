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
    private let router = AppCoordinator().strongRouter

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureUI()
        router.setRoot(for: mainWindow)
        return true
    }

    private func configureUI() {
        UIView.appearance().overrideUserInterfaceStyle = .light
    }

}
