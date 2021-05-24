//
//  SelectTrackView.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 21/05/21.
//

import SwiftUI

struct CollectionTrackingView: View {

    @State var model: [InfoData]

    var body: some View {
        HStack {
            VStack {
                ForEach(model) { item in
                    if item.id <= 1 {
                        TrackingCell(model: item)
                    }
                }.padding(.bottom, 10)
            }
            .padding(.trailing)
            VStack {
                ForEach(model) { item in
                    if item.id > 1 {
                        TrackingCell(model: item)
                    }
                }.padding(.bottom, 10)
            }.padding(.leading)
        }
    }

}
struct Collection_Previews: PreviewProvider {
    static var previews: some View {
        CollectionTrackingView(model: [
            InfoData(id: 0, iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms),
            InfoData(id: 1, iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms),
            InfoData(id: 2, iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms),
            InfoData(id: 3, iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms)
        ])
    }
}
