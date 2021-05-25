//
//  ViewTracking.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 21/05/21.
//

import SwiftUI

struct TrackingView: View {
    let bleeding: [[InfoData]]
    let symptoms: [[InfoData]]

    @State var indexSegmentedControl = 0
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack {
                SegmentControl(titles: ["Bleeding", "Symptoms"],
                               index: indexSegmentedControl + 1,
                               didChangeIndex: { index in
                    indexSegmentedControl = index
                })
                    .padding(.top, 64)
                    .padding(.leading, 24)
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image("Close")
                })
                .padding(.trailing, 24)
                .padding(.top, 24)
            }
            Spacer()
            if indexSegmentedControl == 0 {
                CollectionTrackingView(model: bleeding)
            }
            if indexSegmentedControl == 1 {
                CollectionTrackingView(model: symptoms)
            }
            Spacer()
            HStack {
                Spacer()
                buttonSaveComponent
                .cornerRadius(8)
                .padding(.trailing, 24)
                .padding(.bottom, 24)
            }
        }
    }

    var collectionTrackingComponent: some View {
        if indexSegmentedControl == 0 {
            return CollectionTrackingView(model: bleeding)
        }
        return CollectionTrackingView(model: symptoms)
    }

    var buttonSaveComponent: some View {
        if indexSegmentedControl == 0 {
            return CCButton(action: {
                indexSegmentedControl += 1
            }, type: .forwardBtn)
        }
        return CCButton(action: {
            print("Save")
        }, type: .saveBtn)
    }

}

struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        let model = [
            [InfoData(id: 0, iconName: "Bleeding_Light", text: "Light", type: .bleeding),
            InfoData(id: 1, iconName: "Bleeding_Spotting", text: "Spotting", type: .bleeding)],
            [InfoData(id: 2, iconName: "Bleeding_Medium", text: "Medium", type: .bleeding),
            InfoData(id: 3, iconName: "Bleeding_Heavy", text: "Heavy", type: .bleeding)]
        ]
        TrackingView(bleeding: model, symptoms: model)
    }
}
