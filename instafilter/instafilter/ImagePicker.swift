//
//  ImagePicker.swift
//  instafilter
//
//  Created by 陈敏华 on 4/20/20.
//  Copyright © 2020 陈敏华. All rights reserved.
//

import SwiftUI

// using UIViewControllerRepresentable means that ImagePicker is already a SwiftUI view that we can place inside our view hierarchy.
struct ImagePicker: UIViewControllerRepresentable {
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var image: UIImage?
    
    
    
    
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // When that ImagePicker struct is created, SwiftUI will automatically call its makeUIViewController() method,
    // which is what goes on to create and send back a UIImagePickerController.
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {

    }
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
}
