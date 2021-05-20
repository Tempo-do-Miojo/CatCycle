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
       //NavigationView {
            ZStack {
                Color.ccGray3.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading ) {
                    Text("Olá").font(.ccTitle3).foregroundColor(Color.black)
                    Text("Cris").font(.ccLargeTitle).foregroundColor(Color.black).bold()
                    ZStack {
                        CircleView(colorSet: ColorSets(color1: Color.ccPrimaryPurple, color2: Color.ccPrimaryPurple, color3: Color.ccPrimaryPurple, color4: Color.ccGray3, color5: Color.ccGray1))
                        PeriodView(period: PeriodViewModel(fromCycle: 0.1, toCycle: 0.2, angleCycle: 0), colorTracker: Color.ccRed)
                        PeriodView(period: PeriodViewModel(fromCycle: 0.1, toCycle: 0.15, angleCycle: 180), colorTracker: Color.ccBlue)
                        DayNow()
                    }
                    //DetailView
                    Spacer()
                }
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.showingCalendarView = true
                                    }, label: {
                                        Image("Calendar_active")
                                    })
            )
        }
//        .sheet(isPresented: $showingCalendarView) {
//            CalendarView
//        }
   // }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
