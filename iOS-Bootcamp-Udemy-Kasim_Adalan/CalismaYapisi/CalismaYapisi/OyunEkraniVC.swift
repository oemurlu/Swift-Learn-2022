//
//  OyunEkraniVC.swift
//  CalismaYapisi
//
//  Created by Osman Emre Ömürlü on 15.10.2023.
//

import UIKit

class OyunEkraniVC: UIViewController {

    var mesaj: String?
    var kisi: Kisiler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Oyun Ekrani"
        
        if let m = mesaj {
            print("oyunEkraniVC mesaji: \(m)")
        }
        
        if let k = kisi {
            print("Kisi ad: \(k.ad!)\nKisi yas: \(k.yas!)\nKisi boy: \(k.boy!)\nKisi bekar: \(k.bekar!)")
        }
    }
    

    @IBAction func buttonBitir(_ sender: Any) {
        performSegue(withIdentifier: "gameToResult", sender: nil)
    }
    
    @IBAction func buttonGeri(_ sender: Any) {
//        navigationController?.popViewController(animated: true) // bir onceki sayfaya doner
        navigationController?.popToRootViewController(animated: true) // navigationController'in gosterdigi ana sayfaya doner
    }
}
