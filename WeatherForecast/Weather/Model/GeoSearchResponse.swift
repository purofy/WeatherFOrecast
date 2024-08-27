//
//  CityResponse.swift
//  WeatherForecast
//
//  Created by Kirill Lebedev on 13.08.24.
//

import Foundation
struct GeoSearchResponse: Decodable {
    let results: [CityResponse]
    let generationtime_ms: Double
}

struct CityResponse: Decodable {
    let id: Double
    let name: String
    let latitude: Double
    let longitude: Double
    let elevation: Double
    let feature_code: String
    let country_code: String
    let admin1_id: Double
    let admin3_id: Double
    let admin4_id: Double
    let timezone: String
    let population: Double
    let country_id: Double
    let country: String
    let admin1: String
    let admin3: String
    let admin4: String
}
