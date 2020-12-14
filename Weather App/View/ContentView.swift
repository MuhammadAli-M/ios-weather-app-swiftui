//
//  ContentView.swift
//  Weather App
//
//  Created by Muhammad Adam on 12/4/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    @ObservedObject var weatherVM:WeatherViewModel
    
    var body: some View {
        ZStack{
            BackgroundView(topLeftColor: isNight ? .black : .blue,
                           bottomRightColor: isNight ? .gray: Color.lightBlue)
            
            VStack{
                MainCityWeatherView(cityName: weatherVM.cityName,
                                    imageString: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                    temp: weatherVM.today.temperature)
                
                Spacer()
                
                HStack(spacing: 30) {
                    ForEach(weatherVM.days) { day in
                        WeatherDayView(day: day)
                    }
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                
                WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white) {
                    isNight.toggle()
                    weatherVM.fetchCurrentWeather()
                }
                
                
                Spacer()

            }.foregroundColor(.white)
            
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = WeatherViewModel()
        ContentView(weatherVM: viewModel)
    }
}

extension Color{
    static let lightBlue = Color("lightBlue")
}

//struct WeatherDayView: View{
//    let name: String
//    let imageString: String
//    let temp: Int
//    
//    var body: some View{
//        VStack(spacing: 10){
//            Text(name)
//                .fontWeight(.semibold)
//                .font(.headline)
//
//            Image(systemName: imageString)
//                .renderingMode(.original)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 40, height: 40)
//
//            Text("\(temp) °")
//                .fontWeight(.bold)
//                .font(.title3)
//        }
//    }
//}

struct WeatherDayView: View{
    let day: WeatherDay
    
    var body: some View{
        VStack(spacing: 10){
            Text(day.day)
                .fontWeight(.semibold)
                .font(.headline)

            Image(systemName: day.possbileState.imageString)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)

            Text("\(day.temperature) °")
                .fontWeight(.semibold)
                .font(.headline)
        }
    }
}


struct MainCityWeatherView: View {
    
    let cityName: String
    let imageString: String
    let temp: Int
    var body: some View {
        Text(cityName)
            .padding()
            .font(.largeTitle)
        Image(systemName: imageString)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180)
        Text("\(temp) °")
            .font(.largeTitle)
    }
}

struct BackgroundView: View {
    let topLeftColor: Color
    let bottomRightColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topLeftColor, bottomRightColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}


