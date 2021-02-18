//
//  CategoryView.swift
//  closet
//
//  Created by admin on 2021/1/17.
//

import SwiftUI
import CoreData

struct CategoryView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
//    @FetchRequest(
//        entity: Item.entity(),
//        sortDescriptors: [
//            NSSortDescriptor(keyPath: \Item.createdat,ascending: true)],
//        predicate: NSPredicate(format: "category == '\(category.name!)'")
//    )
    var fetchRequest: FetchRequest<Item>
    var items: FetchedResults<Item> {
        fetchRequest.wrappedValue
    }
    
    let category: CLCategory
    
    init(category: CLCategory) {
        self.category = category
        fetchRequest = FetchRequest<Item>(
            entity: Item.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Item.createdat,ascending: true)],
            predicate: NSPredicate(format: "category = %@", category.name!))
    }
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item.name!)
                }.onDelete(perform: deleteItem)
            }
            .navigationBarTitle(category.name!)
        }
        
    }
    
    func deleteItem(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let item = items[offset]

            // delete it from the context
            moc.delete(item)
        }

        // save the context
        try? moc.save()
    }
}

struct CategoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryView()
//    }
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let cat = CLCategory(context: moc)
        cat.name = "衣服"
        return CategoryView(category: cat).environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
