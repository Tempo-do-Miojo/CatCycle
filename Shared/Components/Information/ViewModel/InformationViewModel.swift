//
//  InformationViewModel.swift
//  CatCycle
//
//  Created by Lucas Oliveira on 19/05/21.
//

import Foundation

class InformationViewModel {
    let titles: [String]
    var info = [InfoData]()

    init(titles: [String], date: Date) {
        self.titles = titles
        let dayTracked = CoreDataManager.fetchDay(in: date)
        if let bleeding = dayTracked?.bleeding {
            let bleedingInfo = InfoData(id: 0, iconName: bleeding.rawValue,
                                        text: textOnBleeding(bleeding), type: .bleeding)
            info.append(bleedingInfo)
        }
        if let symptoms = dayTracked?.symptoms {
            for index in 0..<symptoms.count {
                let symptomsInfo = InfoData(id: index+1, iconName: symptoms[index].rawValue,
                                            text: textOnSymptoms(symptoms[index]), type: .symptoms)
                info.append(symptomsInfo)
            }
        }

    }

    func infoFilter(type: DataTrackingType) -> [InfoData] {
        return info.filter {$0.type == type}
    }

    func textOnBleeding(_ bleeding: Bleeding) -> String {
        switch bleeding {
        case .heavy:
            return "Heavy"
        case .light:
            return "Light"
        case .medium:
            return "Medium"
        case .spotting:
            return "Spotting"
        }
    }
    func textOnSymptoms(_ symptoms: Symptoms) -> String {
        switch symptoms {
        case .cramps:
            return "Cramps"
        case .headache:
            return "Headache"
        case .ovulation:
            return "Ovulation"
        case .pms:
            return "PMS"
        }
    }
}
