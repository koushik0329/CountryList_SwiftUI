//
//  NetworkManager.swift
//  CountryList_SwiftUI
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//
import Foundation
import Combine

protocol Network {
    func fetchData(from urlString: String) -> AnyPublisher<[Country], Error>
}

class NetworkManager: Network {
    static let shared = NetworkManager()
    private init() {}
    
    func fetchData(from urlString: String) -> AnyPublisher<[Country], Error> {
        guard let url = URL(string: urlString) else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Country].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
