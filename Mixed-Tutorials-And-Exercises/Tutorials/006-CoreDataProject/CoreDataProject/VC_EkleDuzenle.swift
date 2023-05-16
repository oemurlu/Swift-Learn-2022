//
//  VC_EkleDuzenle.swift
//  CoreDataProject
//
//  Created by Osman Emre Ömürlü on 15.05.2023.
//

import UIKit
import CoreData

class VC_EkleDuzenle: UIViewController {

    @IBOutlet weak var tfAd: UITextField!
    @IBOutlet weak var tfSoyad: UITextField!
    @IBOutlet weak var tfEposta: UITextField!
        
    var kisi: Kisi?
    // Cannot find type 'Kisi' hatasi verir ama xcode'da bug var. asagida kodlarda kisi!.ad yazarken noktadan sonra kendi tamamlamaz. coredataya nasil kaydettiysen ona gore yapican onlari. Bu konuda bug var maalesef.
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if kisi != nil {
            tfAd.text = kisi!.ad
            tfSoyad.text = kisi!.soyad
            tfEposta.text = kisi!.eposta
        }
    }
    
    @IBAction func btnVazgec_TUI(_ sender: UIButton) {
        print("dismiss")
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func btnKaydet_TUI(_ sender: UIButton) {
        let context = ContextGetir()
        
        // kisi == nil ise ekleme islemi yapsin; degilse guncelleme islemi yapsin
        if kisi == nil {
            let entity = NSEntityDescription.entity(forEntityName: "Kisi", in: context)
            let kisi = NSManagedObject(entity: entity!, insertInto: context) //kisi nesnesini urettik
            
            kisi.setValue(tfAd.text, forKey: "ad")
            kisi.setValue(tfSoyad.text, forKey: "soyad")
            kisi.setValue(tfEposta.text, forKey: "eposta")
        } else {
            kisi!.ad = tfAd.text
            kisi!.soyad = tfSoyad.text
            kisi!.eposta = tfEposta.text
        }
        
        
        
        //save islemi
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        dismiss(animated: true)
    }
    
    func ContextGetir() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    
    
}
