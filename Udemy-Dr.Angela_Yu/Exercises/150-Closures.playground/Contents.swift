import UIKit

func calculator (n1: Int, n2: Int, operation: (Int, Int) -> Int) -> Int {
    return operation(n1, n2)
}

func add (no1: Int, no2: Int) -> Int {
    return no1 + no2
}


let result = calculator(n1: 2, n2: 3) {$0 * $1}
// $0 0. PARAMETRE demek oluyor.




let array = [3,5,2,9,1]

func addOne(n1: Int) -> Int {
    return n1 + 1
}
print(array.map(addOne))


print(array.map{$0 + 1})


