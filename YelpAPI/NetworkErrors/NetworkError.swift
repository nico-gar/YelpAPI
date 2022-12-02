//
//  NetworkError.swift
//  YelpAPI
//
//  Created by Nicolas Garaycochea on 11/30/22.
//

import Foundation

enum YelpError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
}

enum NetworkError: Error, LocalizedError {
    //Possible types of errors which we've defined
    case badBaseURL
    case badBuiltURL
    case invalidData(String)
    
    //Corresponding string values which we've defined
    var errorsDescription: String? {
        switch self {
        case .badBaseURL:
            return NSLocalizedString("Issue with base URL.", comment: "")
            
        case .badBuiltURL:
            return NSLocalizedString("Issue with URL.", comment: "")
            
        case .invalidData:
            return NSLocalizedString("Issue with data from API call.", comment: "")
        }
    }
}
