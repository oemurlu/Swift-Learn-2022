// STATIC OLAN BIR SEYI NESNE OLUSTURMADAN CAGIRABILIRIZ.
// STATIC DEGILSE NESNE OLUSTURMAMIZ LAZIM.


struct myStructure {
    let instanceProperty = "non-static let"
    static let typeProperty = "static let"
    
    func instanceMethod() {
        print("non-static method")
    }
    static func typeMethod() {
        print("static method")
    }

}

myStructure.typeProperty
myStructure.typeMethod()

//myStructure.instanceProperty yapamayiz nesne yok

var obj = myStructure()

obj.instanceProperty
obj.instanceMethod()
