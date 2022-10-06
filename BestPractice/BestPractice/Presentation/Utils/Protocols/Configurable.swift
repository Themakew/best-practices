//
//  Configurable.swift
//  BestPractice
//
//  Created by Ruyther Costa on 04/10/22.
//

protocol Configurable: AnyObject {
    associatedtype Configuration

    func configure(content: Configuration)
}
