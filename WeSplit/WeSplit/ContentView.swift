//
//  ContentView.swift
//  WeSplit
//
//  Created by 陈敏华 on 4/8/20.
//  Copyright © 2020 陈敏华. All rights reserved.
//

import SwiftUI

// Form, Group, Section
// VStack, Picker

// swiftUI里面的元素很多都是只能有十个儿子

// ****    Views are function of their state    ****

// SwiftUI destroys and recreates your structs frequently, so keeping them small and simple structs is important for performance.

struct ContentView: View {
    
    let students = ["Harry", "Hermione", "Ron"]
    
    // @State allows us to work around the limitation of structs: we know we can’t change their properties because structs are fixed, but @State allows that value to be stored separately by SwiftUI in a place that can be modified.
    @State private var tapCount = 0
    @State private var name = ""
    @State private var selectedStudent = 0
    
    var body: some View {
        NavigationView{
            Form {
                // 最多十个儿子
                Button("Tap count: \(tapCount)") {
                    self.tapCount += 1
                }
                
                // 双向绑定  two-way binding
                // In Swift, we mark these two-way bindings with a special symbol so they stand out: we write a dollar sign before them. This tells Swift that it should read the value of the property but also write it back as any changes happen.
                TextField("enter your name", text: $name)
                Text("Hello \(name)")
                
                VStack {
                    Picker("Select your student", selection: $selectedStudent) {
                        ForEach(0 ..< students.count) {
                            Text(self.students[$0])
                        }
                    }
                    Text("You chose: Student # \(students[selectedStudent])")
                }
                
            }
            .navigationBarTitle("swiftui", displayMode: .inline)
            // When we attach the .navigationBarTitle() modifier to our form, Swift actually creates a new form that has a navigation bar title plus all the existing contents you provided.
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
