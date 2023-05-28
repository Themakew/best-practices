//
//  AppCoordinator.swift
//  BestPractice
//
//  Created by Ruyther Costa on 24/05/22.
//

enum AppRouter {
    case start
}

final class AppCoordinator: BaseCoordinator<AppRouter> {

    // MARK: - Override Methods

    override func start() {
        handleRouteResult(route(to: .start))
    }

    override func route(to route: AppRouter) -> RouteResult {
        switch route {
        case .start:
            let coordinator = EventListCoordinator(navigationController: navigationController)
            addChildCoordinator(coordinator)
            coordinator.start()
            return .none
        }
    }
}
