//
//  InformationViewModel.swift
//  CatCycle
//
//  Created by Lucas Oliveira on 19/05/21.
//

import Foundation

class InformationViewModel {
    let info: [InfoData] = [.init(id: 0, iconName: "Bleeding_Medium", text: "Medium", type: .bleeding),
                            .init(id: 1, iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms)]

    func infoFilter(type: DataTrackingType) -> [InfoData] {
        return info.filter {$0.type == type}
    }
}
