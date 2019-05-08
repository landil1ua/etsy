//
//  CardViewCell.swift
//  marketplace
//
//  Created by Dmitriy on 5/7/19.
//  Copyright © 2019 Dmitriy. All rights reserved.
//

import UIKit

class CardViewCell: UICollectionViewCell {
    
    
    
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardPrice: UILabel!

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
        if let url = card.images?.mediumImage {
            self.cardImage.loadImageFromURL(imageURL: url)
        }
        self.cardPrice.text = configurePriceText(price: card.price, withCurrency: card.currency)
    }
    
    fileprivate func configurePriceText(price: String?, withCurrency currency: String?) -> String {
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

extension CardViewCell: CellInterface { }
