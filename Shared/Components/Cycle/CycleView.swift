//
//  CycleView.swift
//  CatCycleWatch Extension
//
//  Created by PATRICIA S SIQUEIRA on 18/05/21.
//

import SwiftUI
import Liquid

struct CircleView: View {
    @ObservedObject var colorSet: ColorSets
    @ObservedObject var frameCycle: FrameSets
    var dayNow: Date = Date()
    var body: some View {
        ZStack {
            Liquid()
                .frame(width: frameCycle.cycleX, height: frameCycle.cycleY)
                .foregroundColor(colorSet.color1)
                .opacity(0.3)
            Liquid()
                .frame(width: frameCycle.cycleX - (frameCycle.cycleX * 0.15),
                       height: frameCycle.cycleY - (frameCycle.cycleY * 0.15))
                .foregroundColor(colorSet.color2)
                .opacity(0.6)
            Liquid(samples: 10)
                .frame(width: frameCycle.cycleX - (frameCycle.cycleX * 0.25),
                       height: frameCycle.cycleY - (frameCycle.cycleY * 0.25))
                .foregroundColor(colorSet.color3)
            Circle()
                .frame(width: frameCycle.cycleX - (frameCycle.cycleX * 0.4),
                       height: frameCycle.cycleY - (frameCycle.cycleY * 0.4))
                .foregroundColor(colorSet.color4)
            dayTextView
        }
    }

    var dayTextView: some View {
        VStack(spacing: 0) {
            #if os(watchOS)
            Text("Day")
                .font(.ccWatchSubtitle)
                .foregroundColor(Color.ccGray3)
                .padding(.bottom, -4)
            Text("\(getTextFromDate(date: dayNow))")
                .font(.ccWatchLargeTitle)
                .foregroundColor(Color.ccGray3)
            #else
            Text("Day")
                .font(.ccTitle3)
                .foregroundColor(Color.ccGray1)
                .padding(.bottom, -4)
            Text("\(getTextFromDate(date: dayNow))")
                .font(.ccTitle1)
                .foregroundColor(Color.ccGray1)
            #endif
        }
    }
    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "dd"
        return date == nil ? "?" : formatter.string(from: date)
    }
}
