import UIKit

/**
 # ABSTRACTION

 Alt sınıfların ortak özelliklerini taşıyan ama nesnesi olmayan, inheritance veren soyutlanmış sınıftır.

 ##  Notes:

 1. Aşağıda Inheritance uygulanmamış ve uygulanmış kullanımına ait örnek bulabilirsiniz

 ##  Abstraction Örneği
 */

// MARK: - Abstract Class
class Ticket {
    var ticketNumber: String
    var firstName: String
    var lastName: String
    
    init(_ ticketNumber: String, _ firstName: String, _ lastName: String) {
        self.ticketNumber = ticketNumber
        self.firstName = firstName
        self.lastName = lastName
    }
}

class BusTicket: Ticket {
    var peronNumber: String
    
    // MARK: - Constructor Method
    init(_ ticketNumber: String, _ firstName: String, _ lastName: String, _ peronNumber: String) {
        self.peronNumber = peronNumber
        super.init(ticketNumber, firstName, lastName)
    }
}

class FlightTicket: Ticket {
    var gateNumber: String
    
    // MARK: - Constructor Method
    init(_ ticketNumber: String, _ firstName: String, _ lastName: String, _ gateNumber: String) {
        self.gateNumber = gateNumber
        super.init(ticketNumber, firstName, lastName)
    }
}


var busTicket = BusTicket("1234", "Erdem", "Karakaya", "6")
var flightTicket = FlightTicket("TK1234", "Erdem", "Karakaya", "G-4")
// Yukarıdaki 2 bilette görüldüğü üzere Abstract Class olan Ticket Class özelliklerini kullandık fakat Ticket nesnesi hiç yaratmadık.
