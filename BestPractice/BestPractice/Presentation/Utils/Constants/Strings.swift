//
//  Strings.swift
//  BestPractice
//
//  Created by Ruyther Costa on 27/05/23.
//

import Foundation

enum LocalizableStrings {
    static func localizedString(_ key: String) -> String {
        let localizedString = NSLocalizedString(key, comment: "")

        guard localizedString != key else {
            fatalError("Missing localization for key: \(key)")
        }

        return localizedString
    }

    static let events: String = localizedString("events")
}
