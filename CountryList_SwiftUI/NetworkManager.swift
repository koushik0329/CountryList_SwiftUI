//
//  NetworkManager.swift
//  CountryList_SwiftUI
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//

import UIKit

protocol Network {
    func fetchData(from urlString: String) async -> [Country]
}

class NetworkManager: Network {
    static let shared = NetworkManager()
    init() {}
    
    func fetchData(from urlString: String) async -> [Country] {
        guard let url = URL(string: urlString) else {
            print("invalid url")
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let fetchedData = try JSONDecoder().decode([Country].self, from: data)
            return fetchedData
        }
        catch {
            print("unable to decode the data")
            return []
        }
    }
}
