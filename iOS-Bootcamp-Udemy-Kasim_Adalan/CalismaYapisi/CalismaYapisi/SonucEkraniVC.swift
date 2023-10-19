//
//  SonucEkraniVC.swift
//  CalismaYapisi
//
//  Created by Osman Emre Ömürlü on 15.10.2023.
//

import UIKit

class SonucEkraniVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Sonuc Ekrani"
    }
    
    @IBAction func buttonKapat(_ sender: Any) {
        self.dismiss(animated: true) //present modally ekranlar icin sayfayi kapatir
    }
    
}
