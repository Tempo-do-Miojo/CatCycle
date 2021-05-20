//
//  Information.swift
//  CatCycle
//
//  Created by Lucas Oliveira on 18/05/21.
//

import SwiftUI

struct Information: View {
    let viewModel: InformationViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                SegmentControl(titles: ["Day"])
                    .lineSpacing(100)
                    .padding(.bottom, 8)
                Spacer()
            }

            if viewModel.info.isEmpty {
                Rectangle()
                    .foregroundColor(.clear)
                    .background(EmptyStateView().padding(.bottom, 24))

            }

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
        Information(viewModel: .init(info:
                        [.init(id: 0, iconName: "Bleeding_Medium", text: "Medium", type: .bleeding),
                         .init(id: 1, iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms)]))
            .previewLayout(.sizeThatFits)

        Information(viewModel: .init(info: []))
            .previewLayout(.sizeThatFits)
    }
}
