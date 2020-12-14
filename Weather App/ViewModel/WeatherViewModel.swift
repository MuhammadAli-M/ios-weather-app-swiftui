//
//  WeatherViewModel.swift
//  Weather App
//
//  Created by Muhammad Adam on 12/7/20.
//

import Foundation

let apiKey = "020d56d86b4f5a2045233dc801954d62"

class WeatherViewModel: ObservableObject{
    @Published var cityName = "Cairo"
    @Published var today = WeatherDay(day: Date().dayOfWeek(), possbileState: .sunny, temperature: 30)
    @Published var days = [
        WeatherDay(day: Date().getDayString(dayOffset:1),
                   possbileState: .sunny,
                   temperature: 30),
        WeatherDay(day: Date().getDayString(dayOffset:2),
                   possbileState: .cloudy,
                   temperature: 20),
        WeatherDay(day: Date().getDayString(dayOffset:3),
                   possbileState: .wind,
                   temperature: 18),
        WeatherDay(day: Date().getDayString(dayOffset:4),
                   possbileState: .snow,
                   temperature: 1),
        WeatherDay(day: Date().getDayString(dayOffset:5),
                   possbileState: .snow,
                   temperature: 2),
    ]
    
    func fetchCurrentWeather() {
        print("fetching the current weather status")
    }
}


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
