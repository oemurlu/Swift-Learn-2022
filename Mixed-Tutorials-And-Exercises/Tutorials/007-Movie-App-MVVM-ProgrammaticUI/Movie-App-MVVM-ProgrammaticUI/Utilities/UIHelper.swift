//
//  UIHelper.swift
//  Movie-App-MVVM-ProgrammaticUI
//
//  Created by Osman Emre Ömürlü on 18.01.2024.
//

import UIKit

enum UIHelper {
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        let itemWidth = CGFloat.dWidth
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5) //resimler api'den 1/1.5 oraninda geliyor.
        layout.minimumLineSpacing = 40
        
        return layout
    }
}


