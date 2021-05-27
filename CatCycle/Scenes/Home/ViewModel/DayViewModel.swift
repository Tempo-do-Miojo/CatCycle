//
//  DayViewModel.swift
//  CatCycle
//
//  Created by PATRICIA S SIQUEIRA on 18/05/21.
//

import SwiftUI

class DayViewModel {
    func getAngle(date: Date!) -> Double {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "dd"
        guard let dateNumber = Double(formatter.string(from: date)) else {return 0.0}
        let angle: Double = dateNumber * (360/Double(DayViewModel.getNumberOfDaysInMonth(date: date)))
        return angle
    }
    static func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "dd"
        return date == nil ? "01" : formatter.string(from: date)
    }
    static func getNumberOfDaysInMonth(date: Date!) -> Int {
        let calendar = Calendar(identifier: .gregorian)
        guard let numberOfDaysInMonth = calendar.range(of: .day, in: .month, for: date)?.count else {return 31}
        return numberOfDaysInMonth
    }

    static func getNumberFromDate(date: Date!) -> Int {
        return Calendar.current.dateComponents([.day], from: date).day ?? 01
    }
    static func getNumberFromMonth(date: Date!) -> Int {
        return Calendar.current.dateComponents([.month], from: date).month ?? 01
    }
    static func getNumberFromYear(date: Date!) -> Int {
        return Calendar.current.dateComponents([.year], from: date).year ?? 2021
    }
}
