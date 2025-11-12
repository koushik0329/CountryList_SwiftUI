//
//  RootView.swift
//  CountryList_SwiftUI
//
//  Created by Koushik Reddy Kambham on 11/11/25.
//

import SwiftUI

struct RootView: View {
    var countryViewModel: CountryViewModel
    
    var body: some View {
        TabView {
            ContentView(countryViewModel: countryViewModel)
                .tabItem { Label("Countries", systemImage: "list.bullet") }
            
            DetailsView()
                .tabItem { Label("Details", systemImage: "info.circle") }
            
            LoggerView()
                .tabItem { Label("Logger", systemImage: "doc.text") }
        }
    }
}

#Preview {
    RootView(countryViewModel: CountryViewModel(networkObj: NetworkManager.shared))
}
