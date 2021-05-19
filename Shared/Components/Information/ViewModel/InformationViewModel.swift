//
//  InformationViewModel.swift
//  CatCycle
//
//  Created by Lucas Oliveira on 19/05/21.
//

import Foundation

class InformationViewModel {
    let info: [InfoData]

    init(info: [InfoData]) {
        self.info = info
    }

    func infoFilter(type: DataTrackingType) -> [InfoData] {
        return info.filter {$0.type == type}
    }
}
