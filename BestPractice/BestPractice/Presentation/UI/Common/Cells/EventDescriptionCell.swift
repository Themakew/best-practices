//
//  EventDescriptionCell.swift
//  BestPractice
//
//  Created by Ruyther Costa on 13/06/22.
//

import UIKit

final class EventDescriptionCell: UICollectionViewCell {

    // MARK: - Private properties

    private let baseView = UIView(translateMask: false).apply {
        $0.backgroundColor = .systemPurple.withAlphaComponent(0.1)
        $0.layer.cornerRadius = Styles.Radius.default
        $0.layer.masksToBounds = false
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.1
        $0.layer.shadowOffset = CGSize(width: 1, height: 3)
        $0.layer.shadowRadius = 1
    }

    private let baseStackView = UIStackView(translateMask: false).apply {
        $0.distribution = .fill
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = Styles.Spacing.default
    }

    private let eventImageView = UIImageView(translateMask: false).apply {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = Styles.Radius.default
        $0.layer.masksToBounds = true
        $0.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }

    private let eventTitleLabel = UILabel(translateMask: false).apply {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: Styles.Size.default, weight: .bold)
        $0.textAlignment = .left
        $0.numberOfLines = 2
        $0.lineBreakMode = .byTruncatingTail
    }

    private let eventDescriptionLabel = UILabel(translateMask: false).apply {
        $0.textColor = .black
        $0.font = UIFont.systemFont(ofSize: Styles.Size.regular, weight: .regular)
        $0.textAlignment = .left
        $0.numberOfLines = 4
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

        contentView.addSubview(baseView)
        baseView.addSubview(baseStackView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: Styles.Padding.default
            ),
            baseView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: Styles.Padding.small
            ),
            baseView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -Styles.Padding.small
            ),
            baseView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Styles.Padding.default
            ),

            baseStackView.topAnchor.constraint(equalTo: baseView.topAnchor),
            baseStackView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
            baseStackView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
            baseStackView.bottomAnchor.constraint(
                equalTo: baseView.bottomAnchor,
                constant: -Styles.Padding.default
            ),

            eventImageView.heightAnchor.constraint(equalToConstant: 300),
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
//        KF.url(content.eventImageURL)
//            .placeholder(Images.empty_image)
//            .loadDiskFileSynchronously()
//            .cacheMemoryOnly()
//            .fade(duration: 0.25)
//            .set(to: self.eventImageView)

        eventTitleLabel.text = content.eventTitleText
        eventDescriptionLabel.text = content.eventDescriptionText

        eventInfoView.configure(content: content.eventInfoContent)
    }
}
