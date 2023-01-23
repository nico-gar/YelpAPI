//
//  SuggestionCVCell.swift
//  YelpAPI
//
//  Created by Nicolas Garaycochea on 1/23/23.
//

import UIKit

class SuggestionCVCell: UICollectionViewCell {
    
    @IBOutlet weak var businessImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cheeseLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
        
    func updateViews(business: Business?) {
        guard let business = business else {return}
        nameLabel.text = business.name
        priceLabel.text = "Price \(business.price ?? "")"
        cheeseLabel.text = "\(business.location?.city ?? ""), \(business.location?.state ?? "")"
    }
}
