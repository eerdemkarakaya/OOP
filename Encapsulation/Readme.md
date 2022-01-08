# ENCAPSULATION

Bir sınıfa ait niteliklerin sadece o sınıf içerisindeki getter ve setter metotları ile yönetilmesi ilkesidir. Bu ilke sayesinde nesnelerde oluşabilecek **anlamsızlıkların** önüne geçilebilir.
- **Getter:** Okuma, Veri getirme işlemi yapar.
- **Setter:** Niteliğin değerini değiştirmemizi, güncellememizi sağlar.

**Örnek:**  
- Sınıfımızda price niteliği olduğunu ve kapsülleme yapmadığımızı düşünelim.
- Geliştiriciler price niteliğine anlamsız değerler verebilir. Yani price için negatif değer verebilirler.

- Biz bu sınıfı kapsülleyerek ve o niteliğin setter metodu ile price niteliğinin 0'dan büyük olması gerektiğinin kontrolü gibi kontroller yapabilir ve niteliği güncellemeden önce bu anlamsızlıkların önüne geçebiliriz.

##  Notes: 

1. Aşağıda yanlış kullanımı ve doğru kullanımına ait örnek bulabilirsiniz.

##  Encapsulation Uygulanmamış Hali

- Product sınıfındaki ürünün price niteliği negatif değer olmamalıdır. Encapsülation uygulanmadığı için daha sonrasında geliştirici bu değere direk erişip negatif bir değer olarak atama yapabildi ve anlamsız bir durum ortaya çıktı.
```swift
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
// -> "Product : Macbook Pro Price: 23400.0"

// Geliştirici niteliğe dışarıdan direk erişebildiği için ürün fiyatını negatif bir değere çevirebildi.
macbookPro.price = -500
print("Product : \(macbookPro.title) Price: \(macbookPro.price)") 
// -> "Product : Macbook Pro Price: -500.0"
```

##  YAPILACAK İŞLEM

- Niteliklerin önüne Erişim belirleyicilerden private olan belirleyiciyle niteliği dışarıdan erişime kapatıyoruz.

- Niteliklerimize erişmek veya değiştirmek için Getter ve Setter metotlarımızı tanımlıyoruz.

- Setter metotlarında niteliklerimize anlam kazandıracak kontrolleri yapıyoruz.

##  Encapsulation Uygulanmış Hali

```swift
 class Product {
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
        return  description
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

var macbookPro = Product(1, "Macbook Pro", "2021 - 16 GB RAM - M1 Pro", 23400)
print("Product : \(macbookPro.getTitle()) Price: \(macbookPro.getPrice())")
// -> "Product : Macbook Pro Price: 23400.0"


macbookPro.setPrice(-500) 
// -> FATAL ERROR: Price 0'dan büyük olmalıdır.


// Geliştirici niteliğe dışarıdan direk erişemedi ve setter metodu ile erişip fiyat güncellemesini anlamlı bir biçimde yapabildi.
macbookPro.setPrice(30000) 
print("Product : \(macbookPro.getTitle()) Price: \(macbookPro.getPrice())")
// -> "Product : Macbook Pro Price: 30000.0"
```
