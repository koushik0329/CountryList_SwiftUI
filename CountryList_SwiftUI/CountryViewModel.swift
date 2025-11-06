//
//  CountryViewModel.swift
//  CountryList_SwiftUI
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//

import Combine
import Foundation

@Observable
class CountryViewModel {
    
    var country: [Country] = []
    private var cancellables = Set<AnyCancellable>()
    
    let networkObj: Network
    
    init(networkObj: Network) {
        self.networkObj = networkObj
    }
    
    func loadCountry() {
        networkObj.fetchData(from: Server.endPoint.rawValue)
            .receive(on: DispatchQueue.main)
            .replaceError(with: [])
            .sink { [weak self] fetchedData in
                self?.country = fetchedData
            }
            .store(in: &cancellables)
    }
}
