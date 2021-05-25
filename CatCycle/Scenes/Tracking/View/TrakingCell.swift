//
//  TrakingCell.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 24/05/21.
//

import SwiftUI

struct TrackingCell: View {

    @State var model: InfoData
    var selected: Bool = false
    var action: () -> Void

    var body: some View {
        VStack {
            Button(action: action, label: {
                Image(model.iconName)
            })
            .buttonStyle(StateableButton(change: { _ in
                return Image(model.iconName)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 48, height: 48)
                    .foregroundColor(selected ? colorCondition.nonSelected : colorCondition.selected)
                    .padding(.all, 32)
                    .background(selected ? colorCondition.selected : colorCondition.nonSelected)
                    .imageScale(.large)
                    .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(colorCondition.selected, lineWidth: 4))
            }))
            .cornerRadius(8)
            Text(model.text)
                .padding(.top, 8)
                .font(.ccParagraph1)
                .foregroundColor(.ccGray2)
        }
    }

    var colorCondition: (selected: Color, nonSelected: Color) {
        if model.type == .symptoms {
            return (selected: .ccPrimaryPurple, nonSelected: .white)
        } else {
            return (selected: .red, nonSelected: .white)
        }
    }
}
