//
//  InfoData.swift
//  CatCycle
//
//  Created by Lucas Oliveira on 19/05/21.
//

import Foundation

struct InfoData: Identifiable {
    var id: Int

    let iconName: String
    let text: String
    let type: DataTrackingType

}
enum DataTrackingType: String {
    case bleeding = "Bleeding"
    case symptoms = "Symptoms"
}