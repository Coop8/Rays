//
//  Hourly.swift
//  Rays
//
//  Created by Cooper R on 5/21/22.
//

import Foundation

class Hourly: Codable, Identifiable {
    var dt: Int
    var temp: Double
    // var feelLike: Double
    var pressure: Int
    var humidity: Int
    var dew_point: Double
    var clouds: Int
    var wind_speed: Double
    var wind_deg: Int
    var weather: [Detail]
    var pop: Double
    
    enum CodingKey: String {
        case dt
        case temp
        // case feelLike
        case pressure
        case humidity
        case dew_point
        case clouds
        case wind_speed
        case wind_deg
        case weather
        case pop
    }
    
    init() {
        dt = 0
        temp = 0.0
        //feelLike = 0.0
        pressure = 0
        humidity = 0
        dew_point = 0.0
        clouds = 0
        wind_speed = 0.0
        wind_deg = 0
        weather = []
        pop = 0.0
    }
}

extension Hourly {
    var id: UUID {
        return UUID()
    }
}
