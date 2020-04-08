https://www.hackingwithswift.com/100/12

## optional

```swift
var name: String? = nil

// 用 if let 来 unwrap optional变量
if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

// 用 guard let 来 unwrap optional变量
func greet(_ name: String?) {
    guard let unwrapped = name else {
        print("You didn't provide a name!")
        return
    }
    print("Hello, \(unwrapped)!")
}
```
