//
//  Country.swift
//  CountryList_SwiftUI
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//

import Foundation

struct Country : Decodable, Hashable {
    let capital : String?
    let code : String?
    let flag : String?
    let name : String?
}
