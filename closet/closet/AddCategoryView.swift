//
//  AddCategoryView.swift
//  closet
//
//  Created by admin on 2021/1/17.
//

import SwiftUI

struct AddCategoryView: View {
    @State var image: Image? = nil
    @State var showCaptureImageView: Bool = false
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    var source: UIImagePickerController.SourceType = .photoLibrary
    
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("类别名称", text: $name)
                }
                
                Section {
                    Button(action: {
                        self.showCaptureImageView.toggle()

                      /// TODO 1: Add the action here
                    }) {
                        Text("Choose photos")
                    }
                    image?.resizable()
                      .frame(width: 250, height: 250)
                      .clipShape(Circle())
                      .overlay(Circle().stroke(Color.white, lineWidth: 4))
                      .shadow(radius: 10)
                    
                    if (showCaptureImageView) {
                            CaptureImageView(isShown: $showCaptureImageView, image: $image, source: source)
                          }
                }
                

                Section {
                    Button("Save") {
                        let newCat = CLCategory(context: self.moc)
                        newCat.name = name
                        
                        try? self.moc.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                }
                

            }
            .navigationBarTitle("新建类别")
        }
    }
}

struct AddCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryView()
    }
}
