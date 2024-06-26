//
//  DetailView.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/25/24.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var coin: CoinModel?
    
    var body: some View {
        if let coin {
            Text(coin.name)
        }
    }
}

struct DetailView_Preview: PreviewProvider {
    
    static var previews: some View {
     
        DetailView(coin: .constant(dev.coin) )
        
    }
}
