//
//  Information.swift
//  CatCycle
//
//  Created by Lucas Oliveira on 18/05/21.
//

import SwiftUI

struct Information: View {
    let viewModel = InformationViewModel()

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SegmentControl(titles: ["Day 20"])
                .lineSpacing(100)
                .padding(.bottom, 8)

            if !viewModel.infoFilter(type: .bleeding).isEmpty {
                sectionContent(.bleeding)
                Divider()
            }

            if !viewModel.infoFilter(type: .symptoms).isEmpty {
                sectionContent(.symptoms)
            }
        }
    }

    func sectionContent(_ type: DataTrackingType) -> some View {
        return VStack(alignment: .leading, spacing: 16) {
            sectionTitle(type.rawValue)
            ForEach(viewModel.infoFilter(type: type)) { info in
                InfoRow(infoData: info)

            }
        }
    }

    func sectionTitle(_ text: String) -> some View {
         return Text(text)
            .font(.ccParagraph1)
            .foregroundColor(.ccGray1)
    }
}

struct Information_Previews: PreviewProvider {
    static var previews: some View {
        Information()
            .previewLayout(.sizeThatFits)

    }
}
