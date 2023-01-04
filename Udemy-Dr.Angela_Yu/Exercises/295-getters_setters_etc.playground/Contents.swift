//UIKit iOS icin, Foundation tum swift iceriyomus. macOS filan dahil
import UIKit

//MARK: - PART-1 Getters and Setters
//
//let pizzaInInches: Int = 10
//var numberOfSlices: Int { //getter uzun hali.
//    get {
//        return pizzaInInches - 4
//    }
//    set {
//        print("numberOfSlices now has a new value which is \(newValue)")
//    }
//}
//
//var numberOfSlices2: Int { // bu kod blogunun ici getter oluyo. kisa hali
//    return pizzaInInches - 4
//}
//
//print(numberOfSlices)
//print(numberOfSlices2)
//
//
//numberOfSlices = 12 //setter oldugu icin boyle atama yapabiliyorum.
////numberOfSlices2 = 12 bu hata veriyor cunku setter yok.
//

//MARK: - PART - 2 Computed Properties
//
//let pizzaInInches: Int = 16
//var numberOfPeople: Int = 12
//let slicesPerPerson: Int = 4
//
//var numberOfSlices: Int {
//    get {
//        return pizzaInInches - 4
//    }
//}
//
//var numberOfPizza: Int {
//    get {
//        let numberOfPeopleFedPerPizza = numberOfSlices / slicesPerPerson
//        return numberOfPeople / numberOfPeopleFedPerPizza
//    }
//    set {
//        let totalSlices = numberOfSlices * newValue //newValue hep boyle yazilir degistirilemez!
//        numberOfPeople = totalSlices / slicesPerPerson
//    }
//}
//
//print("\(numberOfPizza) => numberOfPizza") // => 4
//print("\(numberOfPeople) => numberOfPeople normal")
//
//numberOfPizza = 8 // setter metodu tetiklendi boyle yapinca
//print("\(numberOfPeople) => setterdan degisen numberOfPeople: ")
//


//MARK: - PART - 3 Observed Properties

////willSet ve didSet pizzaInInches'in ne zaman degistigini izliyor. yazdigin yer farketmez once willSet calisir hep.
//
//var pizzaInInches: Int = 10 {
//    willSet {
//        print("\(newValue) => newValue (willSet)")
//    }
//    didSet {
//        print("\(oldValue) => oldValue (didSet)")
//
//    }
//}
//
//pizzaInInches = 8 //yazinca willSet ve didSet tetiklendi ve yazdirdi newValue ve oldValue'yi.
//

//MARK: - PART - 3.5 (part 3'un ornegi)

var pizzaInInches: Int = 10 {
    willSet {
        
    }
    didSet {
        if pizzaInInches >= 18 {
            print("invalid size specified, pizzaInInches set to 18.")
            pizzaInInches = 18
        }

    }
}

pizzaInInches = 33 //yazinca willSet ve didSet tetiklendi ve yazdirdi newValue ve oldValue'yi.
print("pizzaInInches: \(pizzaInInches)")

