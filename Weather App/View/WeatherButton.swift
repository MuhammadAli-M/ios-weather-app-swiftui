//
//  WeatherButton.swift
//  Weather App
//
//  Created by Muhammad Adam on 12/14/20.
//

import SwiftUI

struct WeatherButton: View {
    
    let title: String
    let textColor: Color
    let backgroundColor: Color
    let action: () -> ()
    
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .frame(width: 280, height: 50)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .cornerRadius(10)
        })
    }
}


struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WeatherButton(title: "Change Day Time", textColor: Color(UIColor.systemBlue), backgroundColor: Color(UIColor.systemBackground)) {
                print("button clicked")
            }
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
            
            WeatherButton(title: "Change Day Time", textColor: Color(UIColor.systemBlue), backgroundColor: Color(UIColor.systemBackground)) {
                print("button clicked")
            }
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
        }
    }
}
