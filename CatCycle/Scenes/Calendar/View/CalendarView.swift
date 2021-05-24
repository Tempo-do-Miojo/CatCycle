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
    @Binding var isPresented: Bool
    @State var month = Date()
    var selectedDaysBleeding = ["1", "2", "3", "4", "5"]
    var selectedDaysOvulation = ["1", "2", "3", "4", "5"]
    var isThis : Bool = false
    //var selectedDays = [1, 2, 3, 4, 5]

    var body: some View {
        ZStack {
            Color.ccGray3.edgesIgnoringSafeArea(.all)
            VStack {
                VStack(spacing: 40) {
                    HeaderNavigation(isPresented: $isPresented)
                    HStack {
                        HeaderCalendar(month: $month)
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
                HStack(spacing: 0) {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 7), spacing: 15) {
                        let monthInt = Calendar.current.component(.month, from: month)
                        ForEach(model.generateDaysInMonth(for: model.getDate(month: monthInt)), id: \.self) { day in
                            DayView(day: day, isSelected: day == selectedDay, month: $month)
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
    @ViewBuilder fileprivate func backgroudS(day: Day, selectedDays: [String], isBleeding:Bool) -> some View {
        if selectedDays.contains(day.number) {
            if selectedDays.first == day.number {
                RoundedCorner(radius: 15, corners: [.topLeft, .bottomLeft])
                    .fill(isBleeding ? Color.ccRed : Color.ccBlue)
            } else if selectedDays.last == day.number {
                RoundedCorner(radius: 15, corners: [.topRight, .bottomRight])
                    .fill(isBleeding ? Color.ccRed : Color.ccBlue)
            } else {
                Rectangle()
                    .fill(isBleeding ? Color.ccRed : Color.ccBlue)
            }
        }
    }
//    @ViewBuilder fileprivate func backgroudBleeding(day: Day) -> some View {
//        if selectedDaysBleeding.contains(day.number) {
//            if selectedDaysBleeding.first == day.number {
//                RoundedCorner(radius: 15, corners: [.topLeft, .bottomLeft])
//                    .fill(Color.ccRed)
//            } else if selectedDaysBleeding.last == day.number {
//                RoundedCorner(radius: 15, corners: [.topRight, .bottomRight])
//                    .fill(Color.ccRed)
//            } else {
//                Rectangle()
//                    .fill(Color.ccRed)
//            }
//        }
//    }
}

struct HeaderCalendar: View {
    @StateObject var model = Model()
    @Binding var month: Date
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
    @Binding var isPresented: Bool
    var body: some View {
        Text("Calendar")
            .foregroundColor(Color.ccGray1)
            .font(Font.ccParagraph1)
            .frame(maxWidth: .infinity)
            .overlay(backButton, alignment: .leading)
            .padding(.top, 16)
    }

    var backButton: some View {
        Button(action: {
            isPresented = false
        }, label: {
            Image(systemName: "chevron.left")
                .foregroundColor(Color.ccPrimaryPurple)
        })
        .padding()
    }

}

struct DayView: View {
    let day: Day
    let isSelected: Bool
    @Binding var month: Date
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(day.number ==  Model().dateDayFormatter.string(from: Date()) && Calendar.current.component(.month, from: month) == Calendar.current.component(.month, from: Date()) ? Color.ccPrimaryPurple : Color.clear)
            Circle()
                .stroke(day.number ==  Model().dateDayFormatter.string(from: Date()) && Calendar.current.component(.month, from: month) == Calendar.current.component(.month, from: Date()) ? Color.black : Color.clear, style: StrokeStyle(lineWidth: 1.5, lineCap: .round, lineJoin: .round, dash: [0.5, 3.6], dashPhase: 10))
                .frame(width: 35, height: 35)
            Text(day.number)
                .foregroundColor(day.number ==  Model().dateDayFormatter.string(from: Date()) && Calendar.current.component(.month, from: month) == Calendar.current.component(.month, from: Date()) ? Color.white : Color.ccGray2)
        }
        .opacity(day.isWithinDisplayedMonth ? 1 : 0)
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(isPresented: .constant(true))
    }
}

struct CalendarBaseView: View {
    @State var month = Date()
    @StateObject var model = Model()
    @State var selectedDay: Day?

    var body: some View {
        VStack {
            VStack(spacing: 40) {
                HStack {
                    HeaderCalendar(month: $month)
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
                        DayView(day: day, isSelected: day == selectedDay, month: $month)
                            .onTapGesture {
                                selectedDay = day
                            }
                    }
                }
            }.padding(.horizontal, 13)
        }
    }
}
