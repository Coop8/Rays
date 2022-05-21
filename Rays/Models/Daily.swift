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
    var pop: Double
    
    enum CodingKey: String {
        case dt
        case temp
        case weather
        case pop
    }
    
    init() {
        dt = 0
        temp = Temperature(min: 0.0, max: 0.0)
        weather = [Detail(main: "", description: "", icon: "")]
        pop = 0.0
    }
}

extension Daily {
    var id: UUID {
        return UUID()
    }
}
