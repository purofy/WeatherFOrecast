//
//  WeatherService.swift
//  WeatherForecast
//
//  Created by Kirill Lebedev on 13.08.24.
//

import Foundation
import OpenMeteoSdk


struct WeatherService {
    static func getWeather(lat: Double,  lon: Double, completion: @escaping (Result<WeatherData, Error>) -> Void) {
        let url = URL(string: "http://localhost:8082/api/v1/weather")!
//        let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,rain,showers,snowfall,weather_code,cloud_cover,pressure_msl,surface_pressure,wind_speed_10m,wind_direction_10m,wind_gusts_10m&format=json")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let weather = try JSONDecoder().decode(WeatherData.self, from: data)
                    completion(.success(weather))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    static func getCityName(lat: Double, lon: Double, completion: @escaping (Result<City, Error>) -> Void) {
        let url = URL(string: "http://localhost:8082/api/v1/city?lat=\(lat)&lon=\(lon)")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let city = try JSONDecoder().decode(City.self, from: data)
                    completion(.success(city))
                } catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    static func searchCity(with searchString: String, completion: @escaping(Result<[City], Error>) -> Void) {
            // Define your API URL here https://eu1.locationiq.com/v1/search?q=berlin&format=json&key=pk.bcb62e7ca5a4438ee56d27955c119305
//            let apiKey = "pk.bcb62e7ca5a4438ee56d27955c119305"
//            let urlString = "https://eu1.locationiq.com/v1/search?q=\(searchString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&format=json&key=\(apiKey)"
            let urlString = "http://localhost:8082/api/v1/search?name=\(searchString)&count=1"
            
            guard let url = URL(string: urlString) else {
                completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                    return
                }
                
                do {
                    // Assuming the response is an array of cities
                    let decoder = JSONDecoder()
                    let geoResponse = try decoder.decode(GeoSearchResponse.self, from: data)
                    
                    // Convert the results to City objects
                    let resultCities = geoResponse.results.map {
                        City(
                            id: "\($0.id)",
                            display_name: $0.name,
                            lat: $0.latitude,
                            lon: $0.longitude,
                            region: $0.admin1
                        )
                    }
                    completion(.success(resultCities))
                } catch {
                    completion(.failure(error))
                }
            }
            
            task.resume()
        }
}
