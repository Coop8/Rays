//
//  HourlyWeatherView.swift
//  Rays
//
//  Created by Cooper R on 5/18/22.
//

import SwiftUI

struct HourlyWeatherView: View {
    
    @ObservedObject var cityVM: CityViewVM
    @Environment(\.colorScheme) var darkMode
    
    var body: some View {
        VStack{
            Text("Hourly")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(cityVM.weather.hourly) { weather in
                        let icon = cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
                        let hour = cityVM.getTimeFor(timestamp: weather.dt)
                        let temp = cityVM.getTempFor(temp: weather.temp)
                        let precip = cityVM.getPrecipFor(precip: weather.pop)
                        getHourlyWeather(hour: hour, image: icon, temp: temp, precip: precip)
                    }
                }.padding()
            }
        }.background(.regularMaterial,
                     in: RoundedRectangle(cornerRadius: 20))
            .shadow(color: Color.black.opacity(0.15), radius: 25, x: 2, y: 0.5)
            .padding()
    }
    
    private func getHourlyWeather(hour: String, image: Image, temp: String, precip: String) -> some View {
        VStack(spacing: 20) {
            Text(hour)
            image
                .foregroundColor(darkMode == .dark ? Color.white : Color.black)
            Text(temp)
            Text(precip)
        }.padding()
            .background(.thinMaterial,
                        in: RoundedRectangle(cornerRadius: 20))
            //.shadow(color: Color.white.opacity(0.2), radius: 2, x: -2, y: -2)
            //.shadow(color: Color.black.opacity(0.2), radius: 2, x: 2, y: 2)
    }
}
