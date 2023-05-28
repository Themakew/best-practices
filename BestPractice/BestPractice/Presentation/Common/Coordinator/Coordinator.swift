//
//  Coordinator.swift
//  BestPractice
//
//  Created by Ruyther Costa on 27/05/23.
//

import UIKit

protocol Coordinator: AnyObject {
    associatedtype RouteType

    var childCoordinators: [any Coordinator]? { get set }
    var currentRoute: RouteType? { get set }
    var navigationController: UINavigationController { get }

    func start()
    func route(to route: RouteType) -> RouteResult
}

extension Coordinator {
    func addChildCoordinator(_ coordinator: any Coordinator) {
        childCoordinators?.append(coordinator)
    }

    func removeChildCoordinator(_ coordinator: any Coordinator) {
        childCoordinators = childCoordinators?.filter { $0 !== coordinator }
    }

    func removeAllChildCoordinators() {
        childCoordinators?.removeAll()
    }

    func handleRouteResult(_ routeResult: RouteResult) {
        switch routeResult {
        case let .present(viewController, animated, completion):
            navigationController.present(viewController, animated: animated, completion: completion)
        case let .push(viewController, animated):
            navigationController.pushViewController(viewController, animated: animated)
        case let .pop(animated):
            navigationController.popViewController(animated: animated)
        case let .dismiss( animated, completion):
            navigationController.dismiss(animated: animated, completion: completion)
        case .none:
            break
        }
    }
}

enum RouteResult {
    case present(UIViewController, animated: Bool, completion: (() -> Void)? = nil)
    case push(UIViewController, animated: Bool)
    case pop(animated: Bool)
    case dismiss(animated: Bool, completion: (() -> Void)? = nil)
    case none
}

extension RouteResult: Equatable {
    public static func == (lhs: RouteResult, rhs: RouteResult) -> Bool {
        switch (lhs, rhs) {
        case let (.present(lvc, lanimated, lcompletion), .present(rvc, ranimated, rcompletion)):
            return lvc == rvc && lanimated == ranimated && lcompletion as AnyObject === rcompletion as AnyObject
        case let (.push(lvc, lanimated), .push(rvc, ranimated)):
            return lvc == rvc && lanimated == ranimated
        case let (.pop(lanimated), .pop(ranimated)):
            return lanimated == ranimated
        case let (.dismiss(lanimated, lcompletion), .dismiss(ranimated, rcompletion)):
            return lanimated == ranimated && lcompletion as AnyObject === rcompletion as AnyObject
        case (.none, .none):
            return true
        default:
            return false
        }
    }
}
