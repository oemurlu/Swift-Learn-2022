//
//  FilmlerHucre.swift
//  Day8.2-FilmlerApp
//
//  Created by Osman Emre Ömürlü on 20.10.2023.
//

import UIKit

protocol HucreProtocol: AnyObject {
    func sepeteEkleTikla(indexPath: IndexPath)
}

class FilmlerHucre: UICollectionViewCell {
    
    @IBOutlet weak var imageViewFilm: UIImageView!
    @IBOutlet weak var labelFiyat: UILabel!
    
    weak var delegate: HucreProtocol?
    var indexPath: IndexPath?
    
    
    @IBAction func buttonSepeteEkle(_ sender: UIButton) {
        delegate?.sepeteEkleTikla(indexPath: indexPath!)
    }
}
