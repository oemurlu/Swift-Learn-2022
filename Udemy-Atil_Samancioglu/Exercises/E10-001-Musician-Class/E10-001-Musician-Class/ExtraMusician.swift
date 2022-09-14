//
//  File.swift
//  E10-001-Musician-Class
//
//  Created by Osman Emre Ömürlü on 14.09.2022.
//

// PART-3 : Inheritance //
//SuperMusician'da Musicians'tan ozellikleri alalim, ustune ek ozellikler ekleyek.

import Foundation

class ExtraMusician : Musicians {
    
    override func singIbo() {
        print("\(name): Beni benden alirsan seni sana birakmam...")
    }
}
