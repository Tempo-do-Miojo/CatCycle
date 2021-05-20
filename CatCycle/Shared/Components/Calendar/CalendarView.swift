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
        HStack {
            HeaderCalendar()
        }
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 7), spacing: 0) {
            ForEach(model.week, id: \.self) { weekDay in
                Text(weekDay)
            }
        }
        LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 0), count: 7), spacing: 0) {
            ForEach(model.generateDaysInMonth(for: model.getDate(month: 01)), id: \.self) { day in
                DayView(day: day, isSelected: day == selectedDay)
                    .onTapGesture {
                        selectedDay = day
                    }
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
            Text("\(model.dateMonthFormatter.string(from: month))")
        })
        .sheet(isPresented: $showSheet) {
            DatePicker("mês", selection: $month, displayedComponents: .date)
                .labelsHidden()
                .datePickerStyle(WheelDatePickerStyle())
        }
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
                        .foregroundColor(day.number ==  Model().dateDayFormatter.string(from: Date()) ? Color.purple : Color.clear)
                        .padding()
                    Text(day.number)
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
