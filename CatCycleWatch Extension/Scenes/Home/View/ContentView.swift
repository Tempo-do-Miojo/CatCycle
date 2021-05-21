//
//  ContentView.swift
//  CatCycleWatch Extension
//
//  Created by PATRICIA S SIQUEIRA on 17/05/21.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack(alignment: .center) {
                CircleView(colorSet: ColorSets(color1: Color.ccPrimaryPurple,
                                               color2: Color.ccPrimaryPurple,
                                               color3: Color.ccPrimaryPurple,
                                               color4: Color.black), frameCycle: .init(cycleX: 140, cycleY: 140))
                    .frame(width: 150, height: 150, alignment: .center)

            }
            VStack(alignment: .leading) {
                Information(titles: ["Day 20"], infos: [
                            .init(id: 0, iconName: "Bleeding_Medium", text: "Medium", type: .bleeding),
                            .init(id: 1, iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms)]
)
                    .padding(EdgeInsets(top: 2, leading: 8, bottom: 0, trailing: 8))

            }

        }
            .navigationTitle("My period")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            ContentView()
                .previewDevice("Apple Watch Series 5 - 40mm")
            ContentView()
                .previewLayout(.sizeThatFits)

        }
    }
}
