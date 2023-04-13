//
//  OnboardingCollectionViewCell.swift
//  M_TRANSACTIONS
//
//  Created by SOFTWARE on 09/04/2023.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
  
    @IBOutlet weak var titleSlide: UILabel!
    static let identifier = String(describing:OnboardingCollectionViewCell.self)
    
 
    @IBOutlet weak var descriptions: UILabel!
    
    @IBOutlet weak var imageSlide: UIImageView!
    func setUp(_ slide:OnbordingSLide){
        imageSlide.image = slide.images
        titleSlide.text = slide.title
        descriptions.text = slide.description
        
    }
}
