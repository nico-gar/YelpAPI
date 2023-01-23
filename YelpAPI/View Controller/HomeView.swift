//
//  HomeView.swift
//  YelpAPI
//
//  Created by Nicolas Garaycochea on 1/23/23.
//

import UIKit

class HomeView: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var driverImage: UIImageView!
    @IBOutlet weak var OrderNowView: UIView!
    @IBOutlet weak var orderButton: IRButton!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var suggestionCollectionView: UICollectionView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var locationIconImage: UIImageView!
    
    
    // MARK - collection view
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
}
