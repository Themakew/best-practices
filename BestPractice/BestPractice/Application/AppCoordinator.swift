//
//  AppCoordinator.swift
//  BestPractice
//
//  Created by Ruyther Costa on 24/05/22.
//

import UIKit
import XCoordinator

enum AppRouter: Route {
    case start
}

final class AppCoordinator: NavigationCoordinator<AppRouter> {

    // MARK: - Initializer

    init() {
        super.init(initialRoute: .start)
    }

    // MARK: - Override Methods

    override func prepareTransition(for route: AppRouter) -> NavigationTransition {
        switch route {
        case .start:
            let viewModel = EventListViewModel()
            let viewController = EventListViewController(viewMoldel: viewModel)
            return .push(viewController)
        }
    }

}
