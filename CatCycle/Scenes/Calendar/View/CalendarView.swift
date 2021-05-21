//
//  CalendarView.swift
//  CatCycle
//
//  Created by Helaine Pontes on 18/05/21.
//

import Foundation
import SwiftUI
// swiftlint:disable identifier_name

struct CalendarView: View {

    @State var selectedDay: Day?
    @StateObject var model = Model()
    var body: some View {
        ZStack {
            Color.ccGray3.edgesIgnoringSafeArea(.all)
            VStack {
                VStack(spacing: 40) {
                    HeaderNavigation()
                    HStack {
                        HeaderCalendar()
                        Spacer()
                    }.padding(.leading, 24)
                }
                HStack {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 7), spacing: 0) {
                        ForEach(model.week, id: \.self) { weekDay in
                            Text(weekDay)
                                .font(Font.ccParagraph2)
                        }
                    }
                }.padding(.horizontal, 10)
                HStack {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 7), spacing: 0) {
                        ForEach(model.generateDaysInMonth(for: model.getDate(month: 01)), id: \.self) { day in
                            DayView(day: day, isSelected: day == selectedDay)
                                .onTapGesture {
                                    selectedDay = day
                                }
                        }
                    }
                }.padding(.horizontal, 13)
                Spacer()
            }
        }
    }
}

struct HeaderCalendar: View {
    @StateObject var model = Model()
    @State private var month = Date()
    @State private var showSheet = false
    var body: some View {
        Button(action: {
            self.showSheet = true
        }, label: {
            Text("\(model.dateMonthFormatter.string(from: month)) \(model.dateYearFormatter.string(from: month)) >")
                .foregroundColor(Color.ccPrimaryPurple)
        })
        .sheet(isPresented: $showSheet) {
            DatePicker("mês", selection: $month, displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
        }
    }
}

struct HeaderNavigation: View {

//    var body: some View {
//        ZStack {
//            Text("Calendar")
//                .foregroundColor(Color.ccGray1)
//                .font(Font.ccParagraph1)
//
//            Button(action: {}) {
//                Image(systemName: "chevron.left")
//                    .foregroundColor(Color.ccPrimaryPurple)
//            }
//            .padding(.leading, 20)
//            .frame(maxWidth: .infinity, alignment: .leading)
//        }
//        .frame(maxWidth: .infinity)
//        .border(Color.black)
//
//    }

    var body: some View {
        Text("Calendar")
            .foregroundColor(Color.ccGray1)
            .font(Font.ccParagraph1)
            .frame(maxWidth: .infinity)
            .overlay(backButton, alignment: .leading)
            .padding(.top, 16)
    }

    var backButton: some View {
        Button(action: {}) {
            Image(systemName: "chevron.left")
                .foregroundColor(Color.ccPrimaryPurple)
        }
        .padding()
    }

}

struct DayView: View {
    let day: Day
    let isSelected: Bool
    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .aspectRatio(1, contentMode: .fit)
            .overlay(
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(day.number ==  Model().dateDayFormatter.string(from: Date()) ? Color.ccPrimaryPurple : Color.clear)
                    Circle()
                        .stroke(day.number ==  Model().dateDayFormatter.string(from: Date()) ? Color.black : Color.clear, style: StrokeStyle(lineWidth: 1.5, lineCap: .round, lineJoin: .round, dash: [0.5, 3.6], dashPhase: 10))
                        .frame(width: 35, height: 35)
                    Text(day.number)
                        .foregroundColor(day.number ==  Model().dateDayFormatter.string(from: Date()) ? Color.white : Color.ccGray2 )
                    //                        .foregroundColor(day.number == Model())
                }
            )
            .opacity(day.isWithinDisplayedMonth ? 1 : 0)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}

struct CalendarBaseView: View {

    @StateObject var model = Model()
    @State var selectedDay: Day?

    var body: some View {
        VStack {
            VStack(spacing: 40) {
                HStack {
                    HeaderCalendar()
                    Spacer()
                }.padding(.leading, 24)
            }
            HStack {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 7), spacing: 0) {
                    ForEach(model.week, id: \.self) { weekDay in
                        Text(weekDay)
                            .font(Font.ccParagraph2)
                    }
                }
            }.padding(.horizontal, 10)
            HStack {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 7), spacing: 0) {
                    ForEach(model.generateDaysInMonth(for: model.getDate(month: 01)), id: \.self) { day in
                        DayView(day: day, isSelected: day == selectedDay)
                            .onTapGesture {
                                selectedDay = day
                            }
                    }
                }
            }.padding(.horizontal, 13)
        }
    }
}
