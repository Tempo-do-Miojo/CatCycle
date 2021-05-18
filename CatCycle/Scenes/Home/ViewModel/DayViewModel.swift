//
//  DayViewModel.swift
//  CatCycle
//
//  Created by PATRICIA S SIQUEIRA on 18/05/21.
//

import SwiftUI

class DayViewModel {

    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "dd"
        return date == nil ? "?" : formatter.string(from: date)
    }
    func getAngle(date: Date!) -> Double {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "dd"
        guard let dateNumber = Double(formatter.string(from: date)) else {return 0.0}
        let angle: Double = dateNumber * (360/31)
        return angle
    }
}
