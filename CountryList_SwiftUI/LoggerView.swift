//
//  LoggerView.swift
//  CountryList_SwiftUI
//
//  Created by Koushik Reddy Kambham on 11/11/25.
//


import SwiftUI

struct LoggerView: View {
    @State private var lastSelectedCountry: String = "None"

    var body: some View {
        VStack {
            Text("Logger View")
                .font(.headline)
            Text("Last selected: \(lastSelectedCountry)")
                .padding()
        }
        .onReceive(NotificationCenter.default.publisher(for: .countrySelected)) { notification in
            if let info = notification.userInfo as? [String: String],
               let name = info["country"] {
                lastSelectedCountry = name
            }
        }
    }
}
