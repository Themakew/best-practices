//
//  EventListCoordinator.swift
//  BestPractice
//
//  Created by Ruyther Costa on 16/09/22.
//

enum EventListRouter {
    case start
}

final class EventListCoordinator: BaseCoordinator<EventListRouter> {

    // MARK: - Override Methods

    override func start() {
        handleRouteResult(route(to: .start))
    }

    override func route(to route: EventListRouter) -> RouteResult {
        switch route {
        case .start:
            let viewModel = EventListViewModel()
            let viewController = EventListViewController(viewMoldel: viewModel)
            return .push(viewController, animated: true)
        }
    }
}
