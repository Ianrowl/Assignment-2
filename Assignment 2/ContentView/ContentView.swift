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
            OtherPageView(viewModel: OtherPageViewModel())
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


//struct ContentView: View {
//    var body: some View{
//        TabView {
//            IntroPageView()
//                .tabItem{
//                    Label("Welcome", systemImage: "sun.min")
//                }
//            OtherPageView()
//                .tabItem{
//                    Label("Other", systemImage: "moon")
//            }
//            Countries()
//                .tabItem{
//                    Label("Countries", systemImage: "cloud")
//            }
//            StrangerView()
//                .tabItem{
//                    Label("Quotes", systemImage: "bubble")
//            }
//        }
//    }
//}

//struct IntroPageView: View {
//    @State var major: String = ""
//    @State var year: String = ""
//
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundColor(.accentColor)
//                Text("Hello, world!")
//                Divider()
//                VStack{
//                    TextField("Major", text: $major)
//                    TextField("Grad Year", text: $year)
//                }
//                VStack{
//                    Capsule()
//                        .foregroundColor(.teal)
//              
//                    Text("Their major is \(major)")
//                        .padding()
//                    Text("Their graduation year is \(year)")
//                        .padding()
//                }
//                
//                NavigationLink("Show Me More"){
//                    NewPageView()
//                }
//            }
//            .padding()
//            .navigationTitle("Welcome Page")
//        }
//        }
//}


struct ModalSheet: View{
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        Button("Stop It"){
            dismiss()
        }
    }
}

