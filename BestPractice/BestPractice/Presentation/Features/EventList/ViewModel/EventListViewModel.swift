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
//swiftlint:disable line_length
    init() {
        data = [
            .eventsList: [
                .eventDescription(
                    content: EventDescriptionCell.Configuration(
                        eventImageURL: URL(string: "https://i2.wp.com/assentopublico.com.br/wp-content/uploads/2017/07/Feira-de-alimentos-org%C3%A2nicos-naturais-e-artesanais-ganha-um-novo-espa%C3%A7o-em-Ribeir%C3%A3o.jpg")!,
                        eventTitleText: "Feira de Produtos Naturais e Orgânicos",
                        eventDescriptionText: "Toda quarta-feira, das 17h Ã s 22h, encontre a feira mais charmosa de produtos frescos, naturais e orgÃ¢nicos no estacionamento do Shopping. Sintonizado com a tendÃªncia crescente de busca pela alimentaÃ§Ã£o saudÃ¡vel, consumo consciente e qualidade de vida. \n\nAs barracas terÃ£o grande variedade de produtos, como o shiitake cultivado em IbiporÃ£ hÃ¡ mais de 20 anos, um sucesso na mesa dos que nÃ£o abrem mÃ£o do saudÃ¡vel cogumelo na dieta. Ou os laticÃ­nios orgÃ¢nicos da EstÃ¢ncia BaobÃ¡, famosos pelo qualidade e modo de fabricaÃ§Ã£o sustentÃ¡vel na vizinha JaguapitÃ£. TambÃ©m estarÃ£o na feira as conhecidas compotas e patÃªs tradicionais da Pousada MarabÃº, de RolÃ¢ndia.\n\nA feira do CatuaÃ­ Ã© uma nova opÃ§Ã£o de compras de produtos que nÃ£o sÃ£o facilmente encontrados no varejo tradicional, alÃ©m de Ã³tima pedida para o descanso de final de tarde em famÃ­lia e entre amigos. E com o diferencial de ser noturna, facilitando a vida dos consumidores que poderÃ£o sair do trabalho e ir direto para a â€œVila Verdeâ€, onde serÃ¡ possÃ­vel degustar delÃ­cias saudÃ¡veis nos bi",
                        eventInfoContent: EventInfoView.Configuration(
                            locationDetailContent: EventInfoDetailView.Configuration(
                                iconImage: Images.location,
                                detailText: "locationText"
                            ),
                            dateDetailContent: EventInfoDetailView.Configuration(
                                iconImage: Images.price,
                                detailText: "dateIconText"
                            ),
                            priceDetailContent: EventInfoDetailView.Configuration(
                                iconImage: Images.user,
                                detailText: "priceIconText"
                            )
                        )
                    )
                ),
            ],
        ]

        dataSource.onNext(data)
    }
}
