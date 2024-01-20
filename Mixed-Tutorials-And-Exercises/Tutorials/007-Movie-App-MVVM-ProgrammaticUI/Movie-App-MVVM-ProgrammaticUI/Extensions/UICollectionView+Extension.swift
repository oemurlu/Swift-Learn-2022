//
//  UICollectionView+Extension.swift
//  Movie-App-MVVM-ProgrammaticUI
//
//  Created by Osman Emre Ömürlü on 19.01.2024.
//

import UIKit

extension UICollectionView {
    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
