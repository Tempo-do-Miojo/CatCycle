//
//  HomeView.swift
//  CatCycle
//
//  Created by PATRICIA S SIQUEIRA on 17/05/21.
//

import SwiftUI

struct HomeView: View {
    @State private var showCalendar = false
    @Environment(\.colorScheme) var colorScheme
    var dayNow: Date = Date()
    var model = HomeViewModel()
    var body: some View {
            ZStack {
                if colorScheme == .light {
                    Color.ccGray3.edgesIgnoringSafeArea(.all)
                } else {
                    Color.black.edgesIgnoringSafeArea(.all)
                }
                VStack {
                    HStack(alignment: .center) {
                        VStack(alignment: .leading) {
                            Text("Olá").font(model.getUserName() == "" ? Font.ccParagraph1 : Font.ccLargeTitle).foregroundColor(colorScheme == .dark ? Color.ccGray3 : Color.ccGray1)
                            Text("\(model.getUserName())").font(.ccLargeTitle).foregroundColor(colorScheme == .dark ? Color.ccGray3 : Color.ccGray1).bold()
                        }
                        .padding(.leading, 20)
                        Spacer(minLength: 10)
                            Button(action: {
                                    showCalendar.toggle()
                            }, label: {
                                Image("Calendar_active")
                                    .renderingMode(.template)
                                    .foregroundColor(colorScheme == .dark ? Color.ccGray3 : Color.ccGray1)
                                    .scaledToFit()
                            })
                            .padding(.trailing, 20)
                    }
                    .padding(.top, 25)
                    ZStack {
                        CircleView(colorSet: ColorSets(color1: Color.ccPrimaryPurple, color2: Color.ccPrimaryPurple, color3: Color.ccPrimaryPurple, color4: colorScheme == .light ? Color.ccGray3: Color.black), frameCycle: FrameSets(cycleX: 260, cycleY: 260), dayNow: dayNow)
                        PeriodView(period: PeriodViewModel(fromCycle: 0.0, toCycle: 0.1, angleCycle: 0), colorTracker: Color.ccRed)
                        PeriodView(period: PeriodViewModel(fromCycle: 0.1, toCycle: 0.15, angleCycle: 180), colorTracker: Color.ccBlue)
                        DayNow()
                    }
                    Information(titles: ["Day"], infos: [.init(id: 0, iconName: "Bleeding_Medium", text: "Medium", type: .bleeding), .init(id: 1, iconName: "Symptoms_Cramps", text: "Medium", type: .symptoms)])
                        .padding(.horizontal,24)
                    Spacer()
                }
                if showCalendar {
                    CalendarView(isPresented: $showCalendar)
                        .transition(.move(edge: .trailing))
                        .animation(.spring().delay(0.04))
                }
            }
            .animation(.default, value: showCalendar)
        }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
