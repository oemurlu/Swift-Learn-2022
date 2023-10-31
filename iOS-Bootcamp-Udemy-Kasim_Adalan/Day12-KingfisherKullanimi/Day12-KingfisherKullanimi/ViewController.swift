//
//  ViewController.swift
//  Day12-KingfisherKullanimi
//
//  Created by Osman Emre Ömürlü on 31.10.2023.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resimGoster(resimAdi: "kofte.png")
    }
    
    @IBAction func buttonResim1(_ sender: Any) {
        resimGoster(resimAdi: "ayran.png")
    }
    
    @IBAction func buttonResim2(_ sender: Any) {
        resimGoster(resimAdi: "su.png")
    }
    
    func resimGoster(resimAdi: String) {
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)") {
            DispatchQueue.main.async {
                self.imageView.kf.setImage(with: url)
            }
        }
    }
}

