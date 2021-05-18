//
//  DayView.swift
//  CatCycle
//
//  Created by PATRICIA S SIQUEIRA on 18/05/21.
//
import SwiftUI

struct DayNow: View {
    var dayNow: Date = Date()
    var dates = DayViewModel()

    var body: some View{
        Circle()
            .frame(width: 20, height: 20)
            .foregroundColor(Color.ccPrimaryPurple)
            .offset(y: -160)
            .rotationEffect(.degrees(dates.getAngle(date: dayNow)))
        Circle()
            .stroke(Color.ccSecudaryPurple, style: StrokeStyle(lineWidth: 1.5, lineCap: .round, lineJoin: .round, dash: [0.5, 3.6], dashPhase: 10.0))
            .frame(width: 25, height: 25)
            .offset(y: -160)
            .rotationEffect(.degrees(dates.getAngle(date: dayNow)))
    }
    
}
