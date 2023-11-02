//
//  ViewController.swift
//  Day14-BildirimCalismasi
//
//  Created by Osman Emre Ömürlü on 2.11.2023.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    var izinKontrol = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // yazdigimiz extension'un delegatesi. Foreground'da bildirim gozukmesi icin yazdik extensionu.
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            self.izinKontrol = granted
            
            if granted {
                print("izin alma basarili")
            } else {
                print("izin alma basarisiz")
            }
        }
        
    }

    @IBAction func buttonBildirimOlustur(_ sender: UIButton) {
        if izinKontrol {
            let icerik = UNMutableNotificationContent()
            icerik.title = "ust baslik"
            icerik.subtitle = "alt baslik"
            icerik.body = "body kismi mesaj yeri"
            icerik.badge = 1
            icerik.sound = UNNotificationSound.default
            
            let tetikleme = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false) //timeInterval saniye sonra calisacaktir.
            
            let bildirimIstek = UNNotificationRequest(identifier: "id", content: icerik, trigger: tetikleme)
            
            UNUserNotificationCenter.current().add(bildirimIstek)
        }
    }
    
}

extension ViewController: UNUserNotificationCenterDelegate {
    // Uygulama acikken bildirim gostermek icin:
    // willPresent fonksiyonunu cagiriyoz completion handler olanliyi. sonra yukaridaki alarm izni isterken options icine yazdigimiz seyleri burada completion handler icine yaziyoz. .alert yerine .banner yaziyoruz.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound, .badge])
    }
    
    // didRecieve with completion handler metodu: Bildirime tiklandigi zaman
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        // badge degerini sifirlayalim. Once app'e ulasmamiz lazim.
        let app = UIApplication.shared
        app.applicationIconBadgeNumber = 0
        
        if app.applicationState == .active {
            print("uygulama acikken bildirime tiklanildi.")

        }
        
        if app.applicationState == .inactive {
            print("uygulama kapaliyken bildirime tiklanildi.")
        }
        
        completionHandler()
    }
}

