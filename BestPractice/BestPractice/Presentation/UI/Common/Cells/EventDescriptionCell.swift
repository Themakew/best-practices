//
//  EventDescriptionCell.swift
//  BestPractice
//
//  Created by Ruyther Costa on 13/06/22.
//

import Kingfisher
import UIKit

final class EventDescriptionCell: UICollectionViewCell {

    // MARK: - Private properties

    private let baseStackView = UIStackView(translateMask: false).apply {
        $0.distribution = .fill
        $0.axis = .vertical
        $0.alignment = .leading
        $0.spacing = Styles.Spacing.default
    }

    private let eventImageView = UIImageView(translateMask: false).apply {
        $0.contentMode = .scaleAspectFit
    }

    private let eventTitleLabel = UILabel(translateMask: false).apply {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: Styles.Size.default, weight: .bold)
        $0.textAlignment = .center
        $0.numberOfLines = 2
        $0.lineBreakMode = .byTruncatingTail
    }

    private let eventDescriptionLabel = UILabel(translateMask: false).apply {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: Styles.Size.regular, weight: .regular)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.lineBreakMode = .byTruncatingTail
    }

    private let eventInfoView = EventInfoView(translateMask: false)

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

extension EventDescriptionCell: ViewCode {
    func buildViewHierarchy() {
        baseStackView.addArrangedSubview(eventImageView)
        baseStackView.addArrangedSubview(eventTitleLabel)
        baseStackView.addArrangedSubview(eventDescriptionLabel)
        baseStackView.addArrangedSubview(eventInfoView)

        contentView.addSubview(baseStackView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            baseStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            baseStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            baseStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            baseStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            eventImageView.heightAnchor.constraint(equalToConstant: 300),
            eventImageView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
        ])
    }
}

// MARK: - Configurable Extension

extension EventDescriptionCell: Configurable {
    typealias Configuration = EventDescriptionContent

    struct EventDescriptionContent: Hashable {
        static func == (lhs: EventDescriptionCell.EventDescriptionContent, rhs: EventDescriptionCell.EventDescriptionContent) -> Bool {
            lhs.eventImageURL == rhs.eventImageURL &&
            lhs.eventTitleText == rhs.eventTitleText &&
            lhs.eventDescriptionText == rhs.eventDescriptionText
        }

        let eventImageURL: URL
        let eventTitleText: String
        let eventDescriptionText: String
        let eventInfoContent: EventInfoView.Configuration
    }

    func configure(content: Configuration) {
        KF.url(content.eventImageURL)
            .placeholder(Images.empty_image)
            .loadDiskFileSynchronously()
            .cacheMemoryOnly()
            .fade(duration: 0.25)
            .set(to: self.eventImageView)

        eventImageView.kf.setImage(with: content.eventImageURL)

        eventTitleLabel.text = content.eventTitleText
        eventDescriptionLabel.text = content.eventDescriptionText

        eventInfoView.configure(content: content.eventInfoContent)
    }
}
