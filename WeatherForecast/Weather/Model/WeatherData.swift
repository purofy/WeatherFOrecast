import Foundation
struct WeatherData: Decodable {
    let latitude: Float
    let longitude: Float
    let generationtime_ms: Float
    let utc_offset_seconds: Float
    let timezone: String
    let timezone_abbreviation: String
    let elevation: Float
    let current: Current
    let hourly: Hourly
    let daily: Daily

    struct Current: Decodable {
        let time: String
        let temperature_2m: Float
        let relative_humidity_2m: Float
        let apparent_temperature: Float
        let is_day: Float
        let precipitation: Float
        let rain: Float
        let showers: Float
        let snowfall: Float
        let weather_code: Float
        let cloud_cover: Float
        let pressure_msl: Float
        let surface_pressure: Float
        let wind_speed_10m: Float
        let wind_direction_10m: Float
        let wind_gusts_10m: Float
    }
    struct Hourly: Decodable {
        let time: [String]
        let temperature_2m: [Float]
        let relative_humidity_2m: [Float]
        let dew_point_2m: [Float]
        let apparent_temperature: [Float]
        let precipitation_probability: [Float]
        let precipitation: [Float]
        let rain: [Float]
        let showers: [Float]
        let snowfall: [Float]
        let snow_depth: [Float]
        let weather_code: [Float]
        let pressure_msl: [Float]
        let surface_pressure: [Float]
        let cloud_cover: [Float]
        let cloud_cover_low: [Float]
        let cloud_cover_mid: [Float]
        let cloud_cover_high: [Float]
        let visibility: [Float]
        let evapotranspiration: [Float]
        let et0_fao_evapotranspiration: [Float]
        let vapour_pressure_deficit: [Float]
        let wind_speed_10m: [Float]
        let wind_speed_80m: [Float]
        let wind_speed_120m: [Float]
        let wind_speed_180m: [Float]
        let wind_direction_10m: [Float]
        let wind_direction_80m: [Float]
        let wind_direction_120m: [Float]
        let wind_direction_180m: [Float]
        let wind_gusts_10m: [Float]
        let temperature_80m: [Float]
        let temperature_120m: [Float]
        let temperature_180m: [Float]
        let soil_temperature_0cm: [Float]
        let soil_temperature_6cm: [Float]
        let soil_temperature_18cm: [Float]
        let soil_temperature_54cm: [Float]
        let soil_moisture_0_to_1cm: [Float]
        let soil_moisture_1_to_3cm: [Float]
        let soil_moisture_3_to_9cm: [Float]
        let soil_moisture_9_to_27cm: [Float]
        let soil_moisture_27_to_81cm: [Float]
    }
    struct Daily: Decodable {
        let time: [String]
        let weather_code: [Float]
        let temperature_2m_max: [Float]
        let temperature_2m_min: [Float]
        let apparent_temperature_max: [Float]
        let apparent_temperature_min: [Float]
        let sunrise: [String]
        let sunset: [String]
        let daylight_duration: [Float]
        let sunshine_duration: [Float]
        let uv_index_max: [Float]
        let uv_index_clear_sky_max: [Float]
        let precipitation_sum: [Float]
        let rain_sum: [Float]
        let showers_sum: [Float]
        let snowfall_sum: [Float]
        let precipitation_hours: [Float]
        let precipitation_probability_max: [Float]
        let wind_speed_10m_max: [Float]
        let wind_gusts_10m_max: [Float]
        let wind_direction_10m_dominant: [Float]
        let shortwave_radiation_sum: [Float]
        let et0_fao_evapotranspiration: [Float]
    }
    
    static var placeholder: WeatherData {
        return WeatherData(
            latitude: 0.0,
            longitude: 0.0,
            generationtime_ms: 0.0,
            utc_offset_seconds: 0.0,
            timezone: "UTC",
            timezone_abbreviation: "UTC",
            elevation: 0.0,
            current: .placeholder,
            hourly: .placeholder,
            daily: .placeholder
        )
    }
}

extension WeatherData.Current {
    static var placeholder: WeatherData.Current {
        return WeatherData.Current(
            time: "2024-08-15T00:00",
            temperature_2m: 0.0,
            relative_humidity_2m: 0.0,
            apparent_temperature: 0.0,
            is_day: 1.0,
            precipitation: 0.0,
            rain: 0.0,
            showers: 0.0,
            snowfall: 0.0,
            weather_code: 0.0,
            cloud_cover: 0.0,
            pressure_msl: 1013.25,
            surface_pressure: 1013.25,
            wind_speed_10m: 0.0,
            wind_direction_10m: 0.0,
            wind_gusts_10m: 0.0
        )
    }
}

