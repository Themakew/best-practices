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
        $0.spacing = Styles.Spacing.default
    }

    private let locationIconImageView = UIImageView(translateMask: false).apply {
        $0.contentMode = .scaleAspectFit
    }

    private let locationLabel = UILabel(translateMask: false).apply {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: Styles.Size.regular, weight: .regular)
        $0.textAlignment = .left
        $0.numberOfLines = 1
        $0.lineBreakMode = .byTruncatingTail
    }

    private let dateIconImageView = UIImageView(translateMask: false).apply {
        $0.contentMode = .scaleAspectFit
    }

    private let dateIconLabel = UILabel(translateMask: false).apply {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: Styles.Size.regular, weight: .regular)
        $0.textAlignment = .left
        $0.numberOfLines = 1
        $0.lineBreakMode = .byTruncatingTail
    }

    private let priceIconImageView = UIImageView(translateMask: false).apply {
        $0.contentMode = .scaleAspectFit
    }

    private let priceIconLabel = UILabel(translateMask: false).apply {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: Styles.Size.regular, weight: .regular)
        $0.textAlignment = .left
        $0.numberOfLines = 1
        $0.lineBreakMode = .byTruncatingTail
    }

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
        baseStackView.addArrangedSubview(locationIconImageView)
        baseStackView.addArrangedSubview(locationLabel)
        baseStackView.addArrangedSubview(dateIconImageView)
        baseStackView.addArrangedSubview(dateIconLabel)
        baseStackView.addArrangedSubview(priceIconImageView)
        baseStackView.addArrangedSubview(priceIconLabel)

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
        let locationIconURL: URL
        let locationText: String
        let dateIconURL: URL
        let dateIconText: String
        let priceIconURL: URL
        let priceIconText: String
    }

    func configure(content: Configuration) {
//        locationIconImageView.image = content.locationIconImage
        locationLabel.text = content.locationText
//        dateIconImageView.image = content.dateIconImageView
        dateIconLabel.text = content.dateIconText
//        priceIconImageView.image = content.priceIconImage
        priceIconLabel.text = content.priceIconText
    }
}
