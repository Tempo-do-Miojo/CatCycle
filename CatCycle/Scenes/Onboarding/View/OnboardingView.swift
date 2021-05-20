//
//  OnboardingView.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 19/05/21.
//

import SwiftUI

struct OnboardingView: View {

    var pages = [
        UIHostingController(rootView: NameView(data: OnboardingData.list[0])),
        UIHostingController(rootView: LenghtPeriodView(data: OnboardingData.list[1])),
        UIHostingController(rootView: StartPeriodView(data: OnboardingData.list[2]))
    ]

    @State private var currentPage = 0

    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            PageViewController(pages: pages, currentPageIndex: $currentPage)
            Spacer()
            HStack {
                Spacer()
                CCButton(action: {
                    if currentPage < pages.count - 1 {
                        currentPage += 1
                    }
                }, type: .forwardBtn)
                .cornerRadius(8)
                .padding(.trailing, 24)
                .padding(.bottom, 24)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
