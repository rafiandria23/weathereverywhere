//
//  MyWeatherView.swift
//  WeatherEverywhere
//
//  Created by Adam Rafiandri on 02/21/22.
//

import SwiftUI

struct MyWeatherView: View {
    @State private var forecasts = [Forecast]()
    @State private var selection: Forecast?
    
    var body: some View {
        List(selection: $selection) {
            ForEach(forecasts) { forecast in
                NavigationLink(destination: WeatherDetails(forecast: forecast), tag: forecast, selection: $selection) {
                    WeatherRow(forecast: forecast)
                }
            }
        }
        .onAppear(perform: loadData)
    }
    
    func loadData() {
        let weatherDataRequest = DataRequest<WeatherData>(city: "San Francisco")
        
        weatherDataRequest.getData{ dataResult in
            switch dataResult {
            case .failure:
                print("Could now load weather data.")
            case .success(let weatherDataObjects):
                guard let forecastArray = weatherDataObjects.first?.forecast else {
                    return
                }
                
                DispatchQueue.main.async {
                    self.forecasts = forecastArray
                }
            }
        }
    }
}

struct MyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MyWeatherView()
    }
}
