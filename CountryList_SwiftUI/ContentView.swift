//
//  ContentView.swift
//  CountryList_SwiftUI
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//

import SwiftUI

extension Notification.Name {
    static let countrySelected = Notification.Name("countrySelected")
}

struct ContentView: View {
    
    var countryViewModel : CountryViewModel
    @State private var path = NavigationPath()
    
    init(countryViewModel: CountryViewModel) {
        self.countryViewModel = countryViewModel
    }
    
    var body: some View {
            NavigationStack(path: $path) {
                VStack {
                    Text("Country")
                        .font(.title2)
                    
                    List(countryViewModel.country, id: \.self) { country in
                        Button {
                            NotificationCenter.default.post(name: .countrySelected, object: nil, userInfo: ["country": country.name ?? "Unknown"])
                            path.append(country)
                        } label: {
                            RowView(
                                capital: country.capital ?? "",
                                code: country.code ?? "",
                                flag: country.flag ?? "",
                                name: country.name ?? ""
                            )
                        }
                    }
                }
                .navigationDestination(for: Country.self) { country in
                    DetailsView(country: country.name ?? "Unknown")
                }
            }
            .onAppear() {
                countryViewModel.loadCountry()
            }
        }
}

struct RowView : View {
    var capital : String?
    var code : String?
    var flag : String?
    var name : String?
    
    var body : some View {
        HStack{
            
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(capital ?? "")
                        .font(.title3)
                        .foregroundColor(.black)
                    
                    Text(code ?? "")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Text(name ?? "")
                    .font(.title3)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
            Image(systemName: "flag")
        }
    }
}

struct DetailsView : View {
    
    var country: String?
    @State private var selectedCountry: String = ""
    
    var body: some View {
            VStack {
                Text(country ?? "")
                    .font(.headline)
                        Text("Details View")
                            .font(.headline)
                        Text(selectedCountry)
                            .font(.title2)
                    }
                    .onReceive(NotificationCenter.default.publisher(for: .countrySelected)) { notification in
                        if let info = notification.userInfo as? [String: String],
                           let name = info["country"] {
                            selectedCountry = name
                        }
                    }
    }
}
#Preview {
    ContentView(countryViewModel: CountryViewModel(networkObj : NetworkManager.shared))
}
