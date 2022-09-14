//
//  ViewController.swift
//  8-Objects-With-Code
//
//  Created by Osman Emre Ömürlü on 4.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var myLabel = UILabel()
    // butona tiklayinca ne olacagini ayarlayalim.
    @objc func action1() {
        print("tapped")
        myLabel.text = "label changed"
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        /*
         kodla tasarim olusturmayi complex islerde kullanmak daha iyi oluyormus. Cunku her telefonun boyutu farkli oldugu icin hepsine gore kodla ozel olarak yapiyoruz. Otomatik yapinca cok kucuk telefonlarda sikinti olabiliyor iPhone SE'de mesela.
         */
        let width = view.frame.size.width //ekranin tam genisligi
        let height = view.frame.size.height //ekranin tam yuksekligi
        
        //let myLabel = UILabel() yukariya tasidik class altina.
        myLabel.text = "Test Label"
        myLabel.textAlignment = .center
        myLabel.frame = CGRect.init(x: width * 0.5 - width * 0.8 / 2, y: height * 0.5 - 50 / 2, width: width * 0.8, height: 50)
        view.addSubview(myLabel)
        
        //buton eklemek
        
        let button1 = UIButton()
        button1.setTitle("Test Button", for: UIControl.State.normal)
        button1.setTitleColor(UIColor.red, for: UIControl.State.normal)
        button1.frame = CGRect(x: width * 0.5 - 100, y: height * 0.6, width: 200, height: 100)
        view.addSubview(button1)
        
        
        button1.addTarget( self, action: #selector(ViewController.action1), for: UIControl.Event.touchUpInside)
            }
}

