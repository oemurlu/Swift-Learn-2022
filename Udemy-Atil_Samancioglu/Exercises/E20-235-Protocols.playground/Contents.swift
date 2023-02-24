// @oemurlu -- 24 Feb 2023
// Protocols

import Cocoa

protocol Running {
    func myRun()
}

class Animal {
    func running() {
        print("Animal running...")
    }
}

class Dog: Animal {
    
}

class Cat: Animal {
    override func running() {
        print("Cat running..")
    }
}

class Lion: Running {
    func myRun() {
        print("Lion running... (protocol)")
    }
}

//hem inheritance hem de protocol
class Turtle: Animal, Running {
    func myRun() {
        print("Turtle running... (protocol)")
    }
}

let animal = Animal()
let dog = Dog()
let cat = Cat()
let lion = Lion()
let turtle = Turtle()

animal.running()
dog.running()
cat.running()
lion.myRun()

turtle.myRun()
turtle.running()

