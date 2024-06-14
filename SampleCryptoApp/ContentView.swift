//
//  ContentView.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/13/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            
            VStack {
                Text("accent Color")
                    .foregroundStyle(Color.theme.accent)
                
                Text("Secondary Text Color")
                    .foregroundStyle(Color.theme.secondaryText)
                
                Text("Red Color")
                    .foregroundStyle(Color.theme.red)
                
                Text("Green Color")
                    .foregroundStyle(Color.theme.green)
            }
            .font(.headline)
        }
    }
    
}

#Preview {
    ContentView()
}
