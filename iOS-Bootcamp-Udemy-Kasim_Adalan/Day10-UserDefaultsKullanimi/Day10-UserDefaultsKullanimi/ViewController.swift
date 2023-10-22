//
//  ViewController.swift
//  Day10-UserDefaultsKullanimi
//
//  Created by Osman Emre Ömürlü on 22.10.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelSayac: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Tanimlama
        let ud = UserDefaults.standard
        
        // Kayit
        ud.set("Ahmet", forKey: "ad")
        ud.set(23, forKey: "yas")
        ud.set(1.78, forKey: "boy")
        ud.set(true, forKey: "bekar")
        
        let liste = ["ali","ece"]
        ud.set(liste, forKey: "liste")
        
        let sehirler = ["16":"Bursa", "34": "Istanbul"]
        ud.set(sehirler, forKey: "sehirler")
        
        
        
        // Silme
//        ud.removeObject(forKey: "ad")
        
        // Okuma
        let gelenAd = ud.string(forKey: "ad") ?? "Isim yok" // ?? yapmazsak bsi okunmazsa default deger nil gelir.
        let gelenYas = ud.integer(forKey: "yas") // default deger = 0
        let gelenBoy = ud.double(forKey: "boy") // default = 0.0
        let gelenBekar = ud.bool(forKey: "bekar") // default = false
        
        print("Gelen ad: \(gelenAd)")
        print("Gelen yas: \(gelenYas)")
        print("Gelen boy: \(gelenBoy)")
        print("Gelen bekar: \(gelenBekar)")
        
        let gelenListe = ud.array(forKey: "liste") ?? [String]()
        print("gelen liste1 = \(gelenListe)")
        
        for a in gelenListe {
            print("Gelen liste2: \(a)")
        }
        
        let gelenSehirler = ud.dictionary(forKey: "sehirler") ?? [String:String]()
        for (anahtar, deger) in gelenSehirler {
            print("gelenSehirler = \(anahtar) -> \(deger)")
        }
        
        // Sayac uygulamasi
        var sayac = ud.integer(forKey: "sayac") // 0 verecek ilk basta
        sayac += 1
        ud.set(sayac, forKey: "sayac")
        labelSayac.text = "ekranin acilis sayisi: \(sayac)"
        
        
    }

    

}

