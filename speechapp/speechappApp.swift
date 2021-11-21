//
//  speechappApp.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

@main
struct speechappApp: App {
    @StateObject var dati = DataHandler(speeches: mySpeeches)
    
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(datas: dati)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
