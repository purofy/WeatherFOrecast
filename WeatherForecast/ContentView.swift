//
//  ContentView.swift
//  WeatherForecast
//
//  Created by Kirill Lebedev on 06.06.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    @ObservedObject var locationManager = LocationManager()

    @State private var updatedSuggestions: [City] = []
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                List(viewModel.searchString == "" ? viewModel.favorites : updatedSuggestions, id: \.id) { city in
                    if viewModel.favorites.first == city && viewModel.searchString == "" {
                        VStack(alignment: .leading) {
                            // Check for location authorization
                            if locationManager.authorizationStatus == .authorizedAlways || locationManager.authorizationStatus == .authorizedWhenInUse {
                                Text("Current Location")
                                    .font(.headline.bold())
                                if let currentCity = viewModel.currentLocationCity {
                                    CityCompactView(displayMode: .white, city: currentCity, currentWeather: viewModel.currentWeather ?? WeatherData.placeholder)
                                        .onTapGesture {
                                            viewModel.selectedCity = viewModel.currentLocationCity
                                            viewModel.showCityDetails = true
                                        }
                                } else {
                                    Text("Fetching current location...")
                                }
                            }
                            Text("Favorites")
                                .font(.headline.bold())
                        }
                    }
                    Button(action: {
                        viewModel.selectedCity = city
                        viewModel.showCityDetails = true
                    }) {
                        if viewModel.searchString == "" {
                            CityCompactView(displayMode: .dark, city:city, currentWeather: viewModel.cityWeatherData[city] ?? WeatherData.placeholder)
                        } else {
                            searchList(city: city)
                        }
                    }
                }
                .listStyle(.plain)
            }.navigationTitle("Simple Weather")
        }
        .searchable(text: $viewModel.searchString, placement: .sidebar, prompt: "Search City")
        .onChange(of: viewModel.searchString) { oldSearchValue, newSearchValue in
            viewModel.debouncedSearch()
            updatedSuggestions = viewModel.citySuggestions.filter { $0.display_name.contains(oldSearchValue)
            }
        }
        .onAppear {
            locationManager.requestLocation()
        }
        .onReceive(locationManager.$currentLocation) { location in
            print("Current location: \(location?.latitude ?? 0), \(location?.longitude ?? 0)")
            guard let location = location else { return }
            // Fetch weather data for current location
            viewModel.fetchWeatherForLocation(latitude: location.latitude, longitude: location.longitude)
        }
        .fullScreenCover(isPresented: $viewModel.showCityDetails) {
            CityDetailView(viewModel: viewModel)
        }
        .preferredColorScheme(.dark)
    }
    
    func searchList(city: City) -> some View {
        HStack {
            Text("\(city.display_name)")
            Spacer()
            Image(systemName: viewModel.favorites.contains(city) ? "star.fill" : "star")
                .resizable() // To allow resizing
                 .frame(width: 20, height: 20) // Adjust the size
                 .foregroundColor(.white)
                 .opacity(0.7) // Make it slightly transparent
                 .onTapGesture {
                     viewModel.selectedCity = city
                     if viewModel.favorites.contains(city) {
                         viewModel.removeFavorite(city: city)
                     } else {
                         viewModel.addFavorite(city: city)
                     }
                 }
        }
    }
}

#Preview {
    ContentView()
}

