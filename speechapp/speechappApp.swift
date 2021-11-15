//
//  speechappApp.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

@main
struct speechappApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
