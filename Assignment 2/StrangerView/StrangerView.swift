//
//  StrangerView.swift
//  Assignment 2
//
//  Created by Ian Rowland on 9/28/23.
//

import SwiftUI

struct Quote: Codable, Identifiable{
    var id: Int {
        return UUID().hashValue
    }
    var quote: String
    var author: String

}

struct StrangerView: View {
    @State var quotes = [Quote]()
    @State var currentQuote: Quote? = nil //ChatGPT assisted me in setting it to nil
    
    func getRandomQuote() {
        guard let url = URL(string: "https://strangerthings-quotes.vercel.app/api/quotes") else {

            print("Sorry, doesn't work :(")
            return
        }
        Task{
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedResponse = try JSONDecoder().decode([Quote].self, from: data)
                if let randomQuote = decodedResponse.randomElement() {
                    currentQuote = randomQuote
                }
            } catch {
                print("This isn't valid!!")
            }
        }
    }

    
    var body: some View{
        NavigationView{
            VStack {
                if let quote = currentQuote {
                     VStack(alignment: .leading) {         Text("\"\(quote.quote)\" - \(quote.author)")
                             .padding()
                     }
                 } else {
                     Text("Loading...")
                         .padding()
                 }
                 
                 Button(action: {
                     getRandomQuote()
                 }) {
                     Text("Get Random Quote")
                 }
                 .padding()
            }
            .navigationTitle("Stranger Things Quotes")
        }
        .onAppear {
            getRandomQuote() // Loads the random quote WHEN the view appears
        }
    }
}

struct Stranger_Previews: PreviewProvider {
    static var previews: some View {
        StrangerView()
    }
}
