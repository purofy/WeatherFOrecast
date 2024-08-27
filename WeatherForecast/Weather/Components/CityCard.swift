//
//  CityCard.swift
//  Pogoda
//
//  Created by Kirill Lebedev on 11.08.24.
//

import SwiftUI

struct CityCard: View {
    var city: City
    var currentWeather: WeatherData

    var body: some View {
        VStack {
            Text(city.display_name)
            Text("\(currentWeather.current.temperature_2m)" + "°C")
            HStack {
                Image(systemName: "sun.max")
                Text("\(currentWeather.current.weather_code)")
            }
            HStack {
                
                Text("\(currentWeather.daily.apparent_temperature_min)" + "°C")
                Text("-")
                Text("\(currentWeather.daily.apparent_temperature_max)" + "°C")
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: UIScreen.main.bounds.height / 3)
        .background(Color(red: 0.75, green: 1.0, blue: 0.0))
        .foregroundColor(.black)
        .cornerRadius(50)
        .ignoresSafeArea(edges: .top)
    }
}

#Preview {
    CityCard(city: City.citySuggestionsPlaceholder.first!, currentWeather: WeatherData.placeholder)
}
