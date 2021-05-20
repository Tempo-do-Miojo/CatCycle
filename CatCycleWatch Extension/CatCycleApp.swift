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
                ContentView(scaleDevice: CGSize(width: 0.55, height: 0.55))
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
