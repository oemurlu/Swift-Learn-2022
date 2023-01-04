import UIKit

class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Human: Animal {
    func code() {
        print("Coding...")
    }
}

class Fish: Animal {
    func breatheUnderWater() {
        print("Breathing under weater...")
    }
}


let osman = Human(name: "osman emre")
let enes = Human(name: "enes kaya")
let fish = Fish(name: "nemo")

let neighbours = [osman, enes, fish] //neighbours tipi Animaldir cunku ortak noktalari Animal

if neighbours[0] is Human {
    print("First neighbour is a human")
}

func findNemo(from animals: [Animal]) {
    for animal in animals {
        if animal is Fish {
            print(animal.name)
//            animal.breatheUnderWater() //yapamayiz cunku tipi hala animal
            let fish = animal as! Fish //animal'a forced downcasting yaptik. ALT SINIFA dosnusturduk. ama animal fish oldugunu bildigimiz icin yaptik bunu bilmeseydik soru isaretli olani yapardik alt ornekteki gibi.
            fish.breatheUnderWater() // yapabiliriz artik
            
            let animalFish = fish as Animal
            // as ile bir bir nesneyi UST SINIFA casting (upcast) etmek icin kullanilir. soru isareti veya unlem kullanilmaz cunku bir nesnenin ust sinifi varsa zaten kesin olarak ust sinifa gider.
            // let animalFish = fish deseydik animalFish, Fish turunde olacakti
            

            
        }
    }
}
findNemo(from: neighbours)


if let fish = neighbours[1] as? Fish { //downcasting ama daha guvenli
    fish.breatheUnderWater()
} else {
    print("Casting has failed.")
}


// as ile bir bir nesneyi UST SINIFA casting (upcast) etmek icin kullanilir. soru isareti veya unlem kullanilmaz cunku bir nesnenin ust sinifi varsa zaten kesin olarak ust sinifa gider.
