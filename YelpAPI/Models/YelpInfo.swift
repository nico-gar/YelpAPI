//
//  YelpInfo.swift
//  YelpAPI
//
//  Created by Nicolas Garaycochea on 11/30/22.
//

import Foundation


struct YelpData: Decodable {
    var businesses: [Business]
}

struct Business: Decodable {
    var name: String
    var rating: Double
    var price: String?
    var phone: String
    var displayPhone: String
    var location: Location?
    var imageURL: String?
    var url: String
    var reviewCount: Int
    var categories: [Categories]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case rating = "rating"
        case price = "price"
        case phone = "phone"
        case displayPhone = "display_phone"
        case location = "location"
        case imageURL = "image_url"
        case url = "url"
        case reviewCount = "review_count"
        case categories = "categories"
    }
}
//Optional
//case name, url, categories, rating, price, location, phone

struct Categories: Decodable {
    var title: String
}

struct Location: Decodable {
    var city: String
    var state: String
    var displayAddress: [String]
    
    enum CodingKeys: String, CodingKey {
        case city = "city"
        case state = "state"
        case displayAddress = "display_address"
    }
}

