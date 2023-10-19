//
//  ViewController.swift
//  Day8.2-FilmlerApp
//
//  Created by Osman Emre Ömürlü on 19.10.2023.
//

import UIKit

class Anasayfa: UIViewController {

    @IBOutlet weak var filmlerCollectionView: UICollectionView!
    
    var filmlerListesi = [Filmler]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupMockData()
    }
    
    func setupCollectionView() {
        filmlerCollectionView.delegate = self
        filmlerCollectionView.dataSource = self
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // cView disindaki bosluk
        tasarim.minimumInteritemSpacing = 10 // itemler arasi yatay bosluk
        tasarim.minimumLineSpacing = 10 // itemler arasi dikey bosluk
        // bunlari yaptiktan sonra kafamizdaki plana gore bir satirda 2 tane film olacak ya.
        // ekrandaki yatay bosluklari ekran genisliginden cikarip 2'ye bolersek bir itemin genisligini hesaplicaz
        // bizde solda 10 + ortada 10 + sagda 10 bosluk var = 30px bosluk
        // mesela 1 satirda 3 film isteseydik total bosluk 4 tane 10cmlik = 40 cm olacakti
        // itemGenislik = (ekranGenislik - 40) / 3 yapardik. => ucu ucuna yetmedi 1px kaciyo galiba -41 yapinca oluyo.
        
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik = (ekranGenislik - 30) / 2
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.6)
        filmlerCollectionView.collectionViewLayout = tasarim
    }
    
    func setupMockData() {
        let f1 = Filmler(id: 1, ad: "Django", resim: "django", fiyat: 24)
        let f2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar", fiyat: 32)
        let f3 = Filmler(id: 3, ad: "Inception", resim: "inception", fiyat: 16)
        let f4 = Filmler(id: 4, ad: "The Hateful Eight", resim: "thehatefuleight", fiyat: 28)
        let f5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist", fiyat: 18)
        let f6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda", fiyat: 10)
        filmlerListesi.append(f1)
        filmlerListesi.append(f2)
        filmlerListesi.append(f3)
        filmlerListesi.append(f4)
        filmlerListesi.append(f5)
        filmlerListesi.append(f6)
    }

}

extension Anasayfa: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let film = filmlerListesi[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilmlerHucre", for: indexPath) as! FilmlerHucre

        cell.imageViewFilm.image = UIImage(named: film.resim!)
        cell.labelFiyat.text = "\(film.fiyat!) TL"
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        

        // Ansayfa icinde cView icinde FilmlerHucre class'i ayri oldugundan (FilmlerHucre.swift'te indexpath vs direkt okuyamiyoz ya) dolayi delegate ile haberlesmek icin yetki vermemiz lazim. ayrica indexPath'i de gondermemiz lazim.
        cell.delegate = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        
        performSegue(withIdentifier: "filmlerToDetay", sender: film)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filmlerToDetay" {
            if let film = sender as? Filmler { // sender'i film nesnesine down-casting yaptik
                let destinationVC = segue.destination as! DetaySayfa
                destinationVC.film = film
            }
        }
    }
}

extension Anasayfa: HucreProtocol {
    func sepeteEkleTikla(indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        print("\(film.ad!) sepete eklendi")
    }
}
