//
//  NetworkManager.swift
//  CountryList_SwiftUI
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//

import UIKit

protocol Network {
    func fetchData(from urlString: String) async throws -> [Country]
}

class NetworkManager: Network {
    static let shared = NetworkManager()
    init() {}
    
    func fetchData(from urlString: String) async throws -> [Country] {
        guard let url = URL(string: urlString) else {
            throw NetworkError.invalidURL
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let fetchedData = try JSONDecoder().decode([Country].self, from: data)
            return fetchedData
        }
        catch {
            throw NetworkError.requestFailed(error)
        }
    }
}
