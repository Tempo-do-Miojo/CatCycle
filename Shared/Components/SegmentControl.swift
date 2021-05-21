//
//  SegmentControl.swift
//  CatCycle
//
//  Created by Lucas Oliveira on 18/05/21.
//

import SwiftUI

private struct Section: Identifiable {
    let title: String
    let id: Int
}

struct SegmentControl: View {
    private var sections = [Section]()

    @Environment(\.colorScheme) var colorScheme
    @Namespace private var namespace
    @State private var index = 0

    init(titles: [String]) {
        sections = createSections(titles: titles)
    }

    var body: some View {
        HStack(alignment: .top, spacing: 24) {
            ForEach(sections) { section in
                VStack(alignment: .leading, spacing: 2) {
                Text(section.title)
                    .font(section.id == index ? fontCondition.selected : fontCondition.nonSelected )
                    .foregroundColor(section.id == index ? colorCondition.selected : colorCondition.nonSelected)
                    .onTapGesture {
                        withAnimation {
                            index = section.id
                        }
                    }
                    .animation(nil)

                    if index == section.id {
                        indicatorView
                            .matchedGeometryEffect(id: "indicator", in: namespace)
                    }
                }
            }
            Spacer()
        }
    }

    var indicatorView: some View {
        Rectangle()
            .foregroundColor(.ccPrimaryPurple)
            .cornerRadius(3)
            .frame(width: 35, height: 3)
    }

    var colorCondition: (selected: Color, nonSelected: Color) {
        if colorScheme == .dark {
            return (selected: .ccGray3, nonSelected: .ccGray2)
        } else {
            return (selected: .ccGray1, nonSelected: .ccGray2)
        }
    }

    var fontCondition: (selected: Font, nonSelected: Font) {
        #if os(watchOS)
        return (selected: .ccParagraph1, nonSelected: .ccParagraph1)
        #else
        return (selected: .ccTitle4, nonSelected: .ccTitle3)
        #endif
    }

    private func createSections(titles: [String]) -> [Section] {
        var id = 0
        var sections = [Section]()

        titles.forEach { title in
            let section = Section(title: title, id: id)
            sections.append(section)
            id += 1
        }

        return sections
    }
}

struct SegmentControl_Previews: PreviewProvider {
    static var previews: some View {
        SegmentControl(titles: ["Day 20", "Day"])
            .previewLayout(.sizeThatFits)
        SegmentControl(titles: ["Day 20", "Day"])
            .previewDevice("Apple Watch Series 6 - 40mm")
    }
}
