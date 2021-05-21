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
                .frame(width: frameCycle.cycleX - (frameCycle.cycleX * 0.15), height: frameCycle.cycleY - (frameCycle.cycleY * 0.15))
                .foregroundColor(colorSet.color2)
                .opacity(0.6)
            Liquid(samples: 10)
                .frame(width: frameCycle.cycleX - (frameCycle.cycleX * 0.25), height: frameCycle.cycleY - (frameCycle.cycleY * 0.25))
                .foregroundColor(colorSet.color3)
            Circle()
                .frame(width: frameCycle.cycleX - (frameCycle.cycleX * 0.4), height: frameCycle.cycleY - (frameCycle.cycleY * 0.4))
                .foregroundColor(colorSet.color4)
            VStack {
                Text("Day").font(.ccTitle1).foregroundColor(Color.ccGray1)
                Text("\(getTextFromDate(date: dayNow))").font(.ccLargeTitle).foregroundColor(Color.ccGray1)
            }
        }
    }
    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "dd"
        return date == nil ? "?" : formatter.string(from: date)
    }
}
