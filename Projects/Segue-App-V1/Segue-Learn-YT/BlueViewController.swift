//
//  ViewController.swift
//  Segue-Learn-YT
//
//  Created by Osman Emre Ömürlü on 6.09.2022.
//

import UIKit
// command basili tutarak class tikla rename de isim degistir. guvenli yol bu.
class BlueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //pembeye ekledigimiz butonu control tusu ile ustteki VC logolarindan 3.sune (exit icin olana) tiklayip alttaki elle yazdigimiz fonksiyonu sececegiz. boylece butona baglanti eklemis olcaz ve butona tikladigimizda bu func calisacak geri mavi ekrana gelecek. pembedeki butonu pinkVC'ye bagladik, mavinin VC'sine exit olarak bagladik yani.
    
    @IBAction func unwideToBlueVC(segue: UIStoryboardSegue){
        print("unwing to the blue VC")
    }


}

