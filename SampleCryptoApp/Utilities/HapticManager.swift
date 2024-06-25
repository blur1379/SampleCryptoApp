//
//  HapticManager.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/25/24.
//

import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
