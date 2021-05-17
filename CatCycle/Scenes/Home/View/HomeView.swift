//
//  HomeView.swift
//  CatCycle
//
//  Created by PATRICIA S SIQUEIRA on 17/05/21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
        VStack(alignment: .leading) {
            Text("Olá").font(.title).foregroundColor(Color.black)
            Text("Cris").font(.largeTitle).foregroundColor(Color.black).bold()
            ZStack {
                CircleView(colorSet: ColorSets(color1: Color.blue, color2: Color.blue, color3: Color.blue, color4: Color.white))
                VStack {
                    Text("Day").font(.largeTitle).foregroundColor(Color.black)
                }
                PeriodView(period: PeriodViewModel(fromCycle: 0.1, toCycle: 0.2, angleCycle: 0), colorTracker: Color(red: 1, green: 0, blue: 0, opacity: 0.5))
                PeriodView(period: PeriodViewModel(fromCycle: 0.1, toCycle: 0.15, angleCycle: 180), colorTracker: Color(red: 0, green: 0.6, blue: 0.5, opacity: 0.8))
            }
            }
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
