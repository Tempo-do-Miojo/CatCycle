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
//            AppRouter().route()
            let model = [
                [InfoData(id: 0, iconName: "Bleeding_Light", text: "Light", type: .bleeding),
                InfoData(id: 1, iconName: "Bleeding_Spotting", text: "Spotting", type: .bleeding)],
                [InfoData(id: 2, iconName: "Bleeding_Medium", text: "Medium", type: .bleeding),
                InfoData(id: 3, iconName: "Bleeding_Heavy", text: "Heavy", type: .bleeding)]
            ]
            let model2 = [
                [InfoData(id: 0, iconName: "Symptoms_Cramps", text: "Light", type: .symptoms),
                InfoData(id: 1, iconName: "Symptoms_Cramps", text: "Spotting", type: .symptoms)],
                [InfoData(id: 2, iconName: "Symptoms_Cramps", text: "Medium", type: .symptoms),
                InfoData(id: 3, iconName: "Symptoms_Cramps", text: "Heavy", type: .symptoms)]
            ]
            TrackingView(bleeding: model, symptoms: model2)
        }
    }
}
