import UIKit

class Odev2 {
    
    // Parametre olarak girilen kilometreyi mile donusturdukten sonra geri donduren bir metod yaz.
    func soru1(km: Double) -> Double {
        let mile = km * 0.621
        return mile
    }
    
    // Kenarlari parametre olarak girilen ve dikdortgeninn alanini hesaplayan bir metod yaziniz.
    func soru2(k1: Double, k2: Double) {
        let alan = k1 * k2
        print("dik4gen alani: \(alan)")
    }
    
    // Parametre olarak girilen sayinin faktoriyel degerini hesaplayip geri donduren metodu yaz.
    func soru3(n: Int) -> Int {
        if n == 1 {
            return n
        } else {
            return n * soru3(n: n - 1)
        }
    }
    
    // Parametre olarak girilen cumle icinde kac adet e harfi oldugunu gosteren bir metod yaz.
    func soru4(cumle: String) {
        var i = 0
        
        for harf in cumle {
            if harf == "e" || harf == "E" {
                i += 1
            }
        }
        print("cumle icinde \(i) tane e harfi bulunuyor.")
    }
    
    // Parametre olarak girilen kenar sayisina gore her bir ic aciyi hesaplayip sonucu geri gonderen metodu yaz.
    func soru5(kenarSayisi: Int) -> Double {
        let acilarToplami: Double = Double((kenarSayisi - 2)) * 180.0
        let birIcAci = acilarToplami / Double(kenarSayisi)
        return birIcAci
    }
    
    // Parametre olarak girilen gun sayisina gore maas hesabi yapan ve elde edilen degeri donduren metod yaz.
    // 1 gunde 8 saat calisiliyor.
    // Calisma saat ucreti = 40 tl
    // Mesai saat ucreti = 80 tl
    // 150 saat uzeri mesai sayilir
    func soru6(gunSayisi: Int) -> Int {
        let aylikSaat = gunSayisi * 8
        var normalMaas = 0
        var mesaiMaas = 0
        var totalMaas = 0
        
        if aylikSaat > 150 {
            normalMaas = 150 * 40
            mesaiMaas = (aylikSaat - 150) * 80
            totalMaas = normalMaas + mesaiMaas
        } else {
            totalMaas = aylikSaat * 40
        }
        return totalMaas
    }
    
    // Parametre olarak girilen otopark suresine gore otopark ucreti hesaplayarak geri donduren metodu yaziniz.
    // 1 saat = 50 tl
    // 1 saat asimindan sonra her 1 saat = 10 tl
    func soru7(otoparkSaaati: Int) -> Int {
        var ucret = 0
        
        if otoparkSaaati == 1 {
            ucret = 50
        } else {
            ucret = 50 + ((otoparkSaaati - 1) * 10)
        }
        
        return ucret
    }
    
    
}

let obj = Odev2()

let c1 = obj.soru1(km: 50)

obj.soru2(k1: 6, k2: 8)

let c3 = obj.soru3(n: 5)

obj.soru4(cumle: "hello again swift world. I'm Osman Emre")

let c5 = obj.soru5(kenarSayisi: 7)

let c6 = obj.soru6(gunSayisi: 20)

let c7 = obj.soru7(otoparkSaaati: 1)


