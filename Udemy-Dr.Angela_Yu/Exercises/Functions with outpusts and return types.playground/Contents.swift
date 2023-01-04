import UIKit

func getMilk (money: Int) -> Int {
    let change = money - 2
    return change
}

getMilk(money: 12)

func greeting1() {
    print("greeting1")
}

func greeting2(name: String) {
    print("greeting2 \(name)")
}

func greeting3(name: String) -> Bool {
    if name == "osman" || name == "oe.moto" {
        return true
    } else {
        return false
    }
}

greeting1()
greeting2(name: "osman")
var doruYanlis = greeting3(name: "oe.moto")
print(doruYanlis)



func isOdd(n: Int) -> Bool {
    if n % 2 == 1 {
        return true
    } else {
        return false
    }
}
isOdd(n: 5)
