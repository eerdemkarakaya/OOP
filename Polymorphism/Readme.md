# POLYMORPHISM

Çok biçimlilik anlamına gelir. Kısacası bir nesnenin birden fazla nesne gibi davranma şeklidir.

Yani interface/protocol yada Inheritance'tan gelen nitelik yada davranışları geçersiz kılarak aynı method adı ve parametreyle kendisine göre şekillendirmektir.

##  Notes:

1. Aşağıda Inheritance uygulanmamış ve uygulanmış kullanımına ait örnek bulabilirsiniz

##  Polymorphism Örneği

```swift
protocol Vehicle: AnyObject {
    func drive()
    func stop()
}
```

```swift
class Car: Vehicle {
    func drive() {
        print("Car driving.")
    }
    func stop() {
        print("Car stopping.")
    }
}

class Motocycle: Vehicle {
    func drive() {
        print("Motocycle driving.")
    }
    func stop() {
        print("Motocycle stopping.")
    }
}
```

```swift
class VehicleManager {
    private var vehicle: Vehicle

    // MARK: - Constructor Method
    init(_ vehicle: Vehicle) {
        self.vehicle = vehicle
    }

    // MARK: - Custom Method
    func drive() {
        vehicle.drive()
    }
    func stop() {
        vehicle.stop()
    }
}

var vehicleManager = VehicleManager(Car())
vehicleManager.drive() // -> Car driving.
vehicleManager.stop() // -> Car stopping.

vehicleManager = VehicleManager(Motocycle())
vehicleManager.drive() // -> Motocycle driving.
vehicleManager.stop() // -> Motocycle stopping.
```

