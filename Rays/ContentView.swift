//
//  ContentView.swift
//  Rays
//
//  Created by Cooper R on 5/17/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var cityVM = CityViewVM()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 0) {
                Spacer(minLength: 30)
                
                ScrollView(showsIndicators: false) {
                    SearchHeaderView(cityVM: cityVM)
                    CityView(cityVM: cityVM)
                }
            }.padding(.top, 40)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
