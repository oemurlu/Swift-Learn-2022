import Foundation

let tuple1 = ("Osman", 19)

let tuple2 = (name: "Emre", age: 20)

let tuple3: (name: String, age: Int)
tuple3 = (name: "Omurlu", age: 21)

let tuple4: (name: String, age: Int)
tuple4.name = "Denizli"
tuple4.age = 16


print("\(tuple1.0) is \(tuple1.1) yo.")
print("\(tuple2.name) is \(tuple2.age) yo.")
print("\(tuple3.name) is \(tuple3.age) yo.")
print("\(tuple4.name) is \(tuple4.age) yo.")

