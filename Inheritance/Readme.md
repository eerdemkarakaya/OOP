# INHERITANCE

Kalıtım veya Miras alma anlamına gelir. Miras alan sınıf superclass'taki tüm nitelik ve davranışları kendisine alması demektir.

- Miras veren sınıfa **superclass**,
- Miras alan sınıfa **subclass** denir.

##  Notes:

1. Aşağıda Inheritance uygulanmamış ve uygulanmış kullanımına ait örnek bulabilirsiniz

##  Inheritance Uygulanmamış Hali
```swift
class IndividualCustomer {
    var id: Int
    var customerNumber: String
    var firstName: String
    var lastName: String
    var nationalIdentity: String

    // MARK: - Constructor Method
    init(_ id: Int, _ customerNumber: String, _ firstName: String, _ lastName: String, _ nationalIdentity: String) {
        self.id = id
        self.customerNumber = customerNumber
        self.firstName = firstName
        self.lastName = lastName
        self.nationalIdentity = nationalIdentity
    }
}

class CorporateCustomer {
    var id: Int
    var customerNumber: String
    var companyName: String
    var taxNumber: String

    init(_ id: Int, _ customerNumber: String, _ companyName: String, _ taxNumber: String) {
        self.id = id
        self.customerNumber = customerNumber
        self.companyName = companyName
        self.taxNumber = taxNumber
    }
}
```

```swift
var erdem = IndividualCustomer(1, "1234", "Erdem", "Karakaya", "4321432143")
print("ID: \(erdem.id) - firstName: \(erdem.firstName)")
// -> ID: 1 - firstName: Erdem

var hepsiburada = CorporateCustomer(2, "0987", "Hepsiburada", "4444")
print("ID: \(hepsiburada.id) - companyName: \(hepsiburada.companyName)")
// -> ID: 2 - companyName: Hepsiburada
```

##  YAPILACAK İŞLEM

- Ortak olan nitelik ve davranışları ayrı bir class 'a alıyoruz. Yani superClass yaratıp, oraya taşıyoruz
- Ortak olan nitelik ve davranışları miras alan subClass'lardan kaldırıyor ve inheritance veriyoruz.
- Miras alan sınıf içerisindeki Constructor Metotta superClass'a ait nitelikleri **super.init()** ile dolduruyoruz. 

##  Inheritance Uygulanmış Hali

```swift
// MARK: - SuperClass -> Miras Veren Sınıf
class Customer {
    var id: Int
    var customerNumber: String

    // MARK: - Constructor Method
    init(_ id: Int, _ customerNumber: String) {
        self.id = id
        self.customerNumber = customerNumber
    }
}
```

```swift
// MARK: - SubClass -> Miras Alan Sınıf
class IndividualCustomer: Customer {
    var firstName: String
    var lastName: String
    var nationalIdentity: String

    // MARK: - Constructor Method
    init(_ id: Int, _ customerNumber: String, _ firstName: String, _ lastName: String, _ nationalIdentity: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.nationalIdentity = nationalIdentity
        
        super.init(id, customerNumber)
    }
}

// MARK: - SubClass -> Miras Alan Sınıf
class CorporateCustomer: Customer {
    var companyName: String
    var taxNumber: String

    // MARK: - Constructor Method
    init(_ id: Int, _ customerNumber: String, _ companyName: String, _ taxNumber: String) {
        self.companyName = companyName
        self.taxNumber = taxNumber

        super.init(id, customerNumber)
    }
}
```

```swift
var erdem = IndividualCustomer(1, "1234", "Erdem", "Karakaya", "4321432143")
print("ID: \(erdem.id) - firstName: \(erdem.firstName)")
// -> ID: 1 - firstName: Erdem

var hepsiburada = CorporateCustomer(2, "0987", "Hepsiburada", "4444")
print("ID: \(hepsiburada.id) - companyName: \(hepsiburada.companyName)")
// -> ID: 2 - companyName: Hepsiburada
```

## Operasyonel Kısmı
```swift
// MARK: - OPERASYONEL KISMI İÇİN
class CustomerManager {
    func add(_ customer: Customer) {
        /** 
        SuperClass'tan parametre alıyor. Bu yüzden 
            - ister Individual,
            - ister Corporate 
        Sınıfı yollansın farketmeksizin parametre kabul edebiliyor.
        */
    }
}

var customerManager = CustomerManager()
customerManager.add(erdem) // -> Individual Gönderildi.
customerManager.add(hepsiburada) // -> Corporate Gönderildi.
```
