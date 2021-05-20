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
    var dayNow: Date = Date()
    var body: some View {
        ZStack {
            Liquid()
                .frame(width: 260, height: 260)
                .foregroundColor(colorSet.color1)
                .opacity(0.3)

            Liquid()
                .frame(width: 240, height: 240)
                .foregroundColor(colorSet.color2)
                .opacity(0.6)

            Liquid(samples: 10)
                .frame(width: 220, height: 220)
                .foregroundColor(colorSet.color3)
            Circle()
                .frame(width: 180, height: 180)
                .foregroundColor(colorSet.color4)

            VStack(spacing: -4) {
                Text("Day")
                    .font(.ccWatchSubtitle)
                    .foregroundColor(.ccGray3)
                Text("20")
                    .font(.ccWatchLargeTitle)
                    .foregroundColor(.ccGray3)
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
