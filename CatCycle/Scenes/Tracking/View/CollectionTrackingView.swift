//
//  SelectTrackView.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 21/05/21.
//

import SwiftUI

struct CollectionTrackingView: View {

    @State var model: [InfoData]
    @State public var selectedId: Int?
    @State var multipleSelection: [Int] = []

    var body: some View {
        HStack {
            VStack {
                ForEach(model) { item in
                    if item.id <= 1 {
                        TrackingCell(model: item, selected: selectionCondition(id: item.id), action: {
                            withAnimation {
                                buttonActionCondition(id: item.id)
                            }
                        })
                    }
                }.padding(.bottom, 10)
            }
            .padding(.trailing)
            VStack {
                ForEach(model) { item in
                    if item.id > 1 {
                        TrackingCell(model: item, selected: selectionCondition(id: item.id), action: {
                            withAnimation {
                                buttonActionCondition(id: item.id)
                            }
                        })
                    }
                }.padding(.bottom, 10)
            }.padding(.leading)
        }
    }

    func selectionCondition(id: Int) -> Bool {
        if model.first?.type == .bleeding {
            return id == selectedId
        }
        print(multipleSelection.contains(id))
        return multipleSelection.contains(id)
    }

    func buttonActionCondition(id: Int) {
        if model.first?.type == .bleeding {
            if selectedId == id {
                selectedId = nil
            } else {
                selectedId = id
            }
            return
        }
        if multipleSelection.contains(id) {
            multipleSelection = multipleSelection.filter { $0 != id }
        } else {
            multipleSelection.append(id)
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
