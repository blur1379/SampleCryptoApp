//
//  CircleButtonAnimationView.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/15/24.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeInOut(duration: 1.0) : .none)
            .onAppear {
                animate.toggle()
            }
    }
}

#Preview {
    CircleButtonAnimationView()
        .foregroundStyle(.red)
        .frame(width: 100, height: 100)
}
