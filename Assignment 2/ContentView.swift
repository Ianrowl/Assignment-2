//
//  ContentView.swift
//  Hello, World
//
//  Created by Ian Rowland on 8/31/23.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    var body: some View{
        TabView {
            IntroPageView()
                .tabItem{
                    Label("Welcome", systemImage: "sun.min")
                }
            OtherPageView()
                .tabItem{
                    Label("Other", systemImage: "moon")
            }
        }
    }
}

struct IntroPageView: View {
    @State var major: String = ""
    @State var year: String = ""


    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                Divider()
                VStack{
                    TextField("Major", text: $major)
                    TextField("Grad Year", text: $year)
                }
                VStack{
                    Capsule()
                        .foregroundColor(.teal)
                    
                    Text("Their major is \(major)")
                        .padding()
                    Text("Their graduation year is \(year)")
                }
                Toggle(isOn: .constant(true)) {
                    Text("HI")
                }
                NavigationLink("Show Me More"){
                    NewPageView()
                }
            }
            .padding()
            .navigationTitle("Welcome Page")
        }
        }
}

struct OtherPageView: View {
    @State private var pressMe = false

    
    var body: some View{
        NavigationView {
            VStack(content:{
                Text("You're here!")
                    .padding()
                Button("MAYBE Press Me?"){
                    pressMe = true
                }
                
                .sheet(isPresented: $pressMe){
                    ModalSheet()
                    
                }
            })
            .padding()
            .navigationTitle("Other Page")
        }}
}

struct NewPageView: View {
    @State private var alertMe = false

    
    var body: some View{
        NavigationView {
            VStack(content:{
                Text("Wow, hey there")
                    .padding()
                
                Button("Press Me!"){
                    alertMe = true
                }
                
                .alert("Wow, now you really made it", isPresented: $alertMe){
                    Button("Nice", role: .cancel){}
                }
            })
            .padding()
            .navigationTitle("New Page")
        }}
}

struct ModalSheet: View{
    @Environment(\.dismiss) var dismiss
    
    var body: some View{
        Button("Stop It"){
            dismiss()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
