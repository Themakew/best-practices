//
//  EventListViewModelProtocol.swift
//  BestPractice
//
//  Created by Ruyther Costa on 12/06/22.
//

protocol EventListViewModelProtocol {
    var input: EventListViewModelInput { get }
    var output: EventListViewModelOutput { get }
}

protocol EventListViewModelInput {

}

protocol EventListViewModelOutput {

}

extension EventListViewModelProtocol where Self: EventListViewModelInput & EventListViewModelOutput {
    var input: EventListViewModelInput { return self }
    var output: EventListViewModelOutput { return self }
}
