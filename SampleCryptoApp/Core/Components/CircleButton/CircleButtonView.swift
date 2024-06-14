//
//  CircleButtonView.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/14/24.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
            Circle()
                .fill(Color.theme.background)
            )
            .shadow(color: Color.theme.accent.opacity(0.25), radius: 10, x: 0.0, y: 0.0)
            .padding()
    }
}

#Preview {
    
        CircleButtonView(iconName: "info")
            .previewLayout(.sizeThatFits)
     
    
    
}
