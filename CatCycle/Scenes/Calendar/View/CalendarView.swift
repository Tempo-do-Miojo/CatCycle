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
    @Environment(\.colorScheme) var colorScheme
    @State var selectedDay: Day?
    @StateObject var model = Model()
    @Binding var isPresented: Bool
    @State var selectedDaysBleending = [String]()
    var selectedDaysSymptoms: [String] = ["1", "2", "3", "4"]
    @State var month = Date()
    var body: some View {
        ZStack {
            if colorScheme == .light {
                Color.ccGray3.edgesIgnoringSafeArea(.all)
            } else {
                Color.black.edgesIgnoringSafeArea(.all)
            }
            VStack {
                VStack(spacing: 40) {
                    HeaderNavigation(isPresented: $isPresented)
                    HStack {
                        HeaderCalendar(month: $month, selectedDaysBleending: $selectedDaysBleending)
                        Spacer()
                    }.padding(.leading, 24)
                }
                weekGrid
                    .padding(.horizontal, 5)
                daysGrid
                    .padding(.horizontal, 10)
                Spacer()
            }
        }
        .sheet(item: $selectedDay) {day in
            TrackingView(trackedDate: day.date)
        }
    }

    var weekGrid: some View {
        HStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 7), spacing: 0) {
                ForEach(model.week, id: \.self) { weekDay in
                    Text(weekDay)
                        .font(Font.ccParagraph2)
                        .foregroundColor(colorScheme == .light ? Color.ccGray1 : Color.ccGray3)
                }
            }
        }
    }

    var daysGrid: some View {
        HStack {
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 7), spacing: 0) {
                let monthInt = Calendar.current.component(.month, from: month)
                let yearInt = Calendar.current.component(.year, from: month)
                ForEach(model.generateDaysInMonth(for: model.getDate(month: monthInt)), id: \.self) { day in
                    ZStack {
                        backgroundPeriod(day: day, selectedDays: model.getCoreDataDaysTracker(month: monthInt, year: yearInt) , isBleending: true)
                        //backgroundPeriod(day: day, selectedDays: selectedDaysSymptoms, isBleending: false)
                        DayView(day: day, isSelected: day == selectedDay, month: $month, selectedDaysBleending: $selectedDaysBleending)
                            .onTapGesture {
                                selectedDay = day
                            }
                    }
                    .opacity(day.isWithinDisplayedMonth ? 1 : 0)
                }
            }
        }
    }

    @ViewBuilder fileprivate func backgroundPeriod(day: Day, selectedDays: [String], isBleending: Bool) -> some View {
        if selectedDays.contains(day.number) {
            if selectedDays.first == selectedDays.last {
                RoundedCorner(radius: 25, corners: .allCorners).fill(isBleending ? Color.ccRed : Color.ccBlue)
                    .padding(.vertical, 10)
            } else if selectedDays.first == day.number {
                RoundedCorner(radius: 25, corners: [.topLeft, .bottomLeft]).fill(isBleending ? Color.ccRed : Color.ccBlue)
                    .padding(.vertical, 10)
            } else if selectedDays.last == day.number {
                RoundedCorner(radius: 25, corners: [.topRight, .bottomRight]).fill(isBleending ? Color.ccRed : Color.ccBlue)
                    .padding(.vertical, 10)
            } else {
                Rectangle().fill(isBleending ? Color.ccRed : Color.ccBlue)
                    .padding(.vertical, 10)
            }
        }
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct HeaderCalendar: View {
    @StateObject var model = Model()
    @Binding var month: Date
    @State private var showSheet = false
    @Binding var selectedDaysBleending: [String]
    var body: some View {
        Button(action: {
            self.showSheet = true
        }, label: {
            Text("\(model.dateMonthFormatter.string(from: month)) \(model.dateYearFormatter.string(from: month))")
                .foregroundColor(Color.ccPrimaryPurple)
            Image(systemName: "chevron.right")
                .foregroundColor(Color.ccPrimaryPurple)
        })
        .sheet(isPresented: $showSheet) {
            DatePicker("mês", selection: $month, displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
                .onDisappear {
                    let monthInt = Calendar.current.component(.month, from: month)
                    let yearInt = Calendar.current.component(.year, from: month)
                    selectedDaysBleending = model.getCoreDataDaysTracker(month: monthInt, year: yearInt)
                }
        }
    }
}

struct HeaderNavigation: View {
    @Binding var isPresented: Bool
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Text("Calendar")
            .font(Font.ccParagraph1)
            .foregroundColor(colorScheme == .light ? Color.ccGray1 : Color.ccGray3)
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
    @State var isSelected: Bool
    @Environment(\.colorScheme) var colorScheme
    @Binding var month: Date
    @Binding var selectedDaysBleending: [String]
    //var selectedDaysSymptoms: [String] = ["1", "2", "3", "4"]
    var showSheet = false
    var colorDayToShow: Color {
        if day.number == Model().dateDayFormatter.string(from: Date()) && Calendar.current.component(.month, from: month) == Calendar.current.component(.month, from: Date()) || selectedDaysBleending.contains(day.number) {
            return Color.white
        } else {
            return Color.ccGray2
        }
    }
    var colorStroke : Color {
        if colorScheme == .light {
            return Color.ccGray1
        } else {
            return Color.ccGray3
        }
    }
    var body: some View {
        Rectangle()
            .fill(Color.clear)
            .aspectRatio(1, contentMode: .fit)
            .overlay(
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundColor(day.number ==  Model().dateDayFormatter.string(from: Date()) && Calendar.current.component(.month, from: month) == Calendar.current.component(.month, from: Date()) ? Color.ccPrimaryPurple : Color.clear)
                    Circle()
                        .stroke(day.number ==  Model().dateDayFormatter.string(from: Date()) && Calendar.current.component(.month, from: month) == Calendar.current.component(.month, from: Date()) ? colorStroke : Color.clear, style: StrokeStyle(lineWidth: 1.5, lineCap: .round, lineJoin: .round, dash: [0.5, 3.6], dashPhase: 10))
                        .frame(width: 35, height: 35)
                    Text(day.number)
                        .foregroundColor(isSelected ? Color.red : colorDayToShow)
                }
            )
    }
}
struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(isPresented: .constant(true))
    }
}
