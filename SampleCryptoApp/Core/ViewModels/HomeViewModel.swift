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
    
    @Published var searchText: String = ""
    
    private var dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
     addSubscribers()
    }
    
    func addSubscribers() {
        $searchText
            .combineLatest(dataService.$allCoins)
            .map { text, startingCoins in
                guard !text.isEmpty else {
                    return startingCoins
                }
                
                let lowercasedText = text.lowercased()
                
                return startingCoins.filter { coin -> Bool in
                    return coin.name.lowercased().contains(lowercasedText) ||
                    coin.symbol.lowercased().contains(lowercasedText) ||
                    coin.id.lowercased().contains(lowercasedText)
                }
            }
            .sink { [weak self] returnedCoin in
                self?.allCoins = returnedCoin
            }
            .store(in: &cancellables)
    }
}
