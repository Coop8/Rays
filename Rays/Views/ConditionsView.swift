//
//  ConditionsView.swift
//  Rays
//
//  Created by Cooper R on 5/19/22.
//

import SwiftUI

struct ConditionsView: View {
    
    @ObservedObject var cityVM: CityViewVM
    @Environment(\.colorScheme) var darkMode
    
    var body: some View {
        VStack{
            Text("Conditions")
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding()
            HStack {
                Spacer()
                createWidget(image: "wind", color: .green, title: "\(cityVM.windSpeed)mi/hr")
                Spacer()
                createWidget(image: "drop.fill", color: .blue, title: "\(cityVM.humidity)")
                Spacer()
                createWidget(image: "umbrella.fill", color: .red, title: "\(cityVM.rainChances)")
                Spacer()
            }.padding()
        }
        .background(.regularMaterial,
                    in: RoundedRectangle(cornerRadius: 20))
        .shadow(color: Color.black.opacity(0.15), radius: 25, x: 2, y: 0.5)
        .padding()
    }
    
    private func createWidget(image: String, color: Color, title: String) -> some View {
        VStack{
            Image(systemName: image)
                .padding()
                .font(.title)
                .foregroundColor(color)
                .background(.thinMaterial,
                            in: RoundedRectangle(cornerRadius: 20))
            
            Text(title)
        }
    }
}

struct ConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
