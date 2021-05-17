//
//  CatCycleApp.swift
//  CatCycleWatch Extension
//
//  Created by PATRICIA S SIQUEIRA on 17/05/21.
//

import SwiftUI

@main
struct CatCycleApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
