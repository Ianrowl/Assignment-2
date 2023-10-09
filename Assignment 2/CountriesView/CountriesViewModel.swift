//
//  CountriesViewModel.swift
//  Assignment 2
//
//  Created by Ian Rowland on 10/8/23.
//

import Foundation
import SwiftUI

class CountriesViewModel: ObservableObject {
    @Published var countries = [Country]()
    @Published private(set) var selectedCountry: Country? //With help from online forums
    
    func getAllCountries() async {
        do {
            let url = URL(string: "https://restcountries.com/v3.1/all")!
            let (data, _) = try await URLSession.shared.data(from: url)
            countries = try JSONDecoder().decode([Country].self, from: data)
        } catch {
            print(String(describing: error))
        }
    }
    
    func selectCountry(_ country: Country) {//ChatGPT assisted
        selectedCountry = country
    }
}

