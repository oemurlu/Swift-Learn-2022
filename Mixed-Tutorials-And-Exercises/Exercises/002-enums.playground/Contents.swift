import Foundation

// ENUMS (ENUMERATIONS)

enum CompassPoint { // pusula gosterdigi yer
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead: CompassPoint = .west
directionToHead = .south

switch directionToHead {
case .north:
    print("north")
case .south:
    print("south")
case .east:
    print("east")
case .west:
    print("west")
}

let somePlanet = Planet.earth
//let sp: Planet = .earth boyle de yapabilirim

switch somePlanet {
case .earth:
    print("earth")
default:
    print("different planet (default case)")
}


print("\n-- iterating section --\n")
// Iterating
enum Beverage: CaseIterable {
    case coffee, tea, juice, portakal
}

let numberOfChoices = Beverage.allCases.count

for beverage in Beverage.allCases {
    print(beverage)
}


print("\n-- associated values --\n")
// associated values

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qr(String)
}

var productBarCode = Barcode.upc(8, 85909, 51225, 3)
productBarCode = .qr("ABCASVCBCAS")

switch productBarCode {
case .upc(let a, let b, let c, let d):
    print(a)
case .qr(let kod):
    print(kod)
}

//Raw values
enum MilkywayPlanet: Int {
    case mercury = 3
    case venus
    case mars
}

enum Compass: String {
    case north, south
}

let raw = MilkywayPlanet.venus.rawValue
let rawForCompass = Compass.north.rawValue

let rawValue = 1
let mecury = MilkywayPlanet(rawValue: rawValue)
