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
    private let disposeBag = DisposeBag()

    private var dataSource: UICollectionViewDiffableDataSource<EventListViewModel.SectionType, EventListViewModel.Row>?
    private lazy var collectionViewLayout = buildCompositionalLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout).apply {
        $0.backgroundColor = .white
        $0.contentInsetAdjustmentBehavior = .never
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = false
        $0.translatesAutoresizingMaskIntoConstraints = false
    }

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
        setupView()
        bind()

        navigationController?.navigationBar.topItem?.title = "Events"
    }

    // MARK: - Private Methods

    private func buildCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let sectionProvider = { (_: Int, _: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let estimatedHeight: CGFloat = 100
            let rowItemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(estimatedHeight)
            )
            let rowItem = NSCollectionLayoutItem(layoutSize: rowItemSize)
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .estimated(estimatedHeight)
            )
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: rowItem, count: 1)
            let section = NSCollectionLayoutSection(group: group)
            return section
        }

        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
        return layout
    }
}

// MARK: - ViewCode Extension

extension EventListViewController: ViewCode {
    func buildViewHierarchy() {
        view.addSubview(collectionView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func setupAdditionalConfiguration() {
        collectionView.register(cellClass: EventDescriptionCell.self)
    }
}

// MARK: - Bind Extension

extension EventListViewController {
    func bind() {
        bindDataSource()
    }
}

// MARK: - CollectionView DataSource Extension

extension EventListViewController {
    func bindDataSource() {
        dataSource = UICollectionViewDiffableDataSource<EventListViewModel.SectionType, EventListViewModel.Row>(
            collectionView: collectionView
        ) { [weak self] _, indexPath, row -> UICollectionViewCell? in
            guard let self = self else {
                return nil
            }

            switch row {
            case let .eventDescription(content):
                return self.getEventDescriptionCell(content: content, indexPath: indexPath)
            }
        }

        viewModel.output.dataSource
            .map { data -> NSDiffableDataSourceSnapshot in
                var snapshot = NSDiffableDataSourceSnapshot<EventListViewModel.SectionType, EventListViewModel.Row>()
                snapshot.appendSections(data.map { $0.key })

                data.forEach {
                    snapshot.appendItems($0.value, toSection: $0.key)
                }
                return snapshot
            }
            .subscribe(onNext: { [weak self] snapshot in
                self?.dataSource?.apply(snapshot, animatingDifferences: false)
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Cells Extension

extension EventListViewController {
    func getEventDescriptionCell(content: EventDescriptionCell.Configuration, indexPath: IndexPath) -> EventDescriptionCell {
        let cell = collectionView.dequeue(cellClass: EventDescriptionCell.self, indexPath: indexPath)
        cell.configure(content: content)
        return cell
    }
}
