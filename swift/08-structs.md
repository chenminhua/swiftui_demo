```swift
struct Sport {
    var name: String
}
var tennis = Sport(name: "Tennis")
print(tennis.name)
```

## 计算属性

```swift
struct Sport {
    var name: String
    var isOlympicSport: Bool

    var olympicStatus: String {
        if isOlympicSport {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }
}
let chessBoxing = Sport(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)
```

## 属性观察器 Property Observers

```swift
struct Progress {
    var task: String
    var amount: Int {
        didSet {
            print("\(task) is now \(amount)% complete")
        }
    }
}
```

## methods

```swift
struct City {
    var population: Int

    func collectTaxes() -> Int {
        return population * 1000
    }
}
let london = City(population: 9_000_000)
london.collectTaxes()
```

## mutating method

如果想要改 struct 内部的状态，就要加上 mutating

```swift
struct Person {
    var name: String

    mutating func makeAnonymous() {
        name = "Anonymous"
    }
}
```

## initializer

We can provide our own initializer to replace the default one. For example, we might want to create all new users as “Anonymous” and print a message, like this:

```swift
struct User {
    var username: String

    init() {
        self.username = "Anonymous"
        print("Creating a new user!")
    }
}
```

## lazy property

```swift
struct Person {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}
```

## static property

```swift
struct Student {
    static var classSize = 0
    var name: String

    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}
```

## access control

- private
- public
