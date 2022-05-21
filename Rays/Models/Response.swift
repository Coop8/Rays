//
//  Response.swift
//  Rays
//
//  Created by Cooper R on 5/17/22.
//

import Foundation

struct Response: Codable {
    var current: Weather
    var hourly: [Hourly]
    var daily: [Daily]
    
    static func empty() -> Response {
        return Response(current: Weather(), hourly: [Hourly](repeating: Hourly(), count: 12), daily: [Daily](repeating: Daily(), count: 8))
    }
}