extension WeatherData.Hourly {
    static var placeholder: WeatherData.Hourly {
        return WeatherData.Hourly(
            time: Array(repeating: "2024-08-15T00:00", count: 24),
            temperature_2m: Array(repeating: 20.0, count: 24),
            relative_humidity_2m: Array(repeating: 50.0, count: 24),
            dew_point_2m: Array(repeating: 10.0, count: 24),
            apparent_temperature: Array(repeating: 20.0, count: 24),
            precipitation_probability: Array(repeating: 0.0, count: 24),
            precipitation: Array(repeating: 0.0, count: 24),
            rain: Array(repeating: 0.0, count: 24),
            showers: Array(repeating: 0.0, count: 24),
            snowfall: Array(repeating: 0.0, count: 24),
            snow_depth: Array(repeating: 0.0, count: 24),
            weather_code: Array(repeating: 0.0, count: 24),
            pressure_msl: Array(repeating: 1013.25, count: 24),
            surface_pressure: Array(repeating: 1013.25, count: 24),
            cloud_cover: Array(repeating: 0.0, count: 24),
            cloud_cover_low: Array(repeating: 0.0, count: 24),
            cloud_cover_mid: Array(repeating: 0.0, count: 24),
            cloud_cover_high: Array(repeating: 0.0, count: 24),
            visibility: Array(repeating: 10.0, count: 24),
            evapotranspiration: Array(repeating: 0.0, count: 24),
            et0_fao_evapotranspiration: Array(repeating: 0.0, count: 24),
            vapour_pressure_deficit: Array(repeating: 0.0, count: 24),
            wind_speed_10m: Array(repeating: 5.0, count: 24),
            wind_speed_80m: Array(repeating: 5.0, count: 24),
            wind_speed_120m: Array(repeating: 5.0, count: 24),
            wind_speed_180m: Array(repeating: 5.0, count: 24),
            wind_direction_10m: Array(repeating: 0.0, count: 24),
            wind_direction_80m: Array(repeating: 0.0, count: 24),
            wind_direction_120m: Array(repeating: 0.0, count: 24),
            wind_direction_180m: Array(repeating: 0.0, count: 24),
            wind_gusts_10m: Array(repeating: 0.0, count: 24),
            temperature_80m: Array(repeating: 15.0, count: 24),
            temperature_120m: Array(repeating: 15.0, count: 24),
            temperature_180m: Array(repeating: 15.0, count: 24),
            soil_temperature_0cm: Array(repeating: 15.0, count: 24),
            soil_temperature_6cm: Array(repeating: 15.0, count: 24),
            soil_temperature_18cm: Array(repeating: 15.0, count: 24),
            soil_temperature_54cm: Array(repeating: 15.0, count: 24),
            soil_moisture_0_to_1cm: Array(repeating: 0.3, count: 24),
            soil_moisture_1_to_3cm: Array(repeating: 0.3, count: 24),
            soil_moisture_3_to_9cm: Array(repeating: 0.3, count: 24),
            soil_moisture_9_to_27cm: Array(repeating: 0.3, count: 24),
            soil_moisture_27_to_81cm: Array(repeating: 0.3, count: 24)
        )
    }
}

extension WeatherData.Daily {
    static var placeholder: WeatherData.Daily {
        return WeatherData.Daily(
            time: Array(repeating: "2024-08-15T00:00", count: 7),
            weather_code: Array(repeating: 0.0, count: 7),
            temperature_2m_max: Array(repeating: 25.0, count: 7),
            temperature_2m_min: Array(repeating: 15.0, count: 7),
            apparent_temperature_max: Array(repeating: 25.0, count: 7),
            apparent_temperature_min: Array(repeating: 15.0, count: 7),
            sunrise: Array(repeating: "2024-08-15T18:31", count: 7),
            sunset: Array(repeating: "2024-08-15T18:31", count: 7),
            daylight_duration: Array(repeating: 12.0, count: 7),
            sunshine_duration: Array(repeating: 10.0, count: 7),
            uv_index_max: Array(repeating: 5.0, count: 7),
            uv_index_clear_sky_max: Array(repeating: 6.0, count: 7),
            precipitation_sum: Array(repeating: 0.0, count: 7),
            rain_sum: Array(repeating: 0.0, count: 7),
            showers_sum: Array(repeating: 0.0, count: 7),
            snowfall_sum: Array(repeating: 0.0, count: 7),
            precipitation_hours: Array(repeating: 0.0, count: 7),
            precipitation_probability_max: Array(repeating: 0.0, count: 7),
            wind_speed_10m_max: Array(repeating: 5.0, count: 7),
            wind_gusts_10m_max: Array(repeating: 10.0, count: 7),
            wind_direction_10m_dominant: Array(repeating: 0.0, count: 7),
            shortwave_radiation_sum: Array(repeating: 15.0, count: 7),
            et0_fao_evapotranspiration: Array(repeating: 0.0, count: 7)
        )
    }
}
