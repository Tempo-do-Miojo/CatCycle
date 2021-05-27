//
//  CoreDataManager.swift
//  CatCycle
//
//  Created by Lucas Oliveira on 24/05/21.
//

import CoreData

class CoreDataManager {
    static let context = PersistenceController.shared.container.viewContext

    // MARK: - Add Functions
    static func addUser(name: String, initialDate: Date, periodLength: Int16) {
        let newUser = User(context: context)

        newUser.initialDate = Date()
        newUser.name = "Lucas"
        newUser.periodLength = periodLength

        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    static func addDayTrack(date: Date, bleeding: Bleeding?, symptoms: [Symptoms]?) {
        let dayTrack = DayTrack(context: context)

        dayTrack.bleedingRawValue = bleeding?.rawValue

        if let symptomsValid = symptoms {
            let symptomsRawValueArray = symptomsValid.map {$0.rawValue}
            dayTrack.symptomsRawValue = symptomsRawValueArray

        }
        dayTrack.date = date

        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }

    // MARK: - Fetch Functions
    static func fetchUser() -> User? {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")

        do {
            let result = try context.fetch(request)
            for data in result {
                guard let user = data as? User else {
                    return nil
                }
                return user
            }
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return nil
    }

    static func fetchDay(in month: Int, year: Int) -> [DayTrack] {

        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"

        let initialDate = formatter.date(from: "1-\(month)-\(year)")
        let lastDate = initialDate?.endOfMonth

        guard let nsInitialDate = initialDate as NSDate?,
              let nsLastDate = lastDate as NSDate? else {
            return []
        }

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "DayTrack")
        let predicate = NSPredicate(format: "date >= %@ AND date <= %@",
                                    nsInitialDate,
                                    nsLastDate)
        request.predicate = predicate

        var trackedDays = [DayTrack]()

        do {
            let result = try context.fetch(request)
            if let days = result as? [DayTrack] {
                trackedDays = days
            }
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }

        return trackedDays
    }

    static func fetchDay(in date: Date) -> DayTrack? {
        addDayTrack(date: Date(), bleeding: .heavy, symptoms: [.cramps, .headache])

        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"

        let initialDate = date.startOfDay
        let lastDate = date.endOfDay

        guard let nsInitialDate = initialDate as NSDate?,
              let nsLastDate = lastDate as NSDate? else {
            return nil
        }

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "DayTrack")
        let predicate = NSPredicate(format: "date >= %@ AND date <= %@",
                                    nsInitialDate,
                                    nsLastDate)
        request.predicate = predicate

        do {
            let result = try context.fetch(request)
            for data in result {
                guard let dayTrack = data as? DayTrack else {
                    return nil
                }
                return dayTrack
            }
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }

        return nil
    }

}
