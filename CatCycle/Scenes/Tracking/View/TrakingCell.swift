//
//  TrakingCell.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 24/05/21.
//

import SwiftUI

struct TrackingCell: View {
    @Environment(\.colorScheme) var colorScheme

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
            if colorScheme == .light {
                return (selected: .ccPrimaryPurple, nonSelected: .white)
            } else {
                return (selected: .ccPrimaryPurple, nonSelected: Color(.displayP3, red: 44/255, green: 44/255, blue: 46/255, opacity: 1))
            }
        } else {
            if colorScheme == .light {
                return (selected: .red, nonSelected: .white)
            } else {
                return (selected: .red, nonSelected: Color(.displayP3, red: 44/255, green: 44/255, blue: 46/255, opacity: 1))
            }
        }
    }
}
