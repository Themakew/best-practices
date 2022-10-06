//
//  Styles.swift
//  BestPractice
//
//  Created by Ruyther Costa on 14/06/22.
//

import Foundation

enum Styles {

    // MARK: - Padding

    enum Padding {
        /**
         ExtraSmall style size is a CGFloat with value of 4.0
         */
        static let extraSmall: CGFloat = 4.0

        /**
         Small style size is a CGFloat with value of 16.0
         */
        static let small: CGFloat = 8.0

        /**
         Default style size is a CGFloat with value of 16.0
         */
        static let `default`: CGFloat = 16.0

        /**
         ExtraLarge style size is a CGFloat with value of 32.0
         */
        static let extraLarge: CGFloat = 32.0
    }

    // MARK: - Spacing

    enum Spacing {
        /**
         Default style size is a CGFloat with value of 4.0
         */
        static let `default`: CGFloat = 4.0
    }

    // MARK: - Size

    enum Size {
        /**
         Default style size is a CGFloat with value of 11.0
         */
        static let regular: CGFloat = 11.0

        /**
         Default style size is a CGFloat with value of 12.0
         */
        static let `default`: CGFloat = 12.0
    }
}
