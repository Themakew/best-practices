//
//  EventListViewModel.swift
//  BestPractice
//
//  Created by Ruyther Costa on 12/06/22.
//

import Foundation
import RxSwift

final class EventListViewModel: EventListViewModelProtocol, EventListViewModelInput, EventListViewModelOutput {

    // MARK: - Internal properties

    enum SectionType: Hashable {
        case eventsList
    }

    enum Row: Hashable {
        case eventDescription(content: EventDescriptionCell.Configuration)
    }

    let dataSource = ReplaySubject<DataSource>.create(bufferSize: 1)

    // MARK: - Internal properties

    private var data: DataSource

    init() {
        data = [
            .eventsList: [
                .eventDescription(
                    content: EventDescriptionCell.Configuration(
                        eventImageURL: URL(string: "https://raw.githubusercontent.com/onevcat/Kingfisher-TestImages/master/DemoAppImage/GIF/GifHeavy.gif")!,
                        eventTitleText: "eventTitleText",
                        eventDescriptionText: "eventDescriptionText",
                        eventInfoContent: EventInfoView.Configuration(
                            locationIconURL: URL(string: "www.globo.com")!,
                            locationText: "locationText",
                            dateIconURL: URL(string: "www.globo.com")!,
                            dateIconText: "dateIconText",
                            priceIconURL: URL(string: "www.globo.com")!,
                            priceIconText: "priceIconText"
                        )
                    )
                ),
            ],
        ]

        dataSource.onNext(data)
    }
}
