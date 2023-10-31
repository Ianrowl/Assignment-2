//
//  ContentView.swift
//  Hello, World
//
//  Created by Ian Rowland on 8/31/23.
//

import SwiftUI
import AuthenticationServices


struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View{
        TabView {
            IntroPageView(viewModel: IntroPageViewModel())
                .tabItem{
                    Label("Welcome", systemImage: "sun.min")
                }
            OtherPageView()
                .tabItem{
                    Label("Other", systemImage: "moon")
                }
            Countries(viewModel: CountriesViewModel())
                .tabItem{
                    Label("Countries", systemImage: "cloud")
                }
            StrangerView(viewModel: StrangerViewModel())
                .tabItem{
                    Label("Quotes", systemImage: "bubble")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}


struct ModalSheet: View{
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        Button("Stop It"){
            dismiss()
        }
    }
}

