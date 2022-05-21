//
//  CityView.swift
//  Rays
//
//  Created by Cooper R on 5/18/22.
//

import SwiftUI

struct CityView: View {
    
    @ObservedObject var cityVM: CityViewVM
    
    var body: some View {
        VStack {
            DailyWeatherView(cityVM: cityVM, date: cityVM.date)
                .padding()
            ConditionsView(cityVM: cityVM)
            HourlyWeatherView(cityVM: cityVM)
            WeeklyWeatherView(cityVM: cityVM)
        }.padding(.bottom, 30)
    }
}
