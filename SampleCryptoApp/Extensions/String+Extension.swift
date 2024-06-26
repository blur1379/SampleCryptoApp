//
//  String+Extension.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/26/24.
//

import Foundation

extension String {
    
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
