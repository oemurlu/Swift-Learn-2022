//
//  Musicians.swift
//  E10-001-Musician-Class
//
//  Created by Osman Emre Ömürlü on 14.09.2022.
//

// PART-1 : Class //
// PART-2 : enum //

import Foundation

enum MusicianType {
    case LeadGuitar
    case Vocalist
    case Drummer
    case Bassist
    case Violenist
}

class Musicians {
    
    //Property
    var name : String = ""
    var age : Int = 0
    var instrument : String = ""
    var type : MusicianType
    
    
    //Initializer (Constructor) her obje olusturulunca ilk bu calistirilir.
    init(name:String, age:Int, instrument:String, type:MusicianType) {
        self.name = name
        self.age = age
        self.instrument = instrument
        self.type = type
    }
    
    func singIbo() {
        print("\(name): Ne sevdalar yasadim, sarisindi esmerdi...")
    }
    
    //Access Levels (Access Modifiers)//
    /* ozelden genele siralama:
     private
     fileprivate
     internal (basina bsi yazmayinca bu oluyo default yani aslinda)
     public
     open
     */
    
    
}
