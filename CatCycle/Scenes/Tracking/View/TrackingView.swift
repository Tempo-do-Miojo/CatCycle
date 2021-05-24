//
//  ViewTracking.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 21/05/21.
//

import SwiftUI

struct TrackingView: View {
    let model: [InfoData]
    var body: some View {
        VStack {
            HStack {
                SegmentControl(titles: ["Bleeding", "Symptoms"])
                    .padding(.top, 64)
                    .padding(.leading, 24)
                Image("Close")
                    .padding(.trailing, 24)
                    .padding(.top, 24)
            }
            Spacer()
            CollectionTrackingView(model: model)
            Spacer()
            HStack {
                Spacer()
                CCButton(action: {
                    print("Saving")
                }, type: .forwardBtn)
                .cornerRadius(8)
                .padding(.trailing, 24)
                .padding(.bottom, 24)
            }
        }
    }
}

struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        let model = [
            InfoData(id: 0, iconName: "Symptoms_Cramps", text: "Medium", type: .bleeding),
            InfoData(id: 1, iconName: "Symptoms_Cramps", text: "Light", type: .bleeding),
            InfoData(id: 2, iconName: "Symptoms_Cramps", text: "Spotting", type: .bleeding),
            InfoData(id: 3, iconName: "Symptoms_Cramps", text: "Heavy", type: .bleeding)
        ]
        TrackingView(model: model)
    }
}
