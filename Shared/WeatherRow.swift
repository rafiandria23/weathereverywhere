//
//  WeatherRow.swift
//  WeatherEverywhere
//
//  Created by Adam Rafiandri on 02/21/22.
//

import SwiftUI

struct WeatherRow: View {
    var forecast: Forecast

    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: Icon.systemIconForCondition(condition: forecast.condition_name))
                .frame(width: 50, height: 50)
                .accessibility(hidden: true)
            
            VStack(alignment: .leading) {
                Text(forecast.condition_name)
                    .font(.headline)
                    .lineLimit(1)
                
                Text(forecast.condition_desc)
                    .lineLimit(2)
            }
            .padding(.vertical, 8)
            
            Spacer(minLength: 0)
        }
        .font(.subheadline)
        .padding(.vertical, 0)
        .accessibilityElement(children: .combine)
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow(
            forecast: Forecast(
                date: "02/21/2022",
                temp_min: 10,
                temp_max: 20,
                condition_name: "Windy",
                condition_desc: "Attention! It's windy."
            )
        )
    }
}
