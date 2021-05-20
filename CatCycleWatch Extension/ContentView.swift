//
//  ContentView.swift
//  CatCycleWatch Extension
//
//  Created by PATRICIA S SIQUEIRA on 17/05/21.
//

import SwiftUI

struct ContentView: View {
    var scaleDevice: CGSize
    var body: some View {
            ZStack(alignment: .center) {
                CircleView(colorSet: ColorSets(color1: Color.blue, color2: Color.blue, color3: Color.blue, color4: Color.white, color5: Color.black))
                        .scaleEffect(scaleDevice, anchor: .center)

                }
            .navigationTitle("My period")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            ContentView(scaleDevice: CGSize(width: 0.6, height: 0.6))
                .previewDevice("Apple Watch Series 5 - 44mm")
            ContentView(scaleDevice: CGSize(width: 0.55, height: 0.55))
                .previewDevice("Apple Watch Series 5 - 40mm")
            ContentView(scaleDevice: CGSize(width: 0.6, height: 0.6))
                .previewDevice("Apple Watch Series 6 - 44mm")
            ContentView(scaleDevice: CGSize(width: 0.55, height: 0.55))
                .previewDevice("Apple Watch Series 6 - 40mm")
        }
    }
}
