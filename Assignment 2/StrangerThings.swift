//
//  StrangerThings.swift
//  Assignment 2
//
//  Created by Ian Rowland on 9/28/23.
//

import SwiftUI

struct Quote: Codable, Identifiable{
    var id: Int {
        return UUID().hashValue
    }
//    var number: Int
    var quote: String
    var author: String

}

struct StrangerView: View {
    @State var quotes = [Quote]()
    
//    func getQuote() async -> () {
//        do {
//            let url = URL(string: "https://strangerthings-quotes.vercel.app/api/quotes/20")!
//            let (data, _) = try await URLSession.shared.data(from: url)
//            print(data)
//            quotes = try JSONDecoder().decode([Quote].self, from: data)
//        } catch {
//            print(String(describing: error))
//        }
//        
//    }
    
    func getQuote() async {
        guard let url = URL(string: "https://strangerthings-quotes.vercel.app/api/quotes") else{
            print("Sorry doesn't work")
            return
        }
        do{
            let(data, _) = try await URLSession.shared.data(from:url)
            
            if let decodedResponse = try? JSONDecoder().decode([Quote].self, from: data){
                quotes = decodedResponse
            }
        } catch{
            print("This isn't valid!!")
        }
    }

    
    var body: some View{
        NavigationView{
            List(quotes){ quote in
                VStack(alignment: .leading){
                    
                    Text("\(quote.quote) - \(quote.author) ")
                }

                }
            }.navigationTitle("Stranger Things Quotes")
            .task {
                await getQuote()
        }
    }
}
