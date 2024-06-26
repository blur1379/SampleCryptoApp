//
//  DetailView.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/25/24.
//

import SwiftUI

struct DetailLoadingView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    var coin: CoinModel
    
    var body: some View {
        
        Text(coin.name)
        
    }
}

struct DetailView_Preview: PreviewProvider {
    
    static var previews: some View {
        
        DetailView(coin: dev.coin )
        
    }
}
