//
//  CategoryCVCell.swift
//  YelpAPI
//
//  Created by Nicolas Garaycochea on 1/25/23.
//

import UIKit

class CategoryCVCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    var category: Category? {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        guard let category = category else { return }
        categoryTitle.text = category.title
        categoryImageView.image =
        UIImage(named: category.imageName)
    }
}
