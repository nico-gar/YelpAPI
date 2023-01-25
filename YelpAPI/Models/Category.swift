//
//  Category.swift
//  YelpAPI
//
//  Created by Nicolas Garaycochea on 1/25/23.
//

import Foundation

struct Category {
    var title: String
    var imageName: String
}

//Category Options struct
struct CategoryOptions {
    static var categories: [Category] = [
        Category(title: "Tacos", imageName: "taco"),
        Category(title: "Burgers", imageName: "burger"),
        Category(title: "Sushi", imageName: "sushi"),
        Category(title: "pizza", imageName: "pizza"),
        Category(title: "Pho", imageName: "pho"),
        Category(title: "Chicken", imageName: "fried-chicken"),
        Category(title: "Cafe", imageName: "coffee"),
        Category(title: "Boba Tea", imageName: "bubble-tea")
    ]
}
