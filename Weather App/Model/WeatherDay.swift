//
//  WeatherDay.swift
//  Weather App
//
//  Created by Muhammad Adam on 12/7/20.
//

import Foundation


struct WeatherDay: Identifiable{
    var id = UUID()
    let day: String
    let possbileState: WeatherState
    let temperature: Int
}

enum WeatherState{
    case sunny
    case snow
    case cloudy
    case wind
    
    var imageString: String {
        switch self {
        case .sunny: return "sun.max.fill"
        case .snow: return "snow"
        case .cloudy: return "cloud.fill"
        case .wind: return "wind"
        }
    }
}
