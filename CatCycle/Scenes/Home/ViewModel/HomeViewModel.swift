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
    func getBleendingPeriodInitial() -> CGFloat {
        guard let user = CoreDataManager.fetchUser(),
              let dateInitialBleending = user.initialDate else {return 0.0}
        let dateNumber:CGFloat = CGFloat(DayViewModel.getNumberFromDate(date: dateInitialBleending))
        let initialDate: CGFloat = dateNumber / CGFloat(DayViewModel.getNumberOfDaysInMonth(date: dateInitialBleending))
        return initialDate
    }
    func getBleendingPeriodFinish() -> CGFloat {
        guard let user = CoreDataManager.fetchUser(),
              let dateInitialBleending = user.initialDate else {return 0.0}
        let periodLenght = CGFloat(user.periodLength + Int16(DayViewModel.getNumberFromDate(date: dateInitialBleending)))
        let finishDate: CGFloat = periodLenght / CGFloat(DayViewModel.getNumberOfDaysInMonth(date: dateInitialBleending))
        return finishDate
    }
}
