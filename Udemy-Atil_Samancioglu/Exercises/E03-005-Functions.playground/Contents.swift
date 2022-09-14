import UIKit

func myFunction(){
    print("my function printed")
}
myFunction()


// Input & Output & Return yapisi

//void function
func sum(x: Int, y: Int){
    print(x + y)
}
sum(x: 10, y: 20) // output 30 // sum yazarken void yaziyo zaten orda.

//return function
func minus(a: Int, b: Int) -> Int {
    return a-b
}
minus(a: 8, b: 4) // minus yazarken int yaziyo artik orda. yani bunu bir int degisken olarak atayabiliriz.
let degisken = minus(a: 10, b: 3)
print(degisken)

func logicFunc(a: Int, b: Int) -> Bool {
    if a > b{
        return true
    }
    else {
        return false
    }
}

logicFunc(a: 10, b: 2) // true
logicFunc(a: 2, b: 10) // false

