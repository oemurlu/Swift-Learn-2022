import UIKit
//part-1
//struct Town {
//    let name = "osmanland"
//    var citizens = ["osman", "gizem"]
//    var resources = ["grain": 100, "ore": 42, "wool": 75]
//
//    func fortify(){
//        print("Defences increased!")
//    }
//}
//
//var myTown = Town()
//print(myTown.name)
//
//print("\(myTown.name) has \(myTown.resources["grain"]!) bags of grain.")
//
//myTown.citizens.append("habibe")
//print("\(myTown.name) has \(myTown.citizens.count) citizens.")
//
//myTown.fortify()


//part-2
struct Town {
    let name: String
    var citizens: [String]
    var resources: [String: Int]
    
    //init ==> constructor yani
    init(name: String, citizens: [String], resources: [String: Int]) {
        self.name = name
        self.citizens = citizens
        self.resources = resources
    }
    
    func fortify() {
        print("Defences increased")
    }
}


var secondTown = Town(name: "Osmanland koyu", citizens: ["osman", "gizem", "tefekkul", "erol", "serife"], resources: ["petrol" : 65])
secondTown.citizens.append("beytullah")
print(secondTown.citizens)

var thirdTown = Town(name: "Hayalet koy", citizens: [], resources: ["perili ev": 5])

thirdTown.fortify()


