//
//  DailyWeatherView.swift
//  Rays
//
//  Created by Cooper R on 5/18/22.
//

import SwiftUI

struct DailyWeatherView: View {
   
    @ObservedObject var cityVM: CityViewVM
    @Environment(\.colorScheme) var darkMode
    
    var date: String
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                VStack(spacing: -3) {
                    LocationNameView(city: cityVM.city)
                    Spacer(minLength: 20)
                    Text("Today")
                        .font(.title)
                        .bold()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    Text(date)
                        .font(Font.system(size: 20, weight: .bold))
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                }
                HStack {
                    cityVM.getWeatherIconFor(icon: cityVM.weatherIcon)
                        .font(.title)
                        .offset(y: -7)
                    VStack(alignment: .leading) {
                        Text("\(cityVM.temperature)°")
                            .font(.system(size: 42))
                        Text(cityVM.conditions)
                    }
                }
            }
        }.padding()
         .background(.regularMaterial,
                     in: RoundedRectangle(cornerRadius: 20))
         .shadow(color: Color.black.opacity(0.15), radius: 25, x: 2, y: 0.5)
    }
}
