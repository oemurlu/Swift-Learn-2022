//
//  Constants.swift
//  Flash Chat iOS13
//
//  Created by Osman Emre Ömürlü on 22.11.2022.
//  Copyright © 2022 Angela Yu. All rights reserved.
//

//static yapmazsak LoginVC ve RegisterVC'de performSegue'de Constants.registerSegue yapamayiz.
//zaten nokta (.) koyunca cikmiyo. static olmayan bsiyi kullanmak icin nesne olusturmak lazim o da gereksiz olur.
// bu, fonksiyonlar icin de class'lar icin de gecerli. COK GUZEL BI NOKTAYMIS BU
// struct Constants uzun oldugu icin genelde K yaziliyomus


struct K {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
