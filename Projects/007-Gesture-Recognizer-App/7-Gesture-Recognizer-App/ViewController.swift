//
//  ViewController.swift
//  7-Gesture-Recognizer-App
//
//  Created by Osman Emre Ömürlü on 9.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    //resimleri her tiklandiginda degistirmek icin burada boolean tanimlicam
    var isMotorcycle = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // imageview'e tiklandiginda image degissin istiyoruz. bunu yapalim. Oncelikle resimi tiklanabilir yapalim.
        imageView.isUserInteractionEnabled = true
        //jest algilayicimizi yapalim. bu GestureRecognizer dedidigimiz sey parmak hareketlerini anlamak icin yapilacak. tek parmak olunca kac dokunusta calissin, cift parmak dokununca kac dokunusta calissin gibi seyleri ayarliyoruz. Simdilik sadece tek parmak tek dokunus ozelligini kullanacagiz. hedef viewcontroller olacak calistigimiz class yani. bu yuzden self dicez hedefe
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func changePic() {
        if isMotorcycle == true {
            imageView.image = UIImage(named: "m4f82-smblue")
            nameLabel.text = "BMW-M4-F82"
            typeLabel.text = "Car"
            isMotorcycle = false
        } else {
            imageView.image = UIImage(named: "bmw-s1000rr-hp4")
            nameLabel.text = "BMW S1000RR-HP4"
            typeLabel.text = "Motorcycle"
            isMotorcycle = true
        }
    }
}

