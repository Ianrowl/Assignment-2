//
//  NewPage.swift
//  Assignment 2
//
//  Created by Ian Rowland on 9/21/23.
//

import SwiftUI

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
        }            .navigationTitle("New Page")
}
}
