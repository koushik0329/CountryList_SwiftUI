//
//  NetworkError.swift
//  CountryList_SwiftUI
//
//  Created by Koushik Reddy Kambham on 10/15/25.
//

import Foundation

enum NetworkError : Error {
    case invalidURL
    case requestFailed(Error)
    
    var error : String {
        switch self {
        case .invalidURL :
            return "invalid URL"
        case .requestFailed(let error):
            return "reuest failed : \(error.localizedDescription)"
        }
    }
}
