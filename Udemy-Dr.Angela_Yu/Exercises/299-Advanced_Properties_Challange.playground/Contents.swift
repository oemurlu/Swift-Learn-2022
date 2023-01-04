import UIKit


// PART - 1: duvarin en ve boy vercez, 1 kova boyanin kac m^2 yer kapladigini vercez ve kac kova boya lazim onu hesaplama uygulamasi yapcaz.(getter metodu)
// PART - 2: evde kac kova oldugunu verecegiz ve o boya kac m^2 boyayabilir onu yazdiracagiz. (setter metodu)


var width: Float = 1.5
var height: Float = 2.3

var bucketsOfPaint: Int {
    get {
        let area = width * height
        let areaCoveredPerBucket: Float = 1.5
        let numberOfBuckets = area / areaCoveredPerBucket
        let roundedBuckets = ceilf(numberOfBuckets)
        return Int(roundedBuckets)
    }
    
    set {
        let areaCanCover = Double(newValue) * 1.5
        print("\(newValue) kova boya ile \(areaCanCover) m^2 duvar boyayabilirsin ")
    }
    
}
//part-1
print("duvari boyaman icin \(bucketsOfPaint) kova boya lazim.")

//part-2
bucketsOfPaint = 4



