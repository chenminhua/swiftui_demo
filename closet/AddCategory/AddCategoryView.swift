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
    
    
    @State private var name = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("类别名称", text: $name)
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
