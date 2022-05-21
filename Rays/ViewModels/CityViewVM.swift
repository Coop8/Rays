//
//  CityViewVM.swift
//  Rays
//
//  Created by Cooper R on 5/17/22.
//

import SwiftUI
import CoreLocation

final class CityViewVM: ObservableObject {
    
    @Published var weather = Response.empty()
    @Published var city: String = "Sydney" {
        didSet {
            getLocation()
        }
    }
    
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    private lazy var dayFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE"
        return formatter
    }()
    
    private lazy var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh a"
        return formatter
    }()
    
    init() {
        getLocation()
    }
    
    var date: String {
        return dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(weather.current.dt)))
    }
    
    var weatherIcon: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].icon
        }
        return "sun.max.fill"
    }
    
    var temperature: String {
        return getTempFor(temp: weather.current.temp)
    }
    
    var conditions: String {
        if weather.current.weather.count > 0 {
            return weather.current.weather[0].main
        }
        return ""
    }
    
    var windSpeed: String {
        return String(format: "%0.1f", weather.current.wind_speed)
    }
    
    var humidity: String {
        return String(format: "%d%%", weather.current.humidity)
    }
    
    var rainChances: String {
        return String(format: "%0.0f%%", weather.current.dew_point)
    }
    
    func getTimeFor(timestamp: Int) -> String {
        return timeFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getDayFor(timestamp: Int) -> String {
        return dayFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp)))
    }
    
    func getTempFor(temp: Double) -> String {
        return String(format: "%0.0f", temp)
    }
    
    func getPrecipFor(precip: Double) -> String {
        return String(format: "%0.0f%%", precip * 100.0)
    }
    
    private func getLocation() {
        CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
            if let places = placemarks, let place = places.first {
                self.getWeather(coord: place.location?.coordinate)
            }
        }
    }
    
    private func getWeather(coord: CLLocationCoordinate2D?) {
        if let coord = coord {
            let urlString = API.getURLFor(lat: coord.latitude, lon: coord.longitude)
            getWeatherInternal(city: city, for: urlString)
        } else {
            let urlString = API.getURLFor(lat: 33.8688, lon: 151.2093)
            getWeatherInternal(city: city, for: urlString)
        }
    }
    
    private func getWeatherInternal(city: String, for urlString: String) {
        APIManager<Response>.fetch(for: URL(string: urlString)!) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.weather = response
                }
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getWeatherIconFor(icon: String) -> Image {
        switch icon {
            case "01d":
                return Image(systemName: "sun.max.fill") // Clear day
            case "01n":
                return Image(systemName: "moon.fill") // Clear night
            case "02d":
                return Image(systemName: "cloud.sun.fill") // Partly cloudy day
            case "02n":
                return Image(systemName: "cloud.moon.fill") // Partly cloudy night
            case "03d":
                return Image(systemName: "cloud.fill") // Scattered clouds day
            case "03n":
                return Image(systemName: "cloud.fill") // Scattered clouds night
            case "04d":
                return Image(systemName: "cloud.fill") // Clouds day
            case "04n":
                return Image(systemName: "cloud.fill") // Clouds night
            case "09d":
                return Image(systemName: "cloud.drizzle.fill") // Drizzle day
            case "09n":
                return Image(systemName: "cloud.drizzle.fill") // Drizzle night
            case "10d":
                return Image(systemName: "cloud.heavyrain.fill") // Rain day
            case "10n":
                return Image(systemName: "cloud.heavyrain.fill") // Rain night
            case "11d":
                return Image(systemName: "cloud.bolt.fill") // Thunderstorm day
            case "11n":
                return Image(systemName: "cloud.bolt.fill") // Thunderstorm night
            case "13d":
                return Image(systemName: "cloud.snow.fill") // Snow
            case "13n":
                return Image(systemName: "cloud.snow.fill") // Snow
            case "50d":
                return Image(systemName: "cloud.fog.fill") // Misty
            case "50n":
                return Image(systemName: "cloud.fog.fill") // Misty
            default:
                return Image(systemName: "sun.max.fill")
        }
    }
    
}
