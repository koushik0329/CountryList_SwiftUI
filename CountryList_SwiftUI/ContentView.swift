//
//  ContentView.swift
//  CountryList_SwiftUI
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var countryViewModel : CountryViewModel
    
    init(countryViewModel: CountryViewModel) {
        self.countryViewModel = countryViewModel
    }
    
    var body: some View {
        NavigationStack{
            VStack() {
                Text("Country")
                    .font(.title)
                
                List(countryViewModel.country, id: \.self) { country in
                    NavigationLink(destination : DetailsView(country: country.name)) {
                        RowView(
                            capital: country.capital ?? "",
                            code: country.code ?? "",
                            flag: country.flag ?? "",
                            name: country.name ?? ""
                            
                        )
                    }
                }
            }
        }
        .task {
            do {
                try await countryViewModel.loadCountry()
            }
            catch {
                print("data not loaded : \(error)")
            }
        }
    }
}

struct RowView : View {
    var capital : String?
    var code : String?
    var flag : String?
    var name : String?
    
    var body : some View {
        
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                Text(capital ?? "")
                    .font(.title3)
                
                Text(code ?? "")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Text(name ?? "")
                .font(.title3)
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
