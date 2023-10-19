//
//  UrunlerHucre.swift
//  Day8-UrunlerApp
//
//  Created by Osman Emre Ömürlü on 19.10.2023.
//

import UIKit

protocol HucreProtocol: AnyObject {
    func sepeteEkleTiklandi(indexPath: IndexPath)
}

class UrunlerHucre: UITableViewCell {

    @IBOutlet weak var hucreArkaPlan: UIView!
    @IBOutlet weak var imageViewUrun: UIImageView!
    @IBOutlet weak var labelUrunAd: UILabel!
    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    weak var delegate: HucreProtocol?
    var indexPath: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func buttonSepeteEkle(_ sender: UIButton) {
        delegate?.sepeteEkleTiklandi(indexPath: indexPath!)
    }
    
}
