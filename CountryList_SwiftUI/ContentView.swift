//
//  ContentView.swift
//  CountryList_SwiftUI
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//

import SwiftUI

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
            .task {
                await countryViewModel.loadCountry()
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
    
    var body: some View {
        Text(country ?? "")
            .font(.headline)
    }
}
#Preview {
    ContentView(countryViewModel: CountryViewModel(networkObj: NetworkManager()))
}
