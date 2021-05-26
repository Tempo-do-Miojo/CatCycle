//
//  HomeViewModel.swift
//  CatCycle
//
//  Created by PATRICIA S SIQUEIRA on 26/05/21.
//

import Foundation
import SwiftUI

struct HomeViewModel {
    func getUserName() -> String {
        guard let user = CoreDataManager.fetchUser() else {return ""}
        return user.name ?? ""
    }
    func getBleendingPeriodInitial(date: Date!) -> CGFloat {
        let dateNumber:CGFloat = CGFloat(DayViewModel.getNumberFromDate(date: getFirstBleeding(date: date)))
        let initialDate: CGFloat = dateNumber / CGFloat(DayViewModel.getNumberOfDaysInMonth(date: getFirstBleeding(date: date)))
        return initialDate
    }
    func getBleendingPeriodFinish() -> CGFloat {
        guard let user = CoreDataManager.fetchUser(),
              let dateInitialBleending = user.initialDate else {return 0.0}
        let periodLenght = CGFloat(user.periodLength + Int16(DayViewModel.getNumberFromDate(date: dateInitialBleending)))
        let finishDate: CGFloat = periodLenght / CGFloat(DayViewModel.getNumberOfDaysInMonth(date: dateInitialBleending))
        return finishDate
    }
    
    func getFirstBleeding(date: Date!) -> Date {
        guard let user = CoreDataManager.fetchUser(),
              let dateInitialBleending = user.initialDate else {return date}
        let dayBleeding = CoreDataManager.fetchDay(in: DayViewModel.getNumberFromMonth(date: date), year: DayViewModel.getNumberFromYear(date: date))
        return dayBleeding.first?.date ?? dateInitialBleending
    }
}
