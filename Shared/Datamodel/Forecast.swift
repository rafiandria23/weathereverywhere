//
//  Forecast.swift
//  WeatherEverywhere
//
//  Created by Adam Rafiandri on 02/21/22.
//

import Foundation

struct Forecast: Decodable, Hashable, Identifiable {
    var id: UUID
    var date: String
    var temp_min: Float
    var temp_max: Float
    var condition_name: String
    var condition_desc: String

    init(date: String, temp_min: Float, temp_max: Float, condition_name: String, condition_desc: String) {
        self.id = UUID()
        self.date = date
        self.temp_min = temp_min
        self.temp_max = temp_max
        self.condition_name = condition_name
        self.condition_desc = condition_desc
    }

    init(from decoder: Decoder) throws {
        self.id = UUID()
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.date = try container.decode(String.self, forKey: .date)
        self.temp_min = try container.decode(Float.self, forKey: .temp_min)
        self.temp_max = try container.decode(Float.self, forKey: .temp_max)
        self.condition_name = try container.decode(String.self, forKey: .condition_name)
        self.condition_desc = try container.decode(String.self, forKey: .condition_desc)
    }

    enum CodingKeys: String, CodingKey {
        case date
        case temp_min
        case temp_max
        case condition_name
        case condition_desc
    }
}
