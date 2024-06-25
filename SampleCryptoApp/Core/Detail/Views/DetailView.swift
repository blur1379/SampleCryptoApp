//
//  DetailView.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/25/24.
//

import SwiftUI

struct DetailView: View {
    
    let coin: CoinModel
    
    var body: some View {
        Text(coin.name)
    }
}

struct DetailView_Preview: PreviewProvider {
    
    static var previews: some View {
     
        DetailView(coin: dev.coin)
        
    }
}
