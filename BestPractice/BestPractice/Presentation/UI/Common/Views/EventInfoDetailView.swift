//
//  EventInfoDetailView.swift
//  BestPractice
//
//  Created by Ruyther Costa on 07/10/22.
//

import UIKit

final class EventInfoDetailView: UIView {

    // MARK: - Private properties

    private let baseStackView = UIStackView(translateMask: false).apply {
        $0.distribution = .fill
        $0.axis = .horizontal
        $0.alignment = .center
        $0.spacing = Styles.Spacing.small
    }

    private let iconImageView = UIImageView(translateMask: false).apply {
        $0.contentMode = .scaleAspectFit
    }

    private let detailLabel = UILabel(translateMask: false).apply {
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

extension EventInfoDetailView: ViewCode {
    func buildViewHierarchy() {
        baseStackView.addArrangedSubview(iconImageView)
        baseStackView.addArrangedSubview(detailLabel)

        addSubview(baseStackView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            baseStackView.topAnchor.constraint(equalTo: topAnchor),
            baseStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            baseStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),

            iconImageView.widthAnchor.constraint(equalToConstant: 20),
            iconImageView.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}

// MARK: - Configurable Extension

extension EventInfoDetailView: Configurable {
    typealias Configuration = EventInfoDetailContent

    struct EventInfoDetailContent: Hashable {
        let iconImage: UIImage
        let detailText: String
    }

    func configure(content: Configuration) {
        iconImageView.image = content.iconImage
        detailLabel.text = content.detailText
    }
}
