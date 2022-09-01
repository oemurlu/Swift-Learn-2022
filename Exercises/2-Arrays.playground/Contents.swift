import UIKit


//====== PART 1 - Arrays ======//


var myFavoriteMovies = ["Brimstone, Interstellar, Who Am I, Snowden"]
/*
 simdi array icine hem farkli tipte degisken tanimlayamiyoruz ya, diziden sonra as [any] yaparsak dizi icine
 hem string hem int filan hatta boolean bile tanimlayabiliyoruz. Bunun bazi avantajlari da var dezantavaji da.
 avantajlari: her tur degisken koyabilmek
 dezavantaji: diziyle metodlari filan kullanamiyoruz.
ornegin => any array ise myFavoriteMovies[0].upperCased() bunu yapamiyoruz cunku array tipi any oluyor. any metodlari yok.
 ama array tipi any array olmasaydi; array tipi sadece string olacakti (yazilanlar string ise)
 o yuzden string metodlari gelecekti . (nokta) koyunca.

*/

var array1 = ["Yamaha", "R25", 250, 196, true] as [Any]

var myStringArray = ["Car", "Motorcycle", "House", "Plane"]

myStringArray[0].uppercased()

myStringArray.count //eleman sayisini soyler. => 4

myStringArray.count

myStringArray[myStringArray.count - 1] // sonuncu elemani getirir => "Plane"
myStringArray.last //bu da sonuncuyu getirir. method eklemisler boyle guzel xd

myStringArray.sort() // kendince siraliyor. string ise alfabetik, sayi ise kucukten buyuge siraliyor.

var myNumberArray = [71,5,36,12,15,88,]
myNumberArray.sort()
myNumberArray.append(10)
myNumberArray
myNumberArray[0] = 91 // 0.index artik 91 oldu.


//====== PART 2 - Set ======//


/* Set'ler dizi gibi ama indexleme yok, set icerisine ayni elemandan birkac defa yazsan da sadece 1 tane gozukuyor

 */

var mySet : Set = [1,2,3,4,5,1,2]
print(mySet) // indexleme olmadigi icin karisik yaziyo her seferinde rastgele xd bi de 1 ve 2'den 2 tane var saymiyo 2.leri.
mySet.first // 1 ciktisini vermez cunku indexleme yok :D

/*
 mesela internetten bir veri cektik ve ayni olanlarin dizide olmasini istemiyoruz ya bu gibi durumlarda
 veriyi diziye cekip, sonra diziyi de set haline getirebiliriz.
*/

var myInternetArray = [3,5,3,5,1,3] // output {3,5,3,5,1,3}
Set(myInternetArray) // outputs {5,3,1} (sayilarin yeri degisebilir cunku indexleme yok.)

var mySet1 : Set = [1,2,3]
var mySet2 : Set = [3,4,5]
// .union metodu: birlestirmeye yarar.
var mySet3 = mySet1.union(mySet2) //output {1,2,3,4,5} (yerleri degisik olur {5,2,3,1,4} gibi.


//====== PART 3 - Dictionary ======// (java'da hash map, map filan diye gecen sey)


//key-value pairing var burda. (anahtar-deger eslestirmesi gibi bsi)

var myCars = ["car1" : "bmw", "car2" : "porsche", "car3" : "bentley"]
//bu, string-string bir dictionary.
myCars["car1"] // output => "bmw"

myCars["car1"] = "lamborghini" //ile degistirebiliriz
myCars["car4"] = "mazda" // ile yeni seyler ekleyebiliriz.
myCars["car5"] = "tofas"
print(myCars)


var activitiesAndCalories = ["swim" : 200, "run" : 100, "football" : 300]
activitiesAndCalories["football"] // output 300

// Dictionary Quiz
//soru: Sozlukler dizi icinde de kullanilabilir. Kodun ciktisi nedir ?
var myList = [["Atil" : 60, "Hikmet" : 45],["Bar" : 2, "Zeynep" : 50]]
print(myList[1]["Bar"]!)

//output 2 ama ! (unlem) isaretini anlamadim ??? sacma bsi geldi.
