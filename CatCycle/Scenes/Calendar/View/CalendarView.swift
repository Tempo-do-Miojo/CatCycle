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
    var selectedDaysBleending: [String] = ["1", "2", "3", "4"]
    var selectedDaysSymptoms: [String] = ["18", "19", "20", "21"]
    var body: some View {
        ZStack {
            Color.ccGray3.edgesIgnoringSafeArea(.all)
            VStack {
                VStack(spacing: 40) {
                    HeaderNavigation(isPresented: $isPresented)
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
                                ZStack {
                                    backgroundPeriod(day: day, selectedDays: selectedDaysBleending, isBleending: true)
                                    backgroundPeriod(day: day, selectedDays: selectedDaysSymptoms, isBleending: false)
                                    DayView(day: day, isSelected: day == selectedDay)
                                        .onTapGesture {
                                            selectedDay = day
                                        }
                                }
                            }
                        }
                    }.padding(.horizontal, 10)
                Spacer()
            }
        }
    }
    @ViewBuilder fileprivate func backgroundPeriod(day: Day, selectedDays: [String], isBleending: Bool) -> some View {
        if selectedDays.contains(day.number) {
            if selectedDays.first == day.number {
                RoundedCorner(radius: 25, corners: [.topLeft, .bottomLeft]).fill(isBleending ? Color.ccRed : Color.ccBlue)
            } else if selectedDays.last == day.number {
                RoundedCorner(radius: 25, corners: [.topRight, .bottomRight]).fill(isBleending ? Color.ccRed : Color.ccBlue)
            } else {
                Rectangle().fill(isBleending ? Color.ccRed : Color.ccBlue)
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
    var selectedDaysBleending: [String] = ["1", "2", "3", "4"]
    var selectedDaysSymptoms: [String] = ["18", "19", "20", "21"]
    var colorDayToShow: Color {
        if day.number == Model().dateDayFormatter.string(from: Date()) || selectedDaysSymptoms.contains(day.number) || selectedDaysBleending.contains(day.number) {
            return Color.white
        } else {
            return Color.ccGray2
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
                        .foregroundColor(day.number ==  Model().dateDayFormatter.string(from: Date()) ? Color.ccPrimaryPurple : Color.clear)
                    Circle()
                        .stroke(day.number ==  Model().dateDayFormatter.string(from: Date()) ? Color.black : Color.clear, style: StrokeStyle(lineWidth: 1.5, lineCap: .round, lineJoin: .round, dash: [0.5, 3.6], dashPhase: 10))
                        .frame(width: 35, height: 35)
                    Text(day.number)
                        .foregroundColor(colorDayToShow)
                }
            )
            .opacity(day.isWithinDisplayedMonth ? 1 : 0)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(isPresented: .constant(true))
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
