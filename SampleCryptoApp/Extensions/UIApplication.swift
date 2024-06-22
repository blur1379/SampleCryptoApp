//
//  UIApplication.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/22/24.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
