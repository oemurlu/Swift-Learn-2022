//DICTIONARIES
import UIKit

//var player1Username: String = nil  //boyle yapamayiz hata verir

var userName1: String? = nil
userName1 = "osman emre"

//var unwrappedUserName1 = userName1!
userName1 = nil
if userName1 != nil {
    print(userName1!)
}

 var dict = ["Brewery" : " a place where beer is made.",
              "Bakery" : "a place where bread is made."]


 var dict2 : [String : Int] = ["Angela": 777437473,
                              "Philip": 55454545 ]

//bos dictionary olusturma

var isimVeYas = [String: Int]()

isimVeYas["osman"] = 20
print(isimVeYas["osman"]!)

var ayakNumarasi = ["oe": 43, "enes": 42, "duru": 38, "deniz": 41]
//print(ayakNumarasi["oe"]!)

//dictionary update edelim:
ayakNumarasi["ilknur"] = 36

//dictionary belirli bir index silme
ayakNumarasi.removeValue(forKey: "oe")

print("ayakNumarasi sayisi: \(ayakNumarasi.count)")

//keys ve value ayri ayri array'e atama
var isimArray = [String](ayakNumarasi.keys)
var ayakArray = [Int](ayakNumarasi.values)

if ayakNumarasi.isEmpty {
    print("ayakNumarasi bos")
    print("---------")
}
else {
    print("ayakNumarasi dolu")
    print("---------")
}

print("isim ve ayak numaralari")
for (isim, ayak) in ayakNumarasi {
    print(isim,ayak)
}
print("---------")
print("sadece isimler")
for isim in ayakNumarasi.keys {
    print(isim)
}
print("---------")
print("sadece ayak numaralari")
for ayak in ayakNumarasi.values {
    print(ayak)
}

print("============")
//guvenli bi sekilde deger bulma
if let deger = ayakNumarasi["enes"] {
    print("enesin ayak no: \(deger)")
}
