//
//  Date+WeekDays.swift
//  Weather App
//
//  Created by Muhammad Adam on 12/14/20.
//

import Foundation

extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
    func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }
    func getDayString(dayOffset: Int) -> String {
        guard let otherData  =
                Calendar.current.date(byAdding: .day, value: dayOffset, to: self) else {return "Nan"}
        return otherData.dayOfWeek()
    }
}
