//
//  NameOnboardingView.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 20/05/21.
//

import SwiftUI

struct NameView: View {

    @State private var username: String = ""
    let data: OnboardingData

    var body: some View {
        ScrollView.init {
            ScrollViewReader { value in
                VStack {
                    Image(data.imageNamed)
                        .padding(.top, 68)
                    Text(data.title)
                        .font(.ccTitle5)
                        .padding(.top, 48)
                    Text(data.subTitle)
                        .font(.ccParagraph3)
                        .padding(.top, 6)
                        .foregroundColor(.ccGray2)
                        .multilineTextAlignment(.center)
                    TextField("Your name...", text: $username)
                        .textFieldStyle(CCTextFieldStyle())
                        .padding(.top, 6)
                        .padding(.horizontal, 8)
                        .layoutPriority(1000)
                        .onTapGesture {
                            value.scrollTo(99, anchor: .bottom)
                        }
                    Spacer()
                }
                .padding(.horizontal, 24)
            }
        }
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(data: OnboardingData.list[0])
            .previewLayout(PreviewLayout.sizeThatFits)
    }
}
