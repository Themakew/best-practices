//
//  BaseCoordinator.swift
//  BestPractice
//
//  Created by Ruyther Costa on 27/05/23.
//

import UIKit

class BaseCoordinator<RouteType>: Coordinator {

    var currentRoute: RouteType?
    var childCoordinators: [any Coordinator]?

    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        fatalError("Start method must be implemented by subclass")
    }

    func route(to route: RouteType) -> RouteResult {
        fatalError("Route method must be implemented by subclass")
    }
}
