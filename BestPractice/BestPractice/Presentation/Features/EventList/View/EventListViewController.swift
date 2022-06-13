//
//  EventListViewController.swift
//  BestPractice
//
//  Created by Ruyther Costa on 12/06/22.
//

import RxCocoa
import RxSwift
import UIKit

final class EventListViewController: UIViewController {

    // MARK: - Private properties

    private let viewModel: EventListViewModelProtocol

    // MARK: - Initializer

    init(viewMoldel: EventListViewModelProtocol) {
        self.viewModel = viewMoldel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }

}
