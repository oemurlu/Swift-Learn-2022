import UIKit

// Optionals

var myName : String = "Osman"
myName.uppercased()
/*
 Mesela "osman" yerini kullanicidan alcaz veya internetten cekcez (yani define etcez), ama kullanici deger girmedi veya internetten deger cekemedik. Bundan dolayi initialization ederken (orn: uppercase() fonksiyonuyla kullanirken hata meydana gelir, uygulama coker. Bu gibi durumlar olmamasi icin bazi yeni yazim sekilleri ogrenecegiz.
 */

/*
 DEFINE EDERKEN soru isareti koyunca myName2'yi optional yap demek oluyor. Ama bunu yapinca initialization ederken 2 durum olusuyor.
 1- myName2? yaparsak; deger gelirse yap, deger gelmezse bu kodu atla (yapma) demek oluyor.
 2- myName2! yaparsak; buraya kesinlikle, %100, vallahi billahi deger gelecek demek :D ama deger gelmedigi takdirde program hata veriyor tabii ki.
 */

var myName2 : String?
myName2?.uppercased()


/*
       ? vs !   kullanimini string sayiyi integer'a cevirmede gosterilebilir.
*/

var myAge = "20"
var myInt1 = Int(myAge) // boyle yapabiliriz ama bunu mesela 5 ile carpamayiz.

//var myInt2 = Int(myAge) * 5
/*
 boyle yapinca hata veriyor. Hata: Value of optional type 'Int?' must be unwrapped to a value of type 'Int'
 Cozum icin iki oneri sunuyor:
 1-Coalesce using '??' to provide a default when the optional value contains 'nil' : ?? koy ve cevirme basarili olmazsa bi tane deger soyle diyo. basarili olmazsa o verdigin degeri dondureyim diyor.
        var myInt2 = (Int(myAge) ?? 0) * 5  // string cevirilemezse 0 al ve 5 ile carp dedim mesela.
 2-Force-unwrap using '!' to abort execution if the optional value contains 'nil' : string ifade integer'a cevirebileceginden eminsen ! (unlem) koy diyo yani.
        var myInt2 = Int(myAge)! * 5
 */

/*
 ama mesela her zaman default deger koymak zorunda degiliz mesela. bunun yerine kullaniciya duzgun gir gibi bir sey diyebiliriz. Eger initializationbasarili olursa kodu dondurur, olmazsa wrong input yazdirabiliriz. Bunu kontrol edebilen yeni bir if yapisi var. 'if let' diye tanimliyoruz.
 */

if let myInt3 = Int(myAge) {  // myAge, integera cevirilenebiliniyorsa bu kod calisir.
    print(myInt3)
}
else {
    print("wrong input")
}
 // bunda illa deger filan belirlemiyoz guzelmis bu. hem de program hata vermiyor.

