//
//  EventListCoordinator.swift
//  BestPractice
//
//  Created by Ruyther Costa on 16/09/22.
//

import XCoordinator

enum EventListRouter: Route {
    case start
}

final class EventListCoordinator: NavigationCoordinator<EventListRouter> {

    // MARK: - Initializer

    init() {
        super.init(initialRoute: .start)
    }

    // MARK: - Override Methods

    override func prepareTransition(for route: EventListRouter) -> NavigationTransition {
        switch route {
        case .start:
            let viewModel = EventListViewModel()
            let viewController = EventListViewController(viewMoldel: viewModel)
            return .push(viewController)
        }
    }

}
