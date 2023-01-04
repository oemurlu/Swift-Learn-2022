//
//  main.swift
//  311-Structs vs. Classes
//
//  Created by Osman Emre Ömürlü on 9.12.2022.
//

/**
 class'lar referans bazlidir. class'tan uretilmis bir nesneyi kopyalarsan, 2 tane nesnen olur ama 2 nesne de ayni referansi gosterir. nesnelerin birinde bir ozelligi degistirirsen referansin ozelligi degisecegi icin diger nesnenin de ozelligi degismis olur.
 
 struct'lar referans bazli DEGILDIR, DEGER TIPLIDIR. struct'tan uretilmis bir nesneyi kopyalarsan, 2 tane farkli referanslari gosteren nesnen olur, birbirlerini etkilemezler.
 
CLASS
 -inherit edilebilir (en onemli ozelligi bu OOP'den dolayi)
 -referans tiplidir
 -yavastirlar (stack yapisi old icin)
 
 
STRUCT
 -inherit edilemez
 -deger tiplidir
 -hizlidirlar (heap yapisi old icin)
 **/




import Foundation

//MARK: - Class ve Struct ornegi

//bir satir alttaki StructHero'yu ClassHero yap oyle dene bi de => tum isimler thor oluyo referans old icin
//var hero = StructHero(name: "Iron Man", universe: "Marvel")
//var anotherHero = hero
//anotherHero.name = "The hulk"
//
//var avengers = [hero, anotherHero]
//avengers[0].name = "Thor"
//
//print("hero name = \(hero.name)")
//print("anotherClassHero name = \(anotherHero.name)")
//print("first avenger name = \(avengers[0].name)")


//MARK: -  PART - 2:

//ClassHero'yu Struct hero yap dene. => hata verir
let hero = ClassHero(name: "iron man", universe: "marvel")

hero.name = "cat woman"
//hero.universe = "disney" //bunu yapamam cunku ClassHero.swift'te universe let olarak verdim.

print(hero.name)


