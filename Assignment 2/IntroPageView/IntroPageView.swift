//
//  IntroPageView.swift
//  Assignment 2
//
//  Created by Ian Rowland on 10/8/23.
//

import SwiftUI

struct IntroPageView: View {
    @ObservedObject var viewModel: IntroPageViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                Divider()
                VStack {
                    TextField("Major", text: $viewModel.major)
                    TextField("Grad Year", text: $viewModel.year)
                }
                VStack {
                    Capsule()
                        .foregroundColor(.teal)
                    Text("Their major is \(viewModel.major)")
                        .padding()
                    Text("Their graduation year is \(viewModel.year)")
                        .padding()
                }
                NavigationLink("Show Me More") {
                    NewPageView(viewModel: NewPageViewModel())
                }
            }
            .padding()
            .navigationTitle("Welcome Page")
        }
    }
}
