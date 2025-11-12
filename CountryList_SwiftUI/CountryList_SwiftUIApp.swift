//
//  CountryList_SwiftUIApp.swift
//  CountryList_SwiftUI
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//

import SwiftUI

@main
struct CountryList_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
//            ContentView(countryViewModel: CountryViewModel(networkObj: NetworkManager.shared))
            RootView(countryViewModel: CountryViewModel(networkObj: NetworkManager.shared))
        }
    }
}
