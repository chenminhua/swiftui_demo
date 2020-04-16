have fun with swiftui

## references

https://developer.apple.com/tutorials/swiftui/creating-and-combining-views

## wrapper

- @State var
- @Binding
- @Published 用于创建 Observable 的对象，如果这样的对象更新了，使用它的 view 也会 reload
- @ObservedObject
- @EnvironmentObject 用来在 views 间 share data，比 @ObservedObject 简单

struct 的 method 不能直接修改其属性，除非是 mutating method，但是计算属性不能采用 mutating。

可以用 @State 来实现：we can’t change their properties because structs are fixed, but @State allows that value to be stored separately by SwiftUI in a place that can be modified.

```swift
class UserSettings: ObservableObject {
    @Published var score = 0
}

struct ContentView: View {
    @ObservedObject var settings = UserSettings()
}
```
