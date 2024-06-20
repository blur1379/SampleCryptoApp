//
//  CoinImageService.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/20/24.
//

import SwiftUI
import Combine

class CoinImageService {
    @Published var image: UIImage? = nil
    var imageSubscription: AnyCancellable?
    
    private func getCoinImage(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ (data) -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
                  receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
                self?.imageSubscription?.cancel()
            })
    }
}
