import UIKit


// MARK: - ENCAPSULATION UYGULANMAMIŞ HALİ
class Product {
    var id: Int
    var title: String
    var description: String
    var price: Double
    
    // MARK: - Constructor Method
    init(_ id: Int, _ title: String, _ description: String, _ price: Double) {
        self.id = id
        self.title = title
        self.description = description
        self.price = price
    }
}

var macbookPro = Product(1, "Macbook Pro", "2021 - 16 GB RAM - M1 Pro", 23400)
print("Product : \(macbookPro.title) Price: \(macbookPro.price)")

// Geliştirici niteliğe dışarıdan direk erişebildiği için ürün fiyatını negatif bir değere çevirebildi.
macbookPro.price = -500
print("Product : \(macbookPro.title) Price: \(macbookPro.price)")




// MARK: - ENCAPSULATION HALİ
class Productt {
    private var id: Int
    private var title: String
    private var description: String
    private var price: Double

    // MARK: - Constructor Method
    init(_ id: Int, _ title: String, _ description: String, _ price: Double) {
        self.id = id
        self.title = title
        self.description = description
        self.price = price
    }

    // MARK: - GETTER & SETTER
    func getId() -> Int {
        return id
    }
    func setId(_ id: Int) {
        self.id = id
    }

    func getTitle() -> String {
        return title
    }
    func setTitle(_ title: String) {
        self.title = title
    }

    func getDescription() -> String {
        return description
    }
    func setDescription(_ description: String) {
        self.description = description
    }

    func getPrice() -> Double {
        return price
    }
    func setPrice(_ price: Double) {
        // Setter metodu içerisinde anlamsızlıkları önlemek için gerekli şartları kontrol ediyoruz.
        if price < 0 { fatalError("Price 0'dan büyük olmalıdır.") }
        self.price = price
    }
}

var macbookPro2 = Productt(1, "Macbook Pro", "2021 - 16 GB RAM - M1 Pro", 23400)
print("Product : \(macbookPro2.getTitle()) Price: \(macbookPro2.getPrice())")


// -> FATAL ERROR: Price 0'dan büyük olmalıdır.
//macbookPro2.setPrice(-500)


// Geliştirici niteliğe dışarıdan direk erişemedi ve setter metodu ile erişip fiyat güncellemesini anlamlı bir biçimde yapabildi.
macbookPro2.setPrice(30000)
print("Product : \(macbookPro2.getTitle()) Price: \(macbookPro2.getPrice())")
