//
//  Countries.swift
//  Assignment 2
//
//  Created by Ian Rowland on 9/21/23.
//

import SwiftUI

struct Country: Codable, Identifiable {
    var id: Int {
        return UUID().hashValue
    }
    var name: CountryName
    var region: String
    var altSpellings: [String]
    var flag: String
    var area: Int
}

struct CountryName: Codable {
    var common: String
    var nativeName: String
    var official: String
}


struct Countries: View {
    @State var countries =  [Country]()
    
    func getAllCountries() async -> () {
        do {
            let url = URL(string: "https://restcountries.com/v3.1/all")!
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            countries = try JSONDecoder().decode([Country].self, from: data)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }

    var body: some View {
        Text("hello")
        NavigationView {
            List(countries) {
                country in
                VStack {
                    Text(country.name.common)
                    Text(country.name.nativeName)
                    Text(country.name.official)
                }
            }
            
        }
        .navigationTitle("Countries")
    }

}

struct Countries_Previews: PreviewProvider {
    static var previews: some View {
        Countries()
    }
}
