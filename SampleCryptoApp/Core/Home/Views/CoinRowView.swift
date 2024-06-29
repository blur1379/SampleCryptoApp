//
//  CoinRowView.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/16/24.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingColumns: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn()
            Spacer()
            
            if showHoldingColumns {
                centerColumn()
            }
            
            rightColumn()
        }
        .font(.subheadline)
        .background(Color.green.opacity(0.001).frame(maxWidth: .infinity,maxHeight: .infinity))
    }
}

#Preview {
    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingColumns: true)
}

extension CoinRowView {
    
    @ViewBuilder
    func leftColumn() -> some View {
        Text("\(coin.rank)")
            .font(.caption)
            .foregroundStyle(Color.theme.secondaryText)
            .frame(minWidth: 30)
        
        CoinImageView(coin: coin)
            .frame(width: 30,height: 30)
        
        Text("\(coin.symbol.uppercased())")
            .font(.headline)
            .padding(.leading, 6)
            .foregroundStyle(Color.theme.accent)
        
    }
    
    @ViewBuilder
    func centerColumn() -> some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                .bold()
            Text(coin.priceChange24H?.asNumberString() ?? "0")
        }
        .foregroundStyle(Color.theme.accent)
    }
    
    @ViewBuilder
    func rightColumn() -> some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundStyle(Color.theme.accent)
            
            Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                .foregroundStyle(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.green :
                        Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        
        
    }
}
