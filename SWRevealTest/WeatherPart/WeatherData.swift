//
//  WeatherData.swift
//  Clima
//
//  Created by tami on 10/17/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}


struct Main: Decodable{
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
}



