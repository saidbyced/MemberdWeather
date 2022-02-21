//
//  WeatherViewViewModel.swift
//  MemberdWeather
//
//  Created by Christopher Eadie on 10/02/2022.
//

import Foundation

extension WeatherView {
    final class ViewModel: ObservableObject {
        @Published var weather = WeatherResponse()
        
        var currentTemp: Double? { weather.consolidatedWeather.first?.theTemp }
        var currentTempString: String { formattedTempString(for: currentTemp) }
        var minTempString: String { formattedTempString(for: weather.consolidatedWeather.first?.minTemp) }
        var maxTempString: String { formattedTempString(for: weather.consolidatedWeather.first?.maxTemp) }
        
        init() {
            getWeather()
        }
        
        func formattedTempString(for temp: Double?) -> String {
            guard let temp = temp else {
                return ""
            }
            
            return String(format: "%.1f", temp)
        }
        
        private func getWeather() {
            let url = URL(string: MetaWeatherAPI.londonUrl)!
            NetworkManager<WeatherResponse>.fetch(for: url) { (result) in
                switch result {
                case .success(let weather):
                    DispatchQueue.main.async {
                        self.weather = weather
                    }
                case .failure(let error):
                    // TODO: - Handle errors better
                    print(error)
                }
            }
        }
    }
}
