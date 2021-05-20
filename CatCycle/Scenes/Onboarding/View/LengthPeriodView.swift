//
//  LengthPeriodStepView.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 20/05/21.
//

import SwiftUI

struct LenghtPeriodView: View {

    let data: OnboardingData
    @State var lenghtPeriod: Int = 27

    var body: some View {
        VStack {
            Text(data.title).font(.ccTitle2)
                .padding(.top, 68)
            Text(data.subTitle).font(.ccParagraph3).foregroundColor(.ccGray2)
                .padding(.top, 6)
            Picker("", selection: $lenghtPeriod, content: {
                ForEach(0..<30) { item in
                    Text("\(item)")
                }
            })
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(.leading, 24)
        .padding(.trailing, 24)
    }
}

struct LenghtPeriod_Previews: PreviewProvider {
    static var previews: some View {
        LenghtPeriodView(data: OnboardingData.list[1])
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
