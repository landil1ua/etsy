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
    
    @IBOutlet weak var cardImageView: UIImageView!    //cardImageView
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        setNeedsLayout()
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.height = ceil(size.height)
        layoutAttributes.frame = frame
        return layoutAttributes
    }
    
    static func returnSize() -> CGSize {
        let width = UIScreen.main.bounds.width
        let height : CGFloat = 230
        
        return CGSize(width: width, height: height)
    }
    
    func configure (with card : Card?) {
        self.cardImageView.image = nil
        guard let card = card else {
            return
        }
        self.cardTitleLabel.text = card.title
        
        //Change ImageViewExtension - make imageURL optional
        if let url = card.images?.mediumImage {
            self.cardImageView.loadImageFromURL(imageURL: url)
        }
        guard let price = card.price else {
            self.cardPriceLabel.text = "No price"
            return
        }
        self.cardPriceLabel.text = price.toCurrency(forCurrencyCode: card.currency)
    }
    
}

