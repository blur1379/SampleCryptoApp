//
//  NetworkingManager.swift
//  SampleCryptoApp
//
//  Created by Mohammad Blur on 6/18/24.
//

import Foundation
import Combine
class NetworkingManager {
    
    static func download(url: URL) -> AnyPublisher<Data,any Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap { try handleURLResponse(output: $0)}
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse ,response.statusCode >= 200 && response.statusCode < 300 else { throw URLError(.badServerResponse) }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let failure):
            print(failure.localizedDescription)
        }
    }
  
}
