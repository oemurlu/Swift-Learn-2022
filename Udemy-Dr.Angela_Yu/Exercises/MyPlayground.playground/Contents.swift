import UIKit
//
//
//
//func greeting(name: String){
//    print("Hello \(name)")
//}
//
//greeting(name: "Osman")

//Don't change this code:
func calculator() {
  let a = Int(readLine()!)! //First input
  let b = Int(readLine()!)! //Second input
  
  add(n1: a, n2: b)
  subtract(n1: a, n2: b)
  multiply(n1: a, n2: b)
  divide(n1: a, n2: b)
  
}

//Write your code below this line to make the above function calls work.

func add(n1: Int, n2: Int) {
    let result = n1 + n2
    print(result)
}

func subtract(n1: Int, n2: Int) {
    let result = n1 - n2
    print(result)
}

func multiply(n1: Int, n2: Int) {
    let result = n1 * n2
    print(result)
}

func divide(n1: Int, n2: Int) {
    let result = n1 / n2
    print(result)
}


//func add(n1: Int, n2: Int){
//    print(n1 + n2)
//}
//
//func subtract(n1: Int, n2: Int) { print(n1 - n2)}
//
//func multiply(n1: Int, n2: Int){ print(n1 * n2)}
//
//func divide(n1: Int, n2: Int) {
//
//let divideDoubles = Double(n1) / Double(n2)
//
//print(divideDoubles)
//
//}
