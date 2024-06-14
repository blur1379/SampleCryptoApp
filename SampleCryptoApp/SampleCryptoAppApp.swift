//
//  SampleCryptoAppApp.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/13/24.
//

import SwiftUI

@main
struct SampleCryptoAppApp: App {


    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .navigationBarHidden(true)
            }

        }
    }
}
