//
//  WeatherData.swift
//  WeatherEverywhere
//
//  Created by Adam Rafiandri on 02/21/22.
//

import Foundation

struct WeatherData: Decodable, Identifiable {
    var id: String
    var forecast: [Forecast]
}
