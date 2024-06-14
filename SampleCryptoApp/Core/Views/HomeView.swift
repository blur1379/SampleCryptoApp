//
//  HomeView.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/14/24.
//

import SwiftUI

struct HomeView: View {
    
    
    
    var body: some View {
        ZStack {
            // background layer
            Color.theme.background
            
            // content layer
            VStack {
                Text("header")
                Spacer(minLength: 0)
            }
        }
    }
}

#Preview {
    HomeView()
}
