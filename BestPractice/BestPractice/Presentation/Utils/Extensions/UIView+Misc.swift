//
//  UIView+Misc.swift
//  BestPractice
//
//  Created by Ruyther Costa on 13/06/22.
//

import UIKit

extension UIView {
    convenience init(translateMask: Bool) {
        self.init()
        self.translatesAutoresizingMaskIntoConstraints = translateMask
    }
}
