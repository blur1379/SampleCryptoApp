//
//  CoinImageView.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/20/24.
//

import SwiftUI

class CoinImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = true
    
    init() {
      getImage()
    }
    
    func getImage() {
        
    }
}

struct CoinImageView: View {
    
    @StateObject var vm: CoinImageViewModel = CoinImageViewModel()
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
}

#Preview {
    CoinImageView()
}
