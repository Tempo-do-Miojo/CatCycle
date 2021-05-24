//
//  SelectionButtonStyle.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 24/05/21.
//

import SwiftUI

struct StateableButton<Content>: ButtonStyle where Content: View {
    var change: (Bool) -> Content

    func makeBody(configuration: Configuration) -> some View {
        return change(configuration.isPressed)
    }
}

struct Selection_Previews: PreviewProvider {
    static var previews: some View {
        let model = InfoData(id: 0, iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms)
        TrackingCell(model: model)
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
