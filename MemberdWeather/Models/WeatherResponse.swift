//
//  WeatherResponse.swift
//  MemberdWeather
//
//  Created by Christopher Eadie on 10/02/2022.
//

import Foundation

struct WeatherResponse: Codable {
    let consolidatedWeather: [ConsolidatedWeather]
    
    enum CodingKeys: String, CodingKey {
        case consolidatedWeather = "consolidated_weather"
    }
    
    init() {
        consolidatedWeather = []
    }
    
    struct ConsolidatedWeather: Codable {
        let id: Int
        let weatherStateName, weatherStateAbbr, windDirectionCompass, created: String
        let applicableDate: String
        let minTemp, maxTemp, theTemp, windSpeed: Double
        let windDirection, airPressure: Double
        let humidity: Int
        let visibility: Double
        let predictability: Int
        
        enum CodingKeys: String, CodingKey {
            case id
            case weatherStateName = "weather_state_name"
            case weatherStateAbbr = "weather_state_abbr"
            case windDirectionCompass = "wind_direction_compass"
            case created
            case applicableDate = "applicable_date"
            case minTemp = "min_temp"
            case maxTemp = "max_temp"
            case theTemp = "the_temp"
            case windSpeed = "wind_speed"
            case windDirection = "wind_direction"
            case airPressure = "air_pressure"
            case humidity, visibility, predictability
        }
        
        init() {
            self.id = 0
            self.weatherStateName = ""
            self.weatherStateAbbr = ""
            self.windDirectionCompass = ""
            self.created = ""
            self.applicableDate = ""
            self.minTemp = 0.0
            self.maxTemp = 0.0
            self.theTemp = 0.0
            self.windSpeed = 0.0
            self.windDirection = 0.0
            self.airPressure = 0.0
            self.humidity = 0
            self.visibility = 0.0
            self.predictability = 0
        }
    }
}
