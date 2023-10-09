//
//  Countries.swift
//  Assignment 2
//
//  Created by Ian Rowland on 9/21/23.
//

import SwiftUI
import Foundation

struct Country: Codable, Identifiable {
    var id: Int {
        return UUID().hashValue
    }
    var name: Name
    var region: String
    var capital: [String]?
    //    var continents: [String]

}


struct Name: Codable {
    var common: String
}

struct Countries: View {
    @ObservedObject var viewModel: CountriesViewModel
    @State private var showingAlert = false
    
    var body: some View {
        NavigationView {
            List(viewModel.countries) { country in
                VStack(alignment: .leading) {
                    Text("\(country.name.common)")
                    
                    Button("Region?") {
                        viewModel.selectCountry(country)
                        showingAlert = true
                    }
                }
            }
            .alert(isPresented: $showingAlert){
                Alert(title: Text(viewModel.selectedCountry?.region ?? ""),dismissButton: .default(Text("Close")))
            }
//            .alert(isPresented: $showingAlert)) {
//                Alert(title: Text(viewModel.selectedCountry?.region ?? ""), dismissButton: .default(Text("Close")))
//            }
            .task {
                await viewModel.getAllCountries()
            }
        }
        .navigationTitle("Countries")
    }
}
