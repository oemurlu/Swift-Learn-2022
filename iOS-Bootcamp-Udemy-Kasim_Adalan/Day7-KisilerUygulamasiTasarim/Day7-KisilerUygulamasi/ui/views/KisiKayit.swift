//
//  KisiKayit.swift
//  Day7-KisilerUygulamasi
//
//  Created by Osman Emre Ömürlü on 18.10.2023.
//

import UIKit

class KisiKayit: UIViewController {


    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonKaydet(_ sender: UIButton) {
        if let ka = tfKisiAd.text, let kt = tfKisiTel.text {
            kaydet(kisi_ad: ka, kisi_tel: kt)
        }
    }
    
    func kaydet(kisi_ad: String, kisi_tel: String) {
        print("ad: \(kisi_ad), tel: \(kisi_tel)")
        
    }
    

}
