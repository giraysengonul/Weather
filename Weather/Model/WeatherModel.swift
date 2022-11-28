//
//  WeatherModel.swift
//  Weather
//
//  Created by hakkı can şengönül on 28.11.2022.
//

import Foundation

struct WeatherModel: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}
struct Weather: Codable{
    let description: String
    let id: Int
}
