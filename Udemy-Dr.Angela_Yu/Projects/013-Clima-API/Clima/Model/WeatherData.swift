//
//  WeatherData.swift
//  Clima
//
//  Created by Osman Emre Ömürlü on 17.11.2022.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable { //api en dis katman
    let name: String // name direkt en dis katman icinde oldugu icin name: String dedik ama baska katman icinde olursa o katman tipinde nesne olusturmamiz lazim. ornegin main: Main
    let main: Main
    let weather: [Weather]
    let sys: Sys
}

struct Main: Codable { // WeatherData icinde Main katmani
    let temp: Float
}

struct Weather: Codable { // WeatherData icinde Weather katmani, icinde "description" ve "id"
    let description: String
    let id: Int
}

struct Sys: Codable { // WeatherData icinde Sys katmani, icinde "country"
    let country: String
}






