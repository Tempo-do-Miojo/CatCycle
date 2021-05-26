//
//  TrackerModel.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 26/05/21.
//

import Foundation

struct TrackerModel {

    static let bleeding = [
        [InfoData(id: 0, iconName: "Bleeding_Light", text: "Light", type: .bleeding),
         InfoData(id: 1, iconName: "Bleeding_Spotting", text: "Spotting", type: .bleeding)],
        [InfoData(id: 2, iconName: "Bleeding_Medium", text: "Medium", type: .bleeding),
         InfoData(id: 3, iconName: "Bleeding_Heavy", text: "Heavy", type: .bleeding)]
    ]

    static let symptoms = [
        [InfoData(id: 0, iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms),
         InfoData(id: 1, iconName: "Symptoms_Headache", text: "Headache", type: .symptoms)],
        [InfoData(id: 2, iconName: "Symptoms_Ovulation", text: "Ovulation", type: .symptoms),
         InfoData(id: 3, iconName: "Symptoms_PMS", text: "PMS", type: .symptoms)]
    ]
}
