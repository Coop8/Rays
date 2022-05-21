//
//  Daily.swift
//  Rays
//
//  Created by Cooper R on 5/17/22.
//

import Foundation

struct Daily: Codable, Identifiable {
    var dt: Int
    var temp: Temperature
    var weather: [Detail]
    
    enum CodingKey: String {
        case dt
        case temp
        case weather
    }
    
    init() {
        dt = 0
        temp = Temperature(min: 0.0, max: 0.0)
        weather = [Detail(main: "", description: "", icon: "")]
    }
}

extension Daily {
    var id: UUID {
        return UUID()
    }
}
