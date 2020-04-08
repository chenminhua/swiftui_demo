```swift
// 最基本的闭包
let driving = {
    print("I'm driving in my car")
}
driving()

// 有参数的闭包
let driving = { (place: String) in
    print("I'm going to \(place) in my car")
}
driving("London")

// 闭包返回值
let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
let message = drivingWithReturn("London")
print(message)

// 闭包作为参数
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
travel(action: driving)
```

## 尾闭包语法

```swift
func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}
// 调用可以写成下面两种形式
travel() {
    print("I'm driving in my car")
}
travel {
    print("I'm driving in my car")
}
```

## Using closures as parameters when they accept parameters

```swift
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}
travel { (place: String) in
    print("I'm going to \(place) in my car")
}
```

## Using closures as parameters when they return values

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
```

## Shorthand parameter names

```swift
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
travel { place -> String in
    return "I'm going to \(place) in my car"
}
```

## 多参数闭包

```swift
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

## 返回一个闭包

```swift
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}
let result = travel()
result("London")
```

## capture value

```swift
func travel() -> (String) -> Void {
    var counter = 1

    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}
result("London")
result("London")
result("London")
```
