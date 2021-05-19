//
//  CCButton.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 19/05/21.
//

import SwiftUI

enum CCButtonType: String {
    case add = "Plus"
    case forward = "Forward"
    case save = "Check"
}

struct CCButton: View {
    let action: () -> Void
    let type: CCButtonType

    var body: some View {
        Button(action: action) {
            switch type {
            case .save:
                HStack(spacing: 24) {
                    Text("Save").font(.ccParagraph1)
                    Image(type.rawValue)
                }.padding(.leading, 13)
            default:
                Image(type.rawValue)
            }
        }.buttonStyle(CCButtonStyle())
    }
}

struct CCButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.all, 11)
            .background(Color.ccPrimaryPurple)
            .foregroundColor(.white)
            .imageScale(.large)
            .onTapGesture(perform: simpleSuccess)
    }

    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        CCButton(action: {
            print("oi")
        }, type: .add)
        .fixedSize()
        .cornerRadius(8)
        .previewLayout(PreviewLayout.sizeThatFits)

        CCButton(action: {
            print("oi")
        }, type: .forward)
        .fixedSize()
        .cornerRadius(8)
        .previewLayout(PreviewLayout.sizeThatFits)

        CCButton(action: {
            print("oi")
        }, type: .save)
        .cornerRadius(8)
        .previewLayout(PreviewLayout.sizeThatFits)
    }
}
