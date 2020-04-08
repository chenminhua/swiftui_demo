## Arrays

```swift
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]

beatles[1] ...
```

## sets

```swift
let colors = Set(["red", "green", "blue"])
```

## Tuples

```swift
var nums = (1,1,2,3,5)
var name = (first: "Taylor", last: "Swift")
name.0
name.first
```

## Dictionaries

```swift
let heights: [String: Double] = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Taylor Swift"]
heights["no one", default: "Unknown"]   // 字典访问时支持 default value，否则可能返回 nil
```

## Creating empty collections

```swift
var teams = [String: String]()
var results = [Int]()
var words = Set<String>()
```

## Enumerations

```swift
enum Result {
    case success
    case failure
}
let result4 = Result.failure

// Enum associated values
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}
let talking = Activity.talking(topic: "football")

// enum with raw value
enum Planet: Int {
    case mercury = 1   // 默认从0开始，可以设置从 1 或其他数开始
    case venus
    case earth
    case mars
}
```

## switch case

```swift
switch weather {
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Wrap up warm")
case "sunny":
    print("Wear sunscreen")
default:
    print("Enjoy your day!")
}
```

## range

```swift
1..<5  // 1,2,3,4
1...5  // 1,2,3,4,5
```
