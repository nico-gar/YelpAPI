//
//  Yelp.swift
//  YelpAPI
//
//  Created by Nicolas Garaycochea on 11/30/22.
//

import Foundation


struct YelpInfo: Decodable {
    var businesses: [Business]
}

struct Business: Decodable {
    var name: String
    var imageURL: String
    var url: String
    var reviewCount: Int
    var categories: [Categories]
    var rating: Double
    var price: String
    var location: Location?
    var phone: String
    var displayPhone: String
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "image_url"
        case reviewCount = "review_count"
        case displayPhone = "display_phone"
    }
}

struct Categories: Decodable {
    var title: String
}

struct Location: Decodable {
    var city: String
    var state: String
    var displayAddress: String
}
