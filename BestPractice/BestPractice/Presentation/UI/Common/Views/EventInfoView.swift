//
//  EventInfoView.swift
//  BestPractice
//
//  Created by Ruyther Costa on 04/10/22.
//

import UIKit

final class EventInfoView: UIView {

    // MARK: - Private properties

    private let baseStackView = UIStackView(translateMask: false).apply {
        $0.distribution = .fill
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = Styles.Spacing.large
    }

    private let locationDetailView = EventInfoDetailView(translateMask: false)
    private let dateDetailView = EventInfoDetailView(translateMask: false)
    private let priceDetailView = EventInfoDetailView(translateMask: false)

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCode Extension

extension EventInfoView: ViewCode {
    func buildViewHierarchy() {
        baseStackView.addArrangedSubview(locationDetailView)
        baseStackView.addArrangedSubview(dateDetailView)
        baseStackView.addArrangedSubview(priceDetailView)

        addSubview(baseStackView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            baseStackView.topAnchor.constraint(equalTo: topAnchor),
            baseStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            baseStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

// MARK: - Configurable Extension

extension EventInfoView: Configurable {
    typealias Configuration = EventDescriptionContent

    struct EventDescriptionContent: Hashable {
        let locationDetailContent: EventInfoDetailView.Configuration
        let dateDetailContent: EventInfoDetailView.Configuration
        let priceDetailContent: EventInfoDetailView.Configuration
    }

    func configure(content: Configuration) {
        locationDetailView.configure(content: content.locationDetailContent)
        dateDetailView.configure(content: content.dateDetailContent)
        priceDetailView.configure(content: content.priceDetailContent)
    }
}
