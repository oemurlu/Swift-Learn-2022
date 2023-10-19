//
//  DetaySayfa.swift
//  Day8-UrunlerApp
//
//  Created by Osman Emre Ömürlü on 19.10.2023.
//

import UIKit

class DetaySayfa: UIViewController {

    @IBOutlet weak var imageViewUrun: UIImageView!
    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    var urun: Urunler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let u = urun {
            self.navigationItem.title = u.ad
            imageViewUrun.image = UIImage(named: u.resim!)
            labelUrunFiyat.text = "\(u.fiyat!) TL"
        }
        
    }
    
    @IBAction func buttonSepeteEkle(_ sender: UIButton) {
        if let u = urun {
            print("detay sf: \(u.ad!) sepete eklendi")
        }
    }
    
}
