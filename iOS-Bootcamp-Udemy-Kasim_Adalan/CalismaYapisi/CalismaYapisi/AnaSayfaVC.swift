//
//  ViewController.swift
//  CalismaYapisi
//
//  Created by Osman Emre Ömürlü on 15.10.2023.
//

import UIKit

class AnaSayfaVC: UIViewController {

    @IBOutlet weak var labelAnaSayfa: UILabel!
    
    override func viewDidLoad() { //app ilk acildiginda sadece 1 kere calisir
        super.viewDidLoad()
        print("viewDidLoad calisti")
        self.navigationItem.title = "Anasayfa"
        
        labelAnaSayfa.text = "Hosgeldin"
    }
    
    override func viewWillAppear(_ animated: Bool) { // sayfa her gorundugunde calisir
        print("viewWillAppear calisti")
    }
    
    override func viewWillDisappear(_ animated: Bool) { // sayfa her gorunmez oldugunda calisir
        print("viewWillDisappear calisti")
    }

    @IBAction func buttonYap(_ sender: Any) {
        labelAnaSayfa.text = "Merhaba"
    }
    
    @IBAction func buttonBasla(_ sender: Any) {
        let kisi = Kisiler(ad: "Ahmet", yas: 23, boy: 1.78, bekar: true)
        performSegue(withIdentifier: "homeToGame", sender: kisi)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "homeToGame" {
            
            if let veri = sender as? Kisiler { //sender Any? turunde ve sender: String turunde ya. Sender'i down casting yapmamiz lazim.
                let destinationVC = segue.destination as! OyunEkraniVC
                destinationVC.kisi = veri
            }
            
/*          performSegue metodunda sender: "merhabaaa" iken sender'i String'e downcast ettik.
 
            if let veri = sender as? String { //sender Any? turunde ve sender: String turunde ya. Sender'i down casting yapmamiz lazim.
                let destinationVC = segue.destination as! OyunEkraniVC
                destinationVC.mesaj = veri
            }
 
 */

        }
    }
    @IBAction func buttonAdd(_ sender: Any) {
        print("Add button pressed")
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        print("Save button pressed")
    }
}

