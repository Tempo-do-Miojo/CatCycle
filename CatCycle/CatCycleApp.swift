//
//  CatCycleApp.swift
//  CatCycle
//
//  Created by PATRICIA S SIQUEIRA on 13/05/21.
//

import SwiftUI

@main
struct CatCycleApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            HomeView()
//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
