//
//  AppRouter.swift
//  CatCycle
//
//  Created by Vinicius Mesquita on 21/05/21.
//

import SwiftUI

struct AppRouter {

    let defaults = UserDefaults.standard

    func route() -> AnyView {
        if defaults.bool(forKey: "NotFirstLogin") {
            return AnyView(HomeView())
        } else {
            defaults.setValue(true, forKey: "NotFirstLogin")
            return AnyView(OnboardingView())
        }
    }
}
