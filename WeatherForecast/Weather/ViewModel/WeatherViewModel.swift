//
//  WeatherViewModel.swift
//  WeatherForecast
//
//  Created by Kirill Lebedev on 13.08.24.
//

import Foundation
import Combine


final class WeatherViewModel: ObservableObject {
    @Published var currentLocationCity: City?
    @Published var currentWeather: WeatherData?

    @Published var searchString: String = ""
    @Published var selectedCity: City?
    @Published var favorites: [City] = [] {
        didSet {
            saveFavorites()
            refreshWeatherForFavorites()

        }
    }
    @Published var citySuggestions: [City] = []
    @Published var showCityDetails: Bool = false
    @Published var showSearch: Bool = false
    @Published var cityWeatherData: [City: WeatherData] = [:]

    

    private var searchTimer: AnyCancellable?
    
    var isFavorite: Bool {
        return favorites.contains(selectedCity!)
    }

    
    init() {
        loadFavorites()
        refreshWeatherForFavorites()

        favorites.forEach({ city in
            // fetch weather for each city
            fetchWeather(city: city)
        })
    }
    private func updateCityWeather(city: City, weather: WeatherData) {
        cityWeatherData[city] = weather
    }
    
    private func saveFavorites() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(favorites) {
            UserDefaults.standard.set(encoded, forKey: "favorites")
        }
    }
    private func loadFavorites() {
        if let data = UserDefaults.standard.data(forKey: "favorites") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([City].self, from: data) {
                favorites = decoded
            }
        }
    }
    func refreshWeatherForFavorites() {
        for city in favorites {
            fetchWeather(city: city)
        }
    }
    // Function to fetch weather for a given location
    func fetchWeatherForLocation(latitude: Double, longitude: Double) {
        // Call your weather service with latitude and longitude
        WeatherService.getWeather(lat: latitude, lon: longitude) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let weather):
                    self?.currentWeather = weather
                    self?.fetchCityName(latitude: latitude, longitude: longitude)
                case .failure(let error):
                    print("Failed to fetch weather: \(error)")
                }
            }
        }
    }
    
    func addFavorite(city: City) {
        if !favorites.contains(city) {
            favorites.append(city)
        }
    }
    
    func removeFavorite(city: City) {
        if let index = favorites.firstIndex(of: city) {
            favorites.remove(at: index)
        }
    }
    
    func debouncedSearch() {
        // Cancel the previous timer if it exists
        searchTimer?.cancel()
        
        // Schedule a new timer
        searchTimer = Just(())
            .delay(for: .seconds(0.4), scheduler: RunLoop.main)
            .sink { [weak self] _ in
                    self?.searchCity()
            }
    }
    
    private func searchCity() {
        // if contains in favorites return from favorites else call weather service
        if favorites.contains(where: { $0.display_name.contains(searchString) }) {
            print("searching in favorites")
            citySuggestions = favorites.filter({ $0.display_name.contains(searchString) })
            return
        } else {
            WeatherService.searchCity(with: searchString) { [weak self] searchResult in
                print("search result: \(searchResult)")
                DispatchQueue.main.async {
                    switch searchResult {
                    case .success(let cities):
                        self?.citySuggestions = cities
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
    
    func selectCity(_ city: City) {
        selectedCity = city
        fetchWeather(city: city)
    }
    

    
    private func fetchWeather(city: City) {
        WeatherService.getWeather(lat: city.lat, lon: city.lon) { result in
            switch result {
            case .success(let weather):
                self.updateCityWeather(city: city, weather: weather)

            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchCityName(latitude: Double, longitude: Double) {
        WeatherService.getCityName(lat: latitude, lon: longitude) { result in
            switch result {
            case .success(let city):
                self.currentLocationCity = city
                // Update your UI or model with the city name
            case .failure(let error):
                print(error)
            }
        }
    }
}
