//
//  CardViewCell.swift
//  marketplace
//
//  Created by Dmitriy on 5/7/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import UIKit

class CardViewCell: UICollectionViewCell, CellInterface {
    
    //Change properties name
    @IBOutlet weak var cardTitleLabel: UILabel!        //cardTitleLabel
    @IBOutlet weak var cardPriceLabel: UILabel!        //cardPriceLabel
    @IBOutlet weak var cardShopNameLabel: UILabel!
    @IBOutlet weak var cardReviewCountLabel: UILabel!
    
    @IBOutlet weak var cardImageView: UIImageView!    //cardImageView
    
    @IBOutlet weak var stack: UIStackView!
    
    @IBOutlet weak var firstStarImageView: UIImageView!
    @IBOutlet weak var secondStarImageView: UIImageView!
    @IBOutlet weak var thirdStarImageView: UIImageView!
    @IBOutlet weak var fourthStarImageView: UIImageView!
    @IBOutlet weak var fifthStarImageView: UIImageView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static func returnSize() -> CGSize {
        let width = UIScreen.main.bounds.width
        let height : CGFloat = 230
        
        return CGSize(width: width, height: height)
    }
    
    func configure (with card : Card?) {
        self.cardImageView.image = nil
        guard let card = card else { return }
        
        // Set cards title
        self.cardTitleLabel.text = card.title
        
        // Set cards image
        if let url = card.images?.mediumImage {
            self.cardImageView.loadImageFromURL(imageURL: url)
        }
        
        // Set cards shop
        self.cardShopNameLabel.text = card.shopName
        
        // Set cards shop score
        setRatingStars(ratingScore: card.score)
        
        // Set cars shop score count
        if let reviewCount = card.reviewsCount {
            self.cardReviewCountLabel.text = "(\(reviewCount))"
        } 
        
        
        // Set cards price currency
        if let price = card.price?.toCurrency(forCurrencyCode: card.currency) {
            self.cardPriceLabel.text = price
        }
    }
    
    
    func setRatingStars(ratingScore: Int?) {
        
        guard let ratingScore = ratingScore else { return }
        switch ratingScore {
        case 0..<20:
            setStars(count: 1)
        case 20..<40:
            setStars(count: 2)
        case 40..<60:
            setStars(count: 3)
        case 60..<80:
            setStars(count: 4)
        case 80...100:
            setStars(count: 5)

        default:
            self.stack.isHidden = true
        }
    }
    
    fileprivate func setStars(count: Int?) {
        guard let count = count else { return }
        let arr = [firstStarImageView, secondStarImageView, thirdStarImageView, fourthStarImageView, fifthStarImageView]
        for i in 0..<count {
            arr[i]?.image = UIImage(named: "filledStar")
        }
        
    }
}

