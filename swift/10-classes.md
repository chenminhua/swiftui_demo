```swift
class Dog {
    var name: String
    var breed: String

    init(name: String, breed: String) {
        self.name = name
        self.breed = breed
    }

    func makeNoise() {
        print("Woof!")
    }
}

// 继承
class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }

    override func makeNoise() {
        print("Yip!")
    }
}
```
