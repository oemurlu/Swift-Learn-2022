//
//  ViewController.swift
//  CoreDataProject
//
//  Created by Osman Emre Ömürlü on 13.05.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        YapilacakEkle(baslik: "test baslik 2", icerik: "test icerik 2")
//        YapilacaklarGetir()
//        YapilacakGuncelle()
        YapilacaklarGetir()
        YapilacakSil()
        YapilacaklarGetir()
    }
    
    //context'e ihtiyacimiz olan her yerde  tek tek tanimlamayak yerine fonksiyon yazarak cagiracagiz, daha temiz kod olacak.
    func ContextGetir() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func YapilacakEkle(baslik: String, icerik: String) {
        let context = ContextGetir()
        let entity = NSEntityDescription.entity(forEntityName: "Yapilacak", in: context)
        
        let yapilacak = NSManagedObject(entity: entity!, insertInto: context)
        
        yapilacak.setValue(baslik, forKey: "baslik")
        yapilacak.setValue(icerik, forKey: "icerik")
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    // part-2 coredata veri sorgulama
    
    func YapilacaklarGetir() {
        let fetchRequest: NSFetchRequest<Yapilacak> = Yapilacak.fetchRequest()
        
        // filtreleme
        // .predicate ile mesela sadece baslik, 2 iceriyorsa getirsin diyebiliyoruz.
//        fetchRequest.predicate = NSPredicate(format: "baslik contains 2")
        
        // baslik degeri 'test baslik 1' olanlari getirsin sadece
//        fetchRequest.predicate = NSPredicate(format: "baslik = %@", "test baslik 1")
        
        //birden fazla filtre de ekleyebiliriz 'and' ile.
//        fetchRequest.predicate = NSPredicate(format: "baslik = %@ and icerik = %@", "test baslik 2", "test icerik 2")
        
        // siralama da yapabiliriz gelen verileri. baslik'a gore sirali sekilde getirecek simdi
//        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "baslik", ascending: true)]
        
        do {
            let yapilacaklar = try ContextGetir().fetch(fetchRequest)
            
            for yapilacak in yapilacaklar {
                print("baslik: \(yapilacak.baslik!), icerik: \(yapilacak.icerik!)")
            }
        } catch {
            print("hata olustu")
        }
    }
    
    // part-3 veri guncelleme
    //veri guncellemek icin 'baslik' inputu alan bir fonksiyon yazalim ve [Yapilacak]? dondursun.
    // veri guncellemek ve silmek icin once o nesneye ulasmak ve degerini degistirmek veya silmek lazim.
    
    func YapilacaklarGetir(baslik: String) -> [Yapilacak]? {
        let fetchRequest: NSFetchRequest<Yapilacak> = Yapilacak.fetchRequest()
        
        // gelen basliga gore filtrelesin
        fetchRequest.predicate = NSPredicate(format: "baslik = %@", baslik)
        
        do {
            return try ContextGetir().fetch(fetchRequest)
        } catch {
            print("hata olustu")
        }
        return nil
    }
    
    func YapilacakGuncelle() {
        if let yapilacaklar = YapilacaklarGetir(baslik: "test baslik 2") {
            for yapilacak in yapilacaklar {
                yapilacak.baslik = "guncellenmis baslik 2"
                //guncelleme yaparken setValue filan yapmiyoruz boyle basitce yapiyoruz.
            }
        }
        // ekleme, guncelleme, silme filan ne yaparsak yapalim save ediyoruz.
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    
    // part-4 coreData veri silme
    // veri guncellemek ve silmek icin once o nesneye ulasmak ve degerini degistirmek veya silmek lazim.
    //guncelleme isleminde nesne uzerinden islem yapiliyorken, silme isleminde context uzerinden islem yapariz.
    
    func YapilacakSil() {
        if let yapilacaklar = YapilacaklarGetir(baslik: "guncellenmis baslik 2") {
            for yapilacak in yapilacaklar {
                ContextGetir().delete(yapilacak)
            }
        }
        // ekleme, guncelleme, silme filan ne yaparsak yapalim save ediyoruz.
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
}


