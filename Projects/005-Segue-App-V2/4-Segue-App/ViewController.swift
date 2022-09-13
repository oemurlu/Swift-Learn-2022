//
//  ViewController.swift
//  4-Segue-App
//
//  Created by Osman Emre Ömürlü on 5.09.2022.
//

import UIKit

class ViewController: UIViewController {

    var userName = ""
    
    @IBOutlet weak var headLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    
    // PART-2 LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad func called.")
    }
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear func called.")
        //nameText.text = "Mertens"
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidApper func called.")
        //nameText.text = "Icardi"
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear func called.")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear func called.")
    }
    
    // simulator icinde 1.ve 2. sayfa arasinda gidip geldikce log'taki kodlara bakarak ne zaman neyin oldugunu kavriyorsun ve buna gore belli bi zamanda olmasini istedigin bir seyi o fonksiyon icine yazarak isini halledebilirsin. onemli nokta: viewDidLoad func sadece uygulama ilk acilista calisiyor.
    /* calisma siralari sirayla: 1-didload 2-willappear 3-didappear
     simdi bu ViewController 1.sayfanin VC oldugu icin 2.VC'ye gecerken calisacak kodlar:
     1-willdisappear 2-diddisappear    (disappear cunku 1.nin VC'si kayboluyor.)
     2.VC'den 1.VC'ye gecerken ise sunlar calisacak:
     1-willappear 2-didappear
    
    yani hangi VC'den baktigina gore kodlar degisir.
     mesela willappear fonksiyonuna nameText.text = "osman" yazarsan
     her 2.VC'den 1.VC'ye geciste name yerinde osman yazar.
    */
    
    
    
    
    @IBAction func nextClicked(_ sender: Any) {
        //butona tiklayinca girilen ismi diger ekranda gostermek icin userName degiskenine atayalim.
        userName = nameText.text!
        /*
         1. View Controller'den 2.VC'ye control tusuyla surukle birak ile baglama yaptik.
         ama next tusunu degil, direkt 1. VC'yi 2. VC'ye bagladik.
         bu 1.VC'den 2.VC'ye gecme isini mesela next butonuna kod ile yazalim.
         bunu, performSegue ile yapacaz.
         */
        performSegue(withIdentifier: "toSecondVC", sender: nil )
        
    }
    //prepareforsegue fonksiyonu ile segue olmadan hemen once yapilacak islemleri buraya yazacagiz. bu sayede 1.VC'deki bilgileri 2.VC'de kullanabilecegiz.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //her zaman seguenin identifier'ini kontrol ederek baslamakta fayda var
        if segue.identifier == "toSecondVC" {
            // as ile casting edecegiz cunku segue.destination bize VC dondurecek ama bu SecondViewController ise olay gerceklessin.
            let destinationVC = segue.destination as! SecondViewController
            // artik destinaionVC yazarken altta tipi secondviewcontroller olarak gozukuyor. bu sayede secondviewcontrollerdeki bilgilere bu sayede ulasabiliyorum.
            destinationVC.incomingName = userName
        }
        
    }
    
}

