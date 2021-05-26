//
//  SelectTrackView.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 21/05/21.
//

import SwiftUI

struct CollectionTrackingView: View {

    @State var model: [[InfoData]]
    @State var selectedId: Int?
    @State var multipleSelection: [Int] = []

    var didSelectItem: ((Int?) -> Void)?
    var didMultiSelectedItem: (([Int]) -> Void)?

    var body: some View {
        HStack {
            VStack {
                trackingCellComponent(model: model[0])
            }.padding(.trailing)
            VStack {
                trackingCellComponent(model: model[1])
            }.padding(.leading)
        }
    }

    func trackingCellComponent(model: [InfoData]) -> some View {
        ForEach(model) { item in
            TrackingCell(model: item, selected: selectionCondition(id: item.id), action: {
                withAnimation {
                    buttonActionCondition(id: item.id)
                }
            })
        }.padding(.bottom, 10)
    }

    func selectionCondition(id: Int) -> Bool {
        if model.first?.first?.type == .bleeding {
            return id == selectedId
        }
        return multipleSelection.contains(id)
    }

    func buttonActionCondition(id: Int) {
        if model.first?.first?.type == .bleeding {
            if selectedId == id {
                selectedId = nil
            } else {
                selectedId = id
                didSelectItem?(id)
            }
            return
        }
        if multipleSelection.contains(id) {
            multipleSelection = multipleSelection.filter { $0 != id }
        } else {
            multipleSelection.append(id)
            didMultiSelectedItem?(multipleSelection)
        }
    }

}
struct Collection_Previews: PreviewProvider {
    static var previews: some View {
        CollectionTrackingView(model: [
            [InfoData(id: 0, iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms),
            InfoData(id: 1, iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms)],
            [InfoData(id: 2, iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms),
            InfoData(id: 3, iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms)]
        ])
    }
}
