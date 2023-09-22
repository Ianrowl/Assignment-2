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
    var name: Name
    var region: String
    var capital: [String]?
    //    var continents: [String]

}


struct Name: Codable {
    var common: String
}


struct Countries: View {
    @State var countries = [Country]()
    
    func getAllCountries() async -> () {
        do {
            let url = URL(string: "https://restcountries.com/v3.1/all")!
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            countries = try JSONDecoder().decode([Country].self, from: data)
        } catch {
            print(String(describing: error))
        }
    }

    var body: some View {
        NavigationView {
            List(countries) { country in
                VStack(alignment: .leading) {
                    Text("\(country.name.common) -~- \(country.region) ")
                    
//                    Text(country.capital.joined(separator: ", "))
//                    print(country.capital)
                }
            }
            .task {
                await getAllCountries()
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
