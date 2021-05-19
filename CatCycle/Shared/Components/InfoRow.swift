//
//  InfoRow.swift
//  CatCycle
//
//  Created by Lucas Oliveira on 18/05/21.
//

import SwiftUI

enum DataTrackingType {
    case bleeding, symptoms
}

struct InfoRow: View {
    let iconName: String
    let text: String
    let type: DataTrackingType

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Rectangle()
                    .frame(width: 36, height: 36)
                    .foregroundColor(type == .bleeding ? .ccRed : .ccSecudaryPurple)
                    .cornerRadius(5)
                Image(iconName)
            }
            Text(text)
            Spacer()
        }
    }
}

struct InfoRow_Previews: PreviewProvider {
    static var previews: some View {
        InfoRow(iconName: "Bleeding_Medium", text: "Medium", type: .bleeding)
            .previewLayout(.sizeThatFits)
        InfoRow(iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms)
            .previewLayout(.sizeThatFits)
    }
}
