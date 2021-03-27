//
//  AddItemViewModel.swift
//  closet
//
//  Created by admin on 2021/3/27.
//

import UIKit
import CoreData

class AddItemViewModel: ObservableObject {
    var itemObj: ItemCD?
    
    @Published var title = ""
    @Published var amount = ""
    @Published var buyon = Date()
    @Published var note = ""
    @Published var category = ""
    @Published var showTypeDrop = false
    @Published var showTagDrop = false
    
    
    @Published var imageUpdated = false // When transaction edit, check if attachment is updated?
    @Published var imageAttached: UIImage? = nil
    
    @Published var alertMsg = String()
    @Published var showAlert = false
    @Published var closePresenter = false
    
    init(itemObj: ItemCD? = nil) {
        
        self.itemObj = itemObj
        self.title = itemObj?.title ?? ""
        if let expenseObj = itemObj {
            self.amount = String(expenseObj.amount)
            self.category = ""
        } else {
            self.amount = ""
            self.category = ""
        }
        self.buyon = itemObj?.buyOn ?? Date()
        self.note = itemObj?.note ?? ""
        
        if let data = itemObj?.imageAttached {
            self.imageAttached = UIImage(data: data)
        }
        
        AttachmentHandler.shared.imagePickedBlock = { [weak self] image in
            self?.imageUpdated = true
            self?.imageAttached = image
        }
    }
    
    func attachImage() { AttachmentHandler.shared.showAttachmentActionSheet() }
    
    func removeImage() { imageAttached = nil }
    
    func saveItem(managedObjectContext: NSManagedObjectContext) {
        
        let item: ItemCD
        let titleStr = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let amountStr = amount.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if titleStr.isEmpty || titleStr == "" {
            alertMsg = "Enter Title"; showAlert = true
            return
        }
        if amountStr.isEmpty || amountStr == "" {
            alertMsg = "Enter Amount"; showAlert = true
            return
        }
        guard let amount = Double(amountStr) else {
            alertMsg = "Enter valid number"; showAlert = true
            return
        }
        
        if itemObj != nil {
            
            item = itemObj!
            
            if let image = imageAttached {
                if imageUpdated {
                    if let _ = item.imageAttached {
                        // Delete Previous Image from CoreData
                    }
                    item.imageAttached = image.jpegData(compressionQuality: 1.0)
                }
            } else {
                if let _ = item.imageAttached {
                    // Delete Previous Image from CoreData
                }
                item.imageAttached = nil
            }
            
        } else {
            item = ItemCD(context: managedObjectContext)
            item.createdAt = Date()
            if let image = imageAttached {
                item.imageAttached = image.jpegData(compressionQuality: 1.0)
            }
        }
        item.updatedAt = Date()
        item.title = titleStr
        item.buyOn = buyon
        item.note = note
        item.amount = amount
        do {
            try managedObjectContext.save()
            closePresenter = true
        } catch { alertMsg = "\(error)"; showAlert = true }
    }
}
