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
    @IBOutlet weak var cardTitle: UILabel!        //cardTitleLabel
    @IBOutlet weak var cardPrice: UILabel!        //cardPriceLabel

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
        self.cardTitle.text = card.title
        
        //Change ImageViewExtension - make imageURL optional
        if let url = card.images?.mediumImage {
            self.cardImage.loadImageFromURL(imageURL: url)
        }
        self.cardPrice.text = configurePriceText(price: card.price, withCurrency: card.currency)
//        self.cardPrice.text = card.priceWithCurrency
    }
    
}

fileprivate extension CardViewCell {
    
    //Delete this part of the code. Add NSLocale extension and add new property "priceWithCurrency" to Card object.
    func configurePriceText(price: String?, withCurrency currency: String?) -> String {
        guard let price = price, let currency = currency else { return "No price" }
        var fullPrice = ""
        switch currency {
        case "USD", "CAD", "AUD", "NZD":
            fullPrice = "＄\(price)"
        case "EUR":
            fullPrice = "€\(price)"
        case "GBP":
            fullPrice = "￡\(price)"
        default:
            fullPrice = "\(price) \(currency)"
        }
        return fullPrice
    }
    
}
