//
//  ViewTracking.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 21/05/21.
//

import SwiftUI

struct TrackingView: View {
    let bleeding = TrackerModel.bleeding
    let symptoms = TrackerModel.symptoms

    @State var bleedingSelected: InfoData?
    @State var symptomsSelected: [InfoData] = []
    @State var trackedDate = Date()

    @State var indexSegmentedControl = 0
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            HStack {
                SegmentControl(titles: ["Bleeding", "Symptoms"], index: $indexSegmentedControl)
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
                CollectionTrackingView(model: bleeding, didSelectItem: { item in
                    bleeding.forEach { bleedings in
                        bleedings.forEach { bleeding in
                            if bleeding.id == item {
                                bleedingSelected = bleeding
                            }
                        }
                    }
                })
            }
            if indexSegmentedControl == 1 {
                CollectionTrackingView(model: symptoms, didMultiSelectedItem: { items in
                    symptoms.forEach { symptoms in
                        symptoms.forEach { symptom in
                            if items.contains(symptom.id) {
                                symptomsSelected.append(symptom)
                            }
                        }
                    }
                })
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

    var buttonSaveComponent: some View {
        if indexSegmentedControl == 0 {
            return CCButton(action: {
                indexSegmentedControl += 1
            }, type: .forwardBtn)
        }
        return CCButton(action: {
            let bleeding = Bleeding(rawValue: bleedingSelected?.iconName ?? "")
            let symptoms = symptomsSelected.map { Symptoms(rawValue: $0.iconName)! }
            CoreDataManager.addDayTrack(date: trackedDate, bleeding: bleeding, symptoms: symptoms)
        }, type: .saveBtn)
    }

}

struct TrackingView_Previews: PreviewProvider {
    static var previews: some View {
        TrackingView()
    }
}
