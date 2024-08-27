//
//  DateFormatter.swift
//  WeatherForecast
//
//  Created by Kirill Lebedev on 15.08.24.
//

import Foundation

func formattedTime(from dateString: String) -> String {
    // Create a DateFormatter to parse the incoming string
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    inputFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    
    // Parse the date string into a Date object
    guard let date = inputFormatter.date(from: dateString) else {
        return "Invalid date"
    }
    
    // Create another DateFormatter to format the output
    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "HH:mm"
    outputFormatter.timeZone = TimeZone.current
    
    // Return the formatted time string
    return outputFormatter.string(from: date)
}
