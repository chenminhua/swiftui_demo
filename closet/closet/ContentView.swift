//
//  ContentView.swift
//  closet
//
//  Created by admin on 2021/1/17.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        entity: CLCategory.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \CLCategory.createdat, ascending: true)],
        animation: .default)
    private var categories: FetchedResults<CLCategory>
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(categories) { category in
                    NavigationLink(destination: Text("placeHolder")) {
                        Text(category.name!)
                    }
                }
                .onDelete(perform: deleteCLCategory)
            }
            .navigationBarTitle("Closet")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                self.showingAddScreen.toggle()
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showingAddScreen) {
                AddCategoryView().environment(\.managedObjectContext, self.viewContext)
            }
        }
    }
    
    private func deleteCLCategory(offsets: IndexSet) {
        withAnimation {
            offsets.map { categories[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
