//
//  ContentView.swift
//  Hello, World
//
//  Created by Ian Rowland on 8/31/23.
//

import SwiftUI
import AuthenticationServices

struct ContentView: View {
    @State var major: String = ""
    @State var year: String = ""


    var body: some View {
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
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
