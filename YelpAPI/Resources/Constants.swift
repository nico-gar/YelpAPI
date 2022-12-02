//
//  Constants.swift
//  YelpAPI
//
//  Created by Nicolas Garaycochea on 11/30/22.
//

import Foundation

struct Constants {
    static let baseURL = "https://api.yelp.com/v3"
    static let buissnessComponent = "businesses"
    static let searchComponent = "search"
    
    static let apiKey = "ySuNrwI9UgAMW0FLOhfzBVNoxtLtzV2RzdxPRQGQ37EJZKHumDnZH79vsJ-a1RA_4mrID3tie67FQxB28idVFdq07rDZy9Wr_J0NBLTMYG-ALLFK4-_UU5g1wBI9YnYx"
    
    static let header = ["Authorization": "Bearer " + apiKey]
}
