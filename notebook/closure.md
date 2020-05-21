### basic

```swift
let driving = {
    print("I'm driving in my car")
}
driving()
```

### accepting parameters

```swift
let driving = { (place: String) in
    print("I'm going to \(place) in my car")
}
```

### return from closure

```swift
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
let message = drivingWithReturn("London")
```

### closure as parameter

```swift
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
let driving = {
    print("I'm driving in my car")
}
travel(action: driving)
```

### trailing closure

```swift
travel() {
    print("I'm driving in my car")
}

// or
travel {
    print("I'm driving in my car")
}
```

### closure with params

```swift
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
```

### shorthand

```swift
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

travel { place -> String in
    return "I'm going to \(place) in my car"
}

travel { place in
    return "I'm going to \(place) in my car"
}

travel { place in
    "I'm going to \(place) in my car"
}

travel {
    "I'm going to \($0) in my car"
}

func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel {
    "I'm going to \($0) at \($1) miles per hour."
}
```

### return closure

```swift
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel()
result("London")
let result2 = travel()("London")
```

### capture value

```swift
func travel() -> (String) -> Void {
    var counter = 1    // 注意这个状态

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let result = travel()
result("London")
result("London")
result("London")
```
