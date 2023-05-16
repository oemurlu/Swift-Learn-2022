//
//  ViewController.swift
//  CoreDataProject
//
//  Created by Osman Emre Ömürlü on 15.05.2023.
//

/*
 Giris ekraninda kisi listesi bunuacak.
 Ekranin sag ust kosesindeki + butonuna basildiginda yeni kisi ekleme sayfasi acilacak
 Yeni ekleme sayfasinda kisilerin ad, soyad, eposta bilgileri alinacak ve kaydet butonuna basildiginda bilgiler veritabinina kaydedilecek.
 Kayit islemi sonrasi giris ekranina geri donulecek ve yeni kisi listeye eklenecek.
 Listede veriler alfabetik olarak sirali gelecek.
 Listedeki elemana basildiginda duzenleme ekranina gidilecek ve bilgiler guncellenebilecek.
 Duzenleme Ekrani yeni ekleme ekrana ile ayni tasarima sahip olacak.
 Listedeki eleman sola cekildiginde silinebilecek.
 */

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tvKisiListesi: UITableView!
    
    var KisiListesi: [Kisi]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        KisilerGetir()
        print("viewWillAppear")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgDuzenle" {
            let hedefVc = segue.destination as! VC_EkleDuzenle
            hedefVc.kisi = KisiListesi![sender as! Int]
            // DIDSELECTROW'DA PERFORMSEGUE KISMINDA SENDER KISMINA indexPath.row yazarak prepare for segue fonksiyonuna indexPath.row'u GONDERDIK. COK GUZEL BIR OZELLIKMIS BU. SUPERRRRRRR.
        }
    }
    
    func KisilerGetir() {
        let fetchRequest: NSFetchRequest<Kisi> = Kisi.fetchRequest()
        
        // kisileri ad'a gore alfabetik olarak siralayalim:
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "ad", ascending: true)]
        
        
        do {
            KisiListesi = try (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext.fetch(fetchRequest)
            tvKisiListesi.reloadData()
        } catch {
            print("error")
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if KisiListesi != nil {
            return KisiListesi!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let satir = UITableViewCell()
        satir.textLabel?.text = KisiListesi![indexPath.row].ad! + " " + KisiListesi![indexPath.row].soyad!
        return satir
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tvKisiListesi.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "sgDuzenle", sender: indexPath.row)
        // SENDER KISMINDA indexPath.row'u gonderdik. Bu sayede prepare for segue fonksiyonunda indexPath.row'u kullanabildik.
        // BU KISIM HARIKA BIR OZELLIKMIS ANCA KESFETMIS OLMAM VAOV DEDIRTTI :D
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            context.delete(KisiListesi![indexPath.row])
            
            KisilerGetir()
            
            //bu alttaki kodu yazmazsak uygulamayi yeniden baslattigimizda silinmemis olur yani tamamen silmez.
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
        }
    }
}

