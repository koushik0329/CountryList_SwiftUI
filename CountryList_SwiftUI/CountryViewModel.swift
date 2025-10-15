//
//  CountryViewModel.swift
//  CountryList_SwiftUI
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//

import UIKit

@MainActor
class CountryViewModel : ObservableObject {
    @Published var country : [Country] = []
    
    let networkObj : Network
    
    init(networkObj : Network) {
        self.networkObj = networkObj
    }
    
    func loadCountry() async {
        country = await networkObj.fetchData(from: Server.endPoint.rawValue)
    }
    nonisolated func abc() {}
}
