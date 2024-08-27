//
//  YourCity.swift
//  WeatherForecast
//
//  Created by Kirill Lebedev on 13.08.24.
//

import SwiftUI

enum DisplayMode {
    case dark, white
}

struct CityCompactView: View {
    var displayMode: DisplayMode
    var city: City
    var currentWeather: WeatherData
        
    let darkBG = Color(red: 27.0 / 255.0, green: 27.0 / 255.0, blue: 27.0 / 255.0)
    var body: some View {
        let cityTitle = city.region == nil ? city.display_name : city.display_name + ", " + city.region!

        HStack {
            VStack(alignment: .leading) {
                HStack(alignment:.center) {
                    Image(systemName: "sun.rain.fill")
                        .scaledToFill()
                        .font(.title)
                        .bold()
                        .padding()
                    VStack(alignment: .leading) {
                        
                        Text(cityTitle)
                            .font(.headline)
                        
                        Text("\(currentWeather.current.time)")
                            .font(.caption)
                        Text("\(currentWeather.current.weather_code)")
                            .font(.footnote)
                    }
                }
                
            }
            Spacer()
            Text("\(currentWeather.current.apparent_temperature)" + "°C")
                .font(.title)
                .bold()
        }
        .padding()
        .background(displayMode == .dark ? darkBG : .white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .foregroundColor(displayMode == .dark ? .white : .black)
    
    }
}

#Preview {
    CityCompactView(displayMode: .white, city: City.citySuggestionsPlaceholder.first!, currentWeather: WeatherData.placeholder)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
