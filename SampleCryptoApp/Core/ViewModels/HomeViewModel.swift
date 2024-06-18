//
//  HomeViewModel.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/17/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoin: [CoinModel] = []
    
    private var dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    init() {
     addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
    }
}
