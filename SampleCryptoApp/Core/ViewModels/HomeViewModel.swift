//
//  HomeViewModel.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/17/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoin: [CoinModel] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(DeveloperPreview.instance.coin)
            self.portfolioCoin.append(DeveloperPreview.instance.coin)
        }
    }
}
