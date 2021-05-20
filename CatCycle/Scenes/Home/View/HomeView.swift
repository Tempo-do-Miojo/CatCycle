//
//  HomeView.swift
//  CatCycle
//
//  Created by PATRICIA S SIQUEIRA on 17/05/21.
//

import SwiftUI

struct HomeView: View {
    @State private var showingCalendarView = false
    var dayNow: Date = Date()
    var body: some View {
            ZStack {
                Color.ccGray3.edgesIgnoringSafeArea(.all)
                VStack {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Text("Olá").font(.ccTitle2).foregroundColor(Color.ccGray1)
                            Text("Cris").font(.ccLargeTitle).foregroundColor(Color.ccGray1).bold()
                        }
                        .padding(.leading, 20)
                        Spacer(minLength: 10)
                            Button(action: {
                                self.showingCalendarView = true
                            }, label: {
                                Image("Calendar_active")
                                    .scaledToFit()
                            })
                            .padding(.trailing, 20)
                    }
                    .padding(.top, 25)
                    ZStack {
                        CircleView(colorSet: ColorSets(color1: Color.ccPrimaryPurple, color2: Color.ccPrimaryPurple, color3: Color.ccPrimaryPurple, color4: Color.ccGray3), frameCycle: FrameSets(cycleX: 260, cycleY: 260), dayNow: dayNow)
                        PeriodView(period: PeriodViewModel(fromCycle: 0.1, toCycle: 0.2, angleCycle: 0), colorTracker: Color.ccRed)
                        PeriodView(period: PeriodViewModel(fromCycle: 0.1, toCycle: 0.15, angleCycle: 180), colorTracker: Color.ccBlue)
                        DayNow()
                    }
                    Information(viewModel: .init(info: [.init(id: 0, iconName: "Bleeding_Medium", text: "Medium", type: .bleeding), .init(id: 1, iconName: "Symptoms_Cramps", text: "Cramps", type: .symptoms)]))
                        .padding(.horizontal,24)
                    Spacer()
                }
            }
        }
    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "dd"
        return date == nil ? "?" : formatter.string(from: date)
    }

}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
