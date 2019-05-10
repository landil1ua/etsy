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

    @IBOutlet weak var cardImage: UIImageView!    //cardImageView

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func returnSize() -> CGSize {
        let width = UIScreen.main.bounds.width
        let height : CGFloat = 100
        
        return CGSize(width: width, height: height)
    }
    
    func configure (with card : Card?) {
        self.cardImage.image = nil
        guard let card = card else {
            return
        }
        self.cardTitleLabel.text = card.title
        
        //Change ImageViewExtension - make imageURL optional
        if let url = card.images?.mediumImage {
            self.cardImage.loadImageFromURL(imageURL: url)
        }
        guard let price = card.price else {
            self.cardPriceLabel.text = "No price"
            return
        }
        self.cardPriceLabel.text = price.toCurrency(forCurrencyCode: card.currency)
    }
    
}

