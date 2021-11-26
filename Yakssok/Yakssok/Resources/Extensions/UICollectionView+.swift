//
//  UICollectionView+.swift
//  Yakssok
//
//  Created by soyeon on 2021/11/26.
//

import UIKit

extension UICollectionView {
    func selectAll(animated: Bool) {
        (0..<numberOfSections).compactMap { (section) -> [IndexPath]? in
            return (0..<numberOfItems(inSection: section)).compactMap({ (item) -> IndexPath? in
                return IndexPath(item: item, section: section)
            })
        }.flatMap { $0 }.forEach { (indexPath) in
            selectItem(at: indexPath, animated: true, scrollPosition: [])
        }
    }
    
    func deselectAll(animated: Bool) {
        indexPathsForSelectedItems?.forEach({ (indexPath) in
            deselectItem(at: indexPath, animated: animated)
        })
    }
}

