//
//  SearchHeaderView.swift
//  Rays
//
//  Created by Cooper R on 5/18/22.
//

import SwiftUI

struct SearchHeaderView: View {
    
    @ObservedObject var cityVM: CityViewVM
    @Environment(\.colorScheme) var darkMode
    @State private var searchItem = ""
    
    var body: some View {
        HStack {
            TextField("", text: $searchItem)
                .onSubmit {
                    cityVM.city = searchItem
                }
        }
        .padding()
        .background(ZStack (alignment: .leading) {
            Image(systemName: "magnifyingglass")
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
                
            RoundedRectangle(cornerRadius: 10)
                .fill(darkMode == .dark ? Color.white.opacity(0.1) : Color.black.opacity(0.1))
                .padding(10)
        })
    }
}
