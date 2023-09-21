//
//  Other.swift
//  Assignment 2
//
//  Created by Ian Rowland on 9/21/23.
//

import SwiftUI

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

