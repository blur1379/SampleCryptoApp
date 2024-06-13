//
//  SampleCryptoAppApp.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/13/24.
//

import SwiftUI

@main
struct SampleCryptoAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
