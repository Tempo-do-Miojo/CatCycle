//
//  InfoRow.swift
//  CatCycle
//
//  Created by Lucas Oliveira on 18/05/21.
//

import SwiftUI

struct InfoRow: View {
    let infoData: InfoData

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Rectangle()
                    .frame(width: 36, height: 36)
                    .foregroundColor(infoData.type == .bleeding ? .ccRed : .ccSecudaryPurple)
                    .cornerRadius(5)
                Image(infoData.iconName)
            }
            Text(infoData.text)
                .font(.ccParagraph3)
                .foregroundColor(colorScheme == .dark ? .ccGray3 : .ccGray1)

            Spacer()
        }
    }
}

struct InfoRow_Previews: PreviewProvider {
    static var previews: some View {
        InfoRow(infoData: .init(id: 0, iconName: "Bleeding_Medium", text: "Medium", type: .bleeding))
            .previewLayout(.sizeThatFits)
        InfoRow(infoData: .init(id: 1, iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms))
            .previewLayout(.sizeThatFits)
    }
}
