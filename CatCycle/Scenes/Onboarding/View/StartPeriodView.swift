//
//  StartPeriodView.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 20/05/21.
//

import SwiftUI

struct StartPeriodView: View {

    let data: OnboardingData
    @State private var dateSelected: Date = Date()

    var body: some View {
        VStack {
            Text(data.title).font(.ccTitle5)
                .padding(.top, 68)
            Text(data.subTitle).font(.ccParagraph3).foregroundColor(.ccGray2)
                .padding(.top, 6)
            DatePicker("mês", selection: $dateSelected, displayedComponents: .date)
                .datePickerStyle(WheelDatePickerStyle())
                .padding(.top, 50)
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(.horizontal, 24)
    }
}

struct StartPeriod_Previews: PreviewProvider {
    static var previews: some View {
        StartPeriodView(data: OnboardingData.list[2])
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
