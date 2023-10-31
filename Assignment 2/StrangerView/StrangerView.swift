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
    @ObservedObject var viewModel: StrangerViewModel
    
    var notificationService = PushNotificationService()//From ChatGPT, changed some of the commented things too
    
    var body: some View {
        NavigationView {
            VStack {
                if let quote = viewModel.currentQuote {
                    VStack(alignment: .leading) {
                        Text("\"\(quote.quote)\" - \(quote.author)")
                            .padding()
                    }
                } else {
                    Text("Loading, please wait...")
                        .padding()
                }
                
                Button(action: {
                    Task {
                        await viewModel.getRandomQuote()
                    }
                }) {
                    Text("Random Quote")
                }
                .padding()
                
//                Button("Request Notifications Permission") {
//                    PushNotificationService().requestPermissions()
//                }
                Button("Request Notifications Permission") {
                    notificationService.requestPermissions()
                }
                .padding(.vertical, 20)
                
//                Button("Remind me about a random quote") {
//                    if let quote = viewModel.currentQuote {
//                        let title = quote.author
//                        let subtitle = "\"\(quote.quote)\""
//                        
//                        PushNotificationService().scheduleNotification(
//                            title: title,
//                            subtitle: subtitle
//                        )
                Button("Remind me about a random quote") {
                    if let quote = viewModel.currentQuote {
                        let title = quote.author
                        let subtitle = "\"\(quote.quote)\""

                        notificationService.scheduleNotification(
                            title: title,
                            subtitle: subtitle
                        )
                    }
                }
                
            }
            .navigationTitle("Stranger Things Quotes")
        }
        .onAppear {
            Task {
                await viewModel.getRandomQuote()
            }        }
    }
}

struct Stranger_Previews: PreviewProvider {
    static var previews: some View {
        StrangerView(viewModel: StrangerViewModel())
    }
}
