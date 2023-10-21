//
//  ViewController.swift
//  Day9-MVVM-Kullanimi
//
//  Created by Osman Emre Ömürlü on 20.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var tfSayi1: UITextField!
    @IBOutlet weak var tfSayi2: UITextField!
    
    var viewModel = AnasayfaViewModel() //AnasayfaViewModel'den nesne olusturuyoz ve init metodu calisiyo.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = viewModel.sonuc.subscribe(onNext: { s in // Dinleme
            self.labelSonuc.text = s
        })
    }


    @IBAction func buttonToplama(_ sender: UIButton) {
        if let alinanSayi1 = tfSayi1.text, let alinanSayi2 = tfSayi2.text {
            viewModel.toplamaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
        }
    }
    
    @IBAction func buttonCarpma(_ sender: UIButton) {
        if let alinanSayi1 = tfSayi1.text, let alinanSayi2 = tfSayi2.text {
            viewModel.carpmaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
        }

    }
    
}

