## Basic 

- var, let
- String, Int
- Double, boolean
- string interpolation.   "your score was \(score)"
- type annotation:    

```swift
let year: Int = 1989
```

## string

```swift
let string = "Do or do not, there is no try."
print(string.count)
print(string.hasPrefix("Do"))
print(string.uppercased())
print(string.sorted())
```

## Array

```swift
let beatles = ["John Lennon", "Paul McCartney", "George Harrison", "Ringo Starr"]
let beatlescp :[String] = beatles

var toys = ["Woody"]
print(toys.count)
toys.append("Buzz")
toys.firstIndex(of: "Buzz")
print(toys.sorted())
toys.remove(at: 0)
```

## Set

```swift
let colors = Set(["red", "green", "blue"])
```

## Tuple

```swift
var name = (first: "taylor", second: "swift")
name.0
name.first
```

## Dictionary

```swift
let heights = ["Taylor Swift": 1.78, "Ed Sheeran": 1.73]
let heights2 :[String: Double] = heights
heights["Taylor Swift"]
heights["minhua"] // nil
heights["minhua", default: 1.8]  // 1.8
```

## create empty collection

```swift
var teams = [String: String]()
var results = [Int]()
var words = Set<String>()
```

## enum

```swift
enum Result {
    case success
    case failure
}


enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "football")

// 默认 raw value 从 0 开始，可以改
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}
let earth = Planet(rawValue: 3)
```

## 三元表达式  ternary operator

```swift
print(first == second ? "cards are the same" : "cards are different")
```

## switch

```swift
switch weather {
    case "rain":
        print("bring an umbrella")
    case "snow":
        print("wrap up warm")
    case "sunny":
        print("wear sunscreen")
    default:
        print("enjoy your day")
}
```

## loop

```swift
// for loop
for number in 1...10 {
    print("number is \(number)")
}

let albums = ["red", "1989", "reputation"]
for album in albums {
    print("\(album) is on apple music")
}

// while loop
while number <= 20 {
    number += 1
}

// repeat loop
repeat {
    number += 1
} while number <= 20

// break, continue
// break label
outerLoop: for i in 1...10 {
    for j in 1...10 {
        let product = i * j
        print ("\(i) * \(j) is \(product)")

        if product == 50 {
            print("It's a bullseye!")
            break outerLoop
        }
    }
}
```

## function

```swift
func square(number: Int) -> Int {
    return number * number
}

// parameter labels
func sayHello(to name: String) {
    print("hello, \(name)")
}
sayHello(to: "Taylor")

// default value
func greet(_ person: String, nicely: Bool = true) {
    if nicely == true {
        print("hello, \(person)")
    } else {
        print("oh no, it's \(person) again...")
    }
}
greet("taylor")
greet("taylor", nicely: false)
```

## throwing function

```swift
func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}
```

## inout parameter （指针）

```swift
func doubleInPlace(number: inout Int) {
    number *= 2
}

var myNum = 10 
doubleInPlace(number: &myNum)
```

## struct

```swift
struct Sport {
    var name: String
    var isOlympicSport: Bool
    var rule: String {
        didSet {
            ...
        }
    }
    
    var olympicStatus: String {
        if isOlympicStatus: String {
            return "\(name) is an Olympic sport"
        } else {
            return "\(name) is not an Olympic sport"
        }
    }

    func returnSomething() -> String {
        return "sport \(name), rule \(rule)"
    }

    // 改变属性需要使用 mutating func
    mutating func changeRule(newrule: String) {
        rule = newrule;
    }
}
var tennis = Sport(name: "Tennis", isOlympicSport: false)
print(tennis.name)
```

#### initializer

```swift
struct User {
    var username: String

    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}
```

#### lazy properties

```swift
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person {
    var name: String
    lazy var familyTree = FamilyTree()

    init(name: String) {
        self.name = name
    }
}

var ed = Person(name: "Ed")
```

## access control

- private
- fileprivate
- public 

## class

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
let poppy = Dog(name: "Poppy", breed: "Poodle")

final class Poodle: Dog {
    init(name: String) {
        super.init(name: name, breed: "Poodle")
    }

    override func makeNoise() {
        print("Yip!")
    }
}
```

## protocls and extensions

#### protocol is interface

```swift
protocol Identifiable {
    var id: String { get set }
}
struct User: Identifiable {
    var id: String
}
func displayID(thing: Identifiable) {
    print("My ID is \(thing.id)")
}
```

#### protocol

```swift
protocol Payable {
    func calculateWages() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation { }
```

#### extensions

```swift
extension Int {
    func squared() -> Int {
        return self * self
    }
}
let number = 8
number.squared()
```

#### protocol extensions

```swift
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]
let beatles = Set(["John", "Paul", "George", "Ringo"])

extension Collection {
    func summarize() {
        print("There are \(count) of us:")

        for name in self {
            print(name)
        }
    }
}

pythons.summarize()
beatles.summarize()
```

#### 面向 protocol 编程

```swift
protocol Identifiable {
    var id: String { get set }
    func identify()
}
extension Identifiable {
    func identify() {
        print("My ID is \(id).")
    }
}

struct User: Identifiable {
    var id: String
}

let twostraws = User(id: "twostraws")
twostraws.identify()
```

## optional, unwraping, typecasting

#### unwrap optional
```swift
var name: String? = nil

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}
```

#### unwrap with guard
```swift
func greet(_name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }

    print("Hello, \(unwrapped)!")
}
```

#### force unwrap

```swift
let str = "5"
let num = Int(str)!
```

#### nil coalescing

```swift
func username(for id: Int) -> String? {
    if id == 1 {
        return "Taylor Swift"
    } else {
        return nil
    }
}
let user = username(for: 15) ?? "Anonymous"
```

#### optional chaining

```swift
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()
```

#### optional try

```swift
enum PasswordError: Error {
    case obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" {
        throw PasswordError.obvious
    }

    return true
}

do {
    try checkPassword("password")
    print("That password is good!")
} catch {
    print("You can't use that password.")
}

if let result = try? checkPassword("password") {
    print("Result was \(result)")
} else {
    print("D'oh.")
}

try! checkPassword("sekrit")
print("OK!")
```

#### typecasting

```swift
class Animal { }
class Fish: Animal { }

class Dog: Animal {
    func makeNoise() {
        print("Woof!")
    }
}
let pets = [Fish(), Dog(), Fish(), Dog()]

for pet in pets {
    if let dog = pet as? Dog {
        dog.makeNoise()
    }
}
```

