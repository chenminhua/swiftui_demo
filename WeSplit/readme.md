## Form, Group, Section

swiftUI 里面的元素很多都是只能有十个儿子。
swiftUI 会频繁创建和销毁 view，所以让 view 做成小巧简单的 struct 对于性能来说非常重要。

## VStack

## Picker

```Swift
Picker("Select your student", selection: $selectedStudent) {
    ForEach(0 ..< students.count) {
        Text(self.students[$0])
    }
}
Text("You chose: Student # \(students[selectedStudent])")
```

## 双向绑定

使用 \$ 符号，two-way binding

In Swift, we mark these two-way bindings with a special symbol so they stand out: we write a dollar sign before them. This tells Swift that it should read the value of the property but also write it back as any changes happen.

## State

struct 的 method 不能直接修改其属性，除非是 mutating method，但是计算属性不能采用 mutating。

可以用 @State 来实现：we can’t change their properties because structs are fixed, but @State allows that value to be stored separately by SwiftUI in a place that can be modified.

## textfield

```swift
TextField("Amount", text: $checkAmount)
    .keyboardType(.decimalPad)
```
