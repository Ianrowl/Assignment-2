//
//  StrangerViewModel.swift
//  Assignment 2
//
//  Created by Ian Rowland on 10/8/23.
//

import Foundation
import SwiftUI

class StrangerViewModel: ObservableObject {
    @Published var currentQuote: Quote?
    
    func getRandomQuote() async {
        guard let url = URL(string: "https://strangerthings-quotes.vercel.app/api/quotes") else {
            print("Sorry, doesn't work :(")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode([Quote].self, from: data)
            currentQuote = decodedResponse.randomElement()
        } catch {
            print("This isn't valid!!")
        }
    }
}
