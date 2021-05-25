//
//  DayTrack+CoreDataProperties.swift
//  CatCycle
//
//  Created by Lucas Oliveira on 24/05/21.
//
//

import Foundation
import CoreData

extension DayTrack {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DayTrack> {
        return NSFetchRequest<DayTrack>(entityName: "DayTrack")
    }

    @NSManaged public var date: Date?
    @NSManaged public var bleedingRawValue: String?
    @NSManaged public var symptomsRawValue: String?

    var bleeding: Bleeding? {
        return Bleeding(rawValue: bleedingRawValue ?? "")
    }

    var symptoms: Symptoms? {
        return Symptoms(rawValue: symptomsRawValue ?? "")
    }

}

extension DayTrack : Identifiable {

}
