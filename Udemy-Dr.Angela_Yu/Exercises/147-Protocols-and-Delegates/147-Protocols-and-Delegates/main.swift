protocol AdvancedLifeSupport {
    func performCPR()
}

class EmergencyCallHandler {
    var temsilci: AdvancedLifeSupport?
    
    func assessSituation() {
        print("can u tell me what happened?")
    }
    
    func medicalEmergency() {
        temsilci?.performCPR()
    }
}

struct Paramedic: AdvancedLifeSupport {
    init(handler: EmergencyCallHandler) {
        handler.temsilci = self
    }
    
    func performCPR() {
        print("The paramedic does chest compressions, 30 per second")
    }
        
}

class Doctor: AdvancedLifeSupport {
    
    init(handler: EmergencyCallHandler) {
        handler.temsilci = self
    }
    
    func performCPR() {
        print("The doctor does chest compressions, 30 per second")

    }
    
    func useStethescope() {
        print("listenin for heart sounds")
    }
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sings staying alive by the BeeGees")
    }
    
    func useElectricDrill() {
        print("Whirrrrr")
    }
    
}

let osman = EmergencyCallHandler()
let emre = Surgeon(handler: osman)

osman.assessSituation()
osman.medicalEmergency()

