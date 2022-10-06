//
//  UICollectionView+Misc.swift
//  BestPractice
//
//  Created by Ruyther Costa on 04/10/22.
//

import UIKit

extension UICollectionReusableView {
    @objc static var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}

extension UICollectionView {
    func register<T: UICollectionViewCell>(cellClass: T.Type) {
        register(cellClass, forCellWithReuseIdentifier: cellClass.reuseIdentifier)
    }

    func registerSupplementaryView<T: UICollectionReusableView>(cellClass: T.Type, ofKind: String) {
        register(cellClass, forSupplementaryViewOfKind: ofKind, withReuseIdentifier: cellClass.reuseIdentifier)
    }

    func dequeue<T: UICollectionViewCell>(cellClass: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(
            withReuseIdentifier: cellClass.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Error in cell with id: \(cellClass.reuseIdentifier); for indexPath: \(indexPath) is not \(T.self)")
        }
        return cell
    }

    func dequeueSupplementaryView<T: UICollectionReusableView>(type: T.Type, indexPath: IndexPath, ofKind: String) -> T {
        guard let view = dequeueReusableSupplementaryView(ofKind: ofKind, withReuseIdentifier: type.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Error in supplementary view with id: \(type.reuseIdentifier); for indexPath: \(indexPath) is not \(T.self)")
        }

        return view
    }
}
