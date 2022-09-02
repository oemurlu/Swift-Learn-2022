import UIKit

// While loop

var number = 0
while number <= 3 {
    print(number)
    number += 1
}

var characterAlive = true
while characterAlive == true {
    print("character alive")
    characterAlive = false
}
print("----- for loop -----")
// For loop
var bestFruits = ["Strawberry", "Watermelon", "green plum"]
/* C-style loop dongusu swift 3 ile kaldirildi. Asagidaki gibi yapamiyoruz.
for (int i=0;i<2;i++){
    print(bestFruits[i])
}
*/

for fruit in bestFruits {
    print(fruit) // her elemani tek tek 'fruit' degiskenine atama yapar ve hepsini tek tek yazdirir.
}

var myNumbers = [10,20,30,40,50,60]
for onaBolunmusSayilar in myNumbers {
    print(onaBolunmusSayilar / 10)
}
print("**************")
//yeni bir for bicimi

for dogalSayilar in 0 ... 9 { // [0,9] kapali araligi.
    print(dogalSayilar)
}
print("============")
// loops quiz 1 soru
var fibonacciArray = [1,1,2,3,5,8,13]
 
for num in fibonacciArray {
    
    let num5 = num * 5
    print(num5)
 
}
//Bu kodun çıktısı aşağıdakilerden hangisidir?
// => [5,5,10,15,25,40,65]
