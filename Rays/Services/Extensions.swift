//
//  Extensions.swift
//  Rays
//
//  Created by Cooper R on 5/17/22.
//

import Foundation

extension API {
    static let baseURLString = "https://api.openweathermap.org/data/3.0/"
    
    // Building url for requested latitude and lonitude
    static func getURLFor(lat: Double, lon: Double) -> String {
        return "\(baseURLString)onecall?lat=\(lat)&lon=\(lon)&exclude=minutely&appid=\(key)&units=imperial"
    }
}
