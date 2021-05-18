//
//  PeriodViewModel.swift
//  CatCycle
//
//  Created by PATRICIA S SIQUEIRA on 17/05/21.
//

import SwiftUI

class PeriodViewModel: ObservableObject {
    @Published var fromCycle: CGFloat
    @Published var toCycle: CGFloat
    @Published var angleCycle: Double
    init(fromCycle: CGFloat, toCycle:CGFloat, angleCycle: Double) {
        self.fromCycle = fromCycle
        self.toCycle = toCycle
        self.angleCycle = angleCycle
    }
}
