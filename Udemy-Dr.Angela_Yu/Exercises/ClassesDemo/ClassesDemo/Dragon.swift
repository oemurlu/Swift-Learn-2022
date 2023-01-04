// class ClassName: InheritedClassName

class Dragon: Enemy {
    var wingSpan = 2.5
    
    func talk(speech: String) {
        print("Says: \(speech)")
    }
    
    override func move() {
        print("Fly forwars")
    }
    
    override func attack() {
        super.attack()
        print("Spits fire, does 15 damage")
    }
    
}
