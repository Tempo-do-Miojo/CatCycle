//
//  InformationViewModel.swift
//  CatCycle
//
//  Created by Lucas Oliveira on 19/05/21.
//

import Foundation

class InformationViewModel {
    let titles: [String]
    let info: [InfoData]

    init(titles: [String], info: [InfoData]) {
        self.titles = titles
        self.info = info
    }

    func infoFilter(type: DataTrackingType) -> [InfoData] {
        return info.filter {$0.type == type}
    }
}
