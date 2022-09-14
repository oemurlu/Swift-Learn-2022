//
//  main.swift
//  E10-001-Musician-Class
//
//  Created by Osman Emre Ömürlü on 14.09.2022.
//


import Foundation

let oe = Musicians(name: "Osman", age: 20, instrument: "Drum", type: .Drummer)
let mesto = ExtraMusician(name: "Mestan", age: 22, instrument: "Piano", type: .Bassist)

oe.singIbo() //Output: Osman: Ne sevdalar yasadim, sarisindi esmerdi...
mesto.singIbo() //Output: Mestan: Beni benden alirsan seni sana birakmam...

