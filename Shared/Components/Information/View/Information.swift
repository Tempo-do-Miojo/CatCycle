//
//  Information.swift
//  CatCycle
//
//  Created by Lucas Oliveira on 18/05/21.
//

import SwiftUI

struct Information: View {
    let viewModel: InformationViewModel
    @Environment(\.colorScheme) var colorScheme

    var isSectionEnable: Bool = true
    private var isWatchOS: Bool = false

    init(date: Date?) {
        viewModel = InformationViewModel(date: date ?? Date())

        #if os(watchOS)
            isWatchOS = true
        #endif
    }

    var body: some View {
        VStack(alignment: .leading, spacing: isWatchOS ? 8 : 16) {
            HStack {
                SegmentControl(titles: viewModel.titles, index: .constant(0))
                    .lineSpacing(100)
                    .padding(.bottom, isWatchOS ? 4 : 8)
                Spacer()
                if !isWatchOS {
                    CCButton(action: {print("Apertou")}, type: .addBtn)
                        .cornerRadius(10)
                }
            }

            if viewModel.infos.isEmpty && !isWatchOS {
                Rectangle()
                    .foregroundColor(.clear)
                    .background(EmptyStateView().padding(.bottom, 24))

            }

            if !viewModel.infoFilter(type: .bleeding).isEmpty {
                sectionContent(.bleeding)
                Divider()
                    .padding(.horizontal, isWatchOS ? 8 : 24)
                    .foregroundColor(.ccGray2.opacity(0.3))
            }

            if !viewModel.infoFilter(type: .symptoms).isEmpty {
                sectionContent(.symptoms)
            }
        }
    }
    func sectionContent(_ type: DataTrackingType) -> some View {
        return VStack(alignment: .leading, spacing: isWatchOS ? 8 : 16) {
            #if os(iOS)
                sectionTitle(type.rawValue)
            #endif

            ForEach(viewModel.infoFilter(type: type)) { info in
                InfoRow(infoData: info)

            }
        }
    }

    func sectionTitle(_ text: String) -> some View {
         return Text(text)
            .font(.ccParagraph1)
            .foregroundColor(colorScheme == .dark ? .ccGray3 : .ccGray1)
    }
}

struct Information_Previews: PreviewProvider {
    static var previews: some View {
        Information(date: Date())
            .previewLayout(.sizeThatFits)
    }
}
