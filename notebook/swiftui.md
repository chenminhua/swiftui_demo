- AppDelegate.swift contains code for managing your app.
- SceneDelegate.swift contains code for launching one window in your app.
- ContentView.swift contains the initial UI.
- Assets.xcassets is an asset catalog.
- info.plist is a set of values that describe to the system how your app works.


## quick start

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
```

- View 是来自 swiftui 的 basic protocol.
- var body: some View 定义了一个计算属性，表示会返回一个实现View Protocol的对象。
- some表示了只能返回同一种View
- View protocol 只有一个要求，就是要实现 var body: some View 这个计算属性
- Previews 实现了 PreviewProvider protocol
- Previews 使用了 xcode 的 cavnvas 功能

## Form, Group, Section

- The limit of 10 children inside a parent applies everywhere in SwiftUI.
- Group
- Section

## navigation bar

```swift
var body: some View {
    NavigationView {
        Form {
            Section {
                Text("Hello World")
            }
        }
        .navigationBarTitle(Text("SwiftUI"))
        // when you attach this modifier to form, swift actually create a new from
        // easier way is  .navigationBarTitle("SwiftUI")
    }
}
```

## modifying state

- Views are functions of their state.
- 如果我们要改一个View的属性，那么这个属性必须是var
- 如果我们要改一个struct的属性，必须是mutating fun
- 可是 body 是一个计算属性，不能是 mutating fun
- 为了解决这个问题，swiftui 引入了 @state 这样的一个 property wrapper
- @State 的属性和view是分开存储的，以实现可修改。
-  SwiftUI 频繁创建和销毁view, 所以使用struct做view对性能很重要。

```swift
struct ContentView: View {
    @State private var tapCount = 0

    var body: some View {
        Button("Tap Count: \(tapCount)") {
            self.tapCount += 1
        }
    }
}
```

## binding

- **show the value of this property here, but write any changes back to property**
- $符号表示双向绑定: the value of the property is read, but also written.

```swift
struct ContentView: View {
    @state private var name = ""

    var body: some View {
        Form {
            TextField("Enter your name", text: $name)   // 注意这里的 $ 符号，表示双向绑定
            Text("Your name is \(name)")
        }
    }
}
```

## create view in loop

```swift
struct ContentView: View {
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = 0

    var body: some View {
        VStack {
            // 注意这里有个双向绑定
            Picker("Select your student", selection: $selectedStudent) {
                ForEach(0 ..< students.count) {
                    Text(self.students[$0])
                }
            }
            Text("You chose: Student # \(students[selectedStudent])")
        }
    }
}
```

## TextField 与键盘类型

```swift
@State private var checkAmount = ""
TextField("Amount", text: $checkAmount)
    .keyboardType(.decimalPad)    // (.numberPad)
```

## Picker

```swift
let tipPercentages = [10, 15, 20, 25, 0]
@State private var tipPercentage = 2
Picker("Tip percentage", selection: $tipPercentage) {
    ForEach(0 ..< tipPercentages.count) {
        Text("\(self.tipPercentages[$0])%")
    }
}
.pickerStyle(SegmentedPickerStyle())
```

## stacks, buttons, images, alerts, asset catalogs, and more

- ZStack 中，先写的view在背景，后写的view在前景。
- VStack 中，垂直的列出view
- Gradient 梯度。LinearGradient, RadialGradient, AngularGradient
- Button, action, view
- alert


```swift
var body: some View {
    ZStack{
        LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
//            Color.blue.edgesIgnoringSafeArea(.all)
        VStack(spacing: 30) {
            Text("Tap the flag of")
                .foregroundColor(.white)
            Text(countries[correctAnswer])
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.black)
            ForEach(0 ..< 3) { number in
                Button(action: {
                    self.flagTapped(number)
                }) {
                    Image(self.countries[number])
                        .renderingMode(.original)
                        .clipShape(Capsule())
                        .overlay(Capsule().stroke(Color.black, lineWidth: 1))
                        .shadow(color: .black, radius: 2)
                }
            }
            Spacer()
        }
    }
    .alert(isPresented: $showingScore) {
        Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: 
            .default(Text("Continue")) {
            self.askQuestion()
        })
    }
}
```
