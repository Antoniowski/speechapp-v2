//
//  speechappApp.swift
//  speechapp
//
//  Created by Antonio Romano on 15/11/21.
//

import SwiftUI

@main
struct speechappApp: App {
    @StateObject var data = DataHandler(speeches: mySpeeches)
    @State var showOnboarding = true
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView(data: data)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(data)
//                .fullScreenCover(isPresented: $showOnboarding) {
//                    OnboardingView()
//                        .accentColor(appAccentColor)
//                }
        }
    }
}
