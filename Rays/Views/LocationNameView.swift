//
//  CityView.swift
//  Rays
//
//  Created by Cooper R on 5/18/22.
//

import SwiftUI

struct LocationNameView: View {
    var city: String
    
    var body: some View {
        HStack {
            VStack {
                Text(city)
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
        }
    }
}
