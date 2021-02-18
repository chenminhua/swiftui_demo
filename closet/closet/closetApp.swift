//
//  closetApp.swift
//  closet
//
//  Created by admin on 2021/1/17.
//

import SwiftUI

@main
struct closetApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
