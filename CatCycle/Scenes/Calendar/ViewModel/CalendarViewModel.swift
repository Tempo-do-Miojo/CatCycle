//
//  CalendarViewModel.swift
//  CatCycle
//
//  Created by Helaine Pontes on 18/05/21.
//

import Foundation
import SwiftUI
import CoreData
// swiftlint:disable identifier_name

struct Day: Hashable, Identifiable {
    
    var id: Date {
        self.date
    }
    
    let date: Date
    let number: String
    let isSelected: Bool
    let isWithinDisplayedMonth: Bool
}

struct MonthMetadata {
    let numberOfDays: Int
    let firstDay: Date
    let firstDayWeekday: Int
}

class Model: ObservableObject {
    private let calendar = Calendar(identifier: .gregorian)
    lazy var dateComponents: DateComponents = {
        var date = DateComponents()
        date.month = 01
        date.day = 1
        date.year = 2021
        return date
    }()

    var week: [String] = ["Su","Mo", "Tu", "We", "Th", "Fr", "Sa"]

    lazy var dateDayFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        return dateFormatter
    }()
    lazy var dateYearFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter
    }()
    lazy var dateMonthFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter
    }()

    private let selectedDate: Date = .init()
    func getCoreDataDaysTracker(month: Int, year: Int) -> [String] {
        let fetch = CoreDataManager.fetchDay(in: month, year: year)
        var dates = [Date]()
        var strDates = [String]()
        for date in 0..<fetch.count {
            dates.append(fetch[date].date ?? Date())
        }
        for str in 0..<dates.count {
            let dateStr = dateDayFormatter.string(from: dates[str])
            strDates.append(dateStr)
        }
        return strDates
    }

    func getDate(month: Int) -> Date {
        dateComponents.month = month
        let date = calendar.date(from: dateComponents)!
        return date
    }
    func monthMetadata(for baseDate: Date) throws -> MonthMetadata {
        guard
            let numberOfDaysInMonth = calendar.range(of: .day, in: .month, for: baseDate)?.count,
            let firstDayOfMonth = calendar.date(from: calendar.dateComponents([.year, .month], from: baseDate))
        else {
            throw CalendarDataError.metadataGeneration
        }
        let firstDayWeekday = calendar.component(.weekday, from: firstDayOfMonth)
        return MonthMetadata(numberOfDays: numberOfDaysInMonth, firstDay: firstDayOfMonth, firstDayWeekday: firstDayWeekday)
    }

    func generateDaysInMonth(for baseDate: Date = .init()) -> [Day] {
        guard let metadata = try? monthMetadata(for: baseDate) else {
            fatalError("An error occurred when generating the metadata for \(baseDate)")
        }
        let numberOfDaysInMonth = metadata.numberOfDays
        let offsetInInitialRow = metadata.firstDayWeekday
        let firstDayOfMonth = metadata.firstDay
        let days: [Day] = (1..<(numberOfDaysInMonth + offsetInInitialRow)).map { day in
            let isWithinDisplayedMonth = day >= offsetInInitialRow
            let dayOffset = isWithinDisplayedMonth ? day - offsetInInitialRow : -(offsetInInitialRow - day)
            return generateDay(offsetBy: dayOffset, for: firstDayOfMonth, isWithinDisplayedMonth: isWithinDisplayedMonth)
        }
        return days
    }

    func generateDay(offsetBy dayOffset: Int, for baseDate: Date, isWithinDisplayedMonth: Bool) -> Day {
        let date = calendar.date(byAdding: .day, value: dayOffset, to: baseDate) ?? baseDate
        return Day(
            date: date,
            number: dateDayFormatter.string(from: date),
            isSelected: calendar.isDate(date, inSameDayAs: selectedDate),
            isWithinDisplayedMonth: isWithinDisplayedMonth
        )
    }

    enum CalendarDataError: Error {
        case metadataGeneration
    }
}
