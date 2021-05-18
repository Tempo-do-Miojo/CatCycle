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
    var body: some View {
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
            .opacity(0.6)
    }
}
