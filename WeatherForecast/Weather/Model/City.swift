//
//  City.swift
//  WeatherForecast
//
//  Created by Kirill Lebedev on 13.08.24.
//

import Foundation
struct City: Codable, Hashable, Identifiable {

    var id: String
    var display_name: String
    var lat: Double
    var lon: Double
    var region: String?
    
    static let citySuggestionsPlaceholder: [City] = [
        City(id: "0",display_name: "Berlin", lat: 52.5200, lon: 13.4050, region: "Brandenburg"),
        City(id: "1",display_name: "Moscow", lat: 55.7522, lon: 37.6156, region: "Moskovskaya Obl."),
        City(id: "2",display_name: "London", lat: 51.5072, lon: -0.1276, region: "London South Region"),
        City(id: "3",display_name: "Paris", lat: 48.8566, lon: 2.3522, region: "Central Region"),
        City(id: "4",display_name: "Berlin", lat: 52.5200, lon: 13.4050, region: "Berlin")
    ]
}
