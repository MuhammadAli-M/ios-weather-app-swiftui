//
//  Weather_AppApp.swift
//  Weather App
//
//  Created by Muhammad Adam on 12/4/20.
//

import SwiftUI

@main
struct Weather_AppApp: App {
    var body: some Scene {
        WindowGroup {
            let viewModel = WeatherViewModel()
            ContentView(weatherVM: viewModel)
        }
    }
}
