//
//  ContentView.swift
//  CatCycleWatch Extension
//
//  Created by PATRICIA S SIQUEIRA on 17/05/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            ZStack(alignment: .center) {
                CircleView(colorSet: ColorSets(color1: Color.blue, color2: Color.blue, color3: Color.blue,
                                               color4: Color.white), frameCycle: FrameSets(cycleX: 180, cycleY: 180))
                }
            .navigationTitle("My period")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            ContentView()
                .previewDevice("Apple Watch Series 5 - 40mm")
        }
    }
}
