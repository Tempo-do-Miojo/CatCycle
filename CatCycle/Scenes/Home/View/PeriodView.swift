//
//  PeriodView.swift
//  CatCycle
//
//  Created by PATRICIA S SIQUEIRA on 17/05/21.
//

import SwiftUI

struct PeriodView: View {
    @ObservedObject var period:PeriodViewModel
    var colorTracker: Color
    var body: some View {
        Circle()
            .trim(from: period.fromCycle, to: period.toCycle)
            .stroke(colorTracker, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 320, height: 320)
            .rotationEffect(.degrees(period.angleCycle))
    }
}
