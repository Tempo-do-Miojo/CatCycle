//
//  OnboardingView.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 19/05/21.
//

import SwiftUI

struct NameView: View {

    @State private var username: String = ""
    let data: OnboardingData

    var body: some View {
        VStack {
            Image(data.imageNamed)
            Text(data.title)
                .font(.ccTitle2)
                .padding(.top, 48)
            Text(data.subTitle)
                .font(.ccParagraph3)
                .padding(.top, 6)
                .foregroundColor(.ccGray2)
                .multilineTextAlignment(.center)
            TextField("Your name...", text: $username)
                .background(Color.ccGray3)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.top, 6)
                .padding(.leading, 24)
                .padding(.trailing, 24)
        }
        .padding(.leading, 24)
        .padding(.trailing, 24)
    }
}

struct LenghtPeriodView: View {

    let data: OnboardingData

    var body: some View {
        VStack {
            Text(data.title).font(.ccTitle2)
                .padding(.top, 68)
            Text(data.subTitle).font(.ccParagraph3).foregroundColor(.ccGray2)
                .padding(.top, 6)
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(.leading, 24)
        .padding(.trailing, 24)
    }
}

struct StartPeriodView: View {

    let data: OnboardingData

    var body: some View {
        VStack {
            Text(data.title).font(.ccTitle2)
                .padding(.top, 68)
            Text(data.subTitle).font(.ccParagraph3).foregroundColor(.ccGray2)
                .padding(.top, 6)
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(.leading, 24)
        .padding(.trailing, 24)
    }
}

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
                }, type: .forward)
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

struct OnboardingData {
    let title: String
    let subTitle: String
    let imageNamed: String = "Cat_Onboarding"

    static let list: [OnboardingData] = [
        OnboardingData(
            title: "Hey, what's your name?",
            subTitle: "We are creating a personalized experience, based on who you are."),
        OnboardingData(
            title: "What is the average lentgh of your period?",
            subTitle: "We will use this data with care and security, to help you understand how your cycle works."),
        OnboardingData(
            title: "When was the start of your last period?",
            subTitle: "We will use this data with care and security, to help you understand how your cycle works.")
    ]
}
