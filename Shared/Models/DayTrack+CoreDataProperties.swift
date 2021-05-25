//
//  DayTrack+CoreDataProperties.swift
//  CatCycle
//
//  Created by Lucas Oliveira on 25/05/21.
//
//

import Foundation
import CoreData


extension DayTrack {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DayTrack> {
        return NSFetchRequest<DayTrack>(entityName: "DayTrack")
    }

    @NSManaged public var bleedingRawValue: String?
    @NSManaged public var date: Date?
    @NSManaged public var symptomsRawValue: [String]?

    var bleeding: Bleeding? {
        return Bleeding(rawValue: bleedingRawValue ?? "")
    }

    var symptoms: [Symptoms]? {
        var symptoms = [Symptoms]()
        symptomsRawValue?.forEach { content in
            guard let symptom = Symptoms(rawValue: content) else { return }
            symptoms.append(symptom)
        }
        return symptoms
    }
}

extension DayTrack : Identifiable {

}
