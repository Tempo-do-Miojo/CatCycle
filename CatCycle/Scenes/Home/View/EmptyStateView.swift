//
//  EmptyStateView.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 18/05/21.
//

import SwiftUI

struct EmptyStateView: View {

    let insetsTitle: EdgeInsets = .init(
        top: 18, leading: 0,
        bottom: 0,
        trailing: 0)

    let insetsSubtitle: EdgeInsets = .init(
        top: 4, leading: 0,
        bottom: 0,
        trailing: 0)

    var body: some View {
        VStack {
            Image(Image.emptyStateImage)
            Text("No data around here")
                .font(.ccTitle2)
                .padding(insetsTitle)
            Text("To add tap on the + button")
                .font(.ccParagraph3)
                .lineLimit(2)
                .padding(insetsSubtitle)
                .foregroundColor(.ccGray2)
        }
    }
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EmptyStateView()
                .previewLayout(PreviewLayout.sizeThatFits)
        }
    }
}
