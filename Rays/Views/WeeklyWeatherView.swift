//
//  WeeklyWeatherView.swift
//  Rays
//
//  Created by Cooper R on 5/18/22.
//

import SwiftUI

struct WeeklyWeatherView: View {
    
    @ObservedObject var cityVM: CityViewVM
    @Environment(\.colorScheme) var darkMode
    
    var body: some View {
        VStack {
            HStack {
                Text("Day")
                    .frame(width: 50, alignment: .leading)
                Spacer(minLength: 62)
                Text("Low | High")
                    .frame(width: 150, alignment: .leading)
                Spacer()
                Text("")
            }.padding(.vertical, 15)
             .padding(.horizontal, 45)
            
            ForEach(cityVM.weather.daily) { weather in
                LazyVStack {
                    dailyCell(weather: weather)
                }
            }
        }.background(RoundedRectangle(cornerRadius: 20).fill(darkMode == .dark ? Color(.systemGray3) : Color.white))
            .shadow(color: Color.black.opacity(0.15), radius: 25, x: 2, y: 0.5)
            .padding()
    }
    
    private func dailyCell(weather: Daily) -> some View {
            HStack {
                Text(cityVM.getDayFor(timestamp: weather.dt).uppercased())
                    .frame(width: 50)
                Spacer()
                Text("\(cityVM.getTempFor(temp: weather.temp.min)) | \(cityVM.getTempFor(temp: weather.temp.max))")
                    .frame(width: 150)
                Spacer()
                Text(cityVM.getPrecipFor(precip: weather.pop))
                    .frame(width: 50)
                cityVM.getWeatherIconFor(icon: weather.weather.count > 0 ? weather.weather[0].icon : "sun.max.fill")
            }.padding(.horizontal, 40)
             .padding(.vertical, 15)
    }
}
