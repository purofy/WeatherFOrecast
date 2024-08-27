//
//  Favorites.swift
//  WeatherForecast
//
//  Created by Kirill Lebedev on 13.08.24.
//

import SwiftUI

struct Favorites: View {
    @ObservedObject var viewModel: WeatherViewModel
    var favorites: [City]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your Favorites")
                .font(.title3)
                .bold()
            ForEach(favorites) { city in
                CityCompactView(displayMode: .dark, city: city, currentWeather: WeatherData.placeholder)
                    .onTapGesture {
                        viewModel.selectedCity = city
                        viewModel.showCityDetails = true
                    }
            }
        }
    }
}

#Preview {
    Favorites(viewModel: WeatherViewModel(), favorites: City.citySuggestionsPlaceholder)
}
