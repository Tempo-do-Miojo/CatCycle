//
//  OnboardingData.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 20/05/21.
//

import Foundation

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
